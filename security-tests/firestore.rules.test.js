import { after, before, beforeEach, test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  assertFails,
  assertSucceeds,
  initializeTestEnvironment,
} from '@firebase/rules-unit-testing';

import {
  doc,
  getDoc,
  serverTimestamp,
  setDoc,
} from 'firebase/firestore';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const projectId = 'calculo-trivial-security-audit';

let testEnv;

function validProgress(overrides = {}) {
  return {
    completedLessonIds: [],
    completedContentLessonIds: [],

    algebraFundamentalCompleted: false,
    equationsAndInequationsCompleted: false,
    functionsCompleted: false,
    limitsCompleted: false,
    continuityCompleted: false,
    derivativesCompleted: false,

    totalXp: 0,
    totalGold: 0,

    totalAnswerAttempts: 0,
    correctAnswerAttempts: 0,
    incorrectAnswerAttempts: 0,
    accuracy: 0,

    studyStreak: 0,
    lastStudyDate: null,

    dailyAnsweredQuestions: 0,
    dailyQuestionGoal: 5,
    dailyActivityDate: null,

    lastQuestionSessionIds: {},
    recentPracticeQuestionIds: {},
    lastFinalTestSessionIds: {},
    questionPerformance: {},
    lastPersonalizedReviewSessionIds: [],

    dailyChallengeDate: null,
    dailyChallengeCompletedDate: null,
    dailyChallengeQuestionIds: [],
    dailyChallengeBestCorrect: 0,

    updatedAt: serverTimestamp(),

    ...overrides,
  };
}

async function seedProgress(uid, data = validProgress()) {
  await testEnv.withSecurityRulesDisabled(async (context) => {
    const db = context.firestore();

    await setDoc(
      doc(db, 'users', uid, 'progress', 'current'),
      data,
    );
  });
}

before(async () => {
  const rules = readFileSync(
    resolve(__dirname, '..', 'firestore.rules'),
    'utf8',
  );

  testEnv = await initializeTestEnvironment({
    projectId,
    firestore: {
      rules,
      host: '127.0.0.1',
      port: 8080,
    },
  });
});

beforeEach(async () => {
  await testEnv.clearFirestore();
});

after(async () => {
  await testEnv.cleanup();
});

test('usuário autenticado consegue ler o próprio progresso', async () => {
  await seedProgress('user-a');

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertSucceeds(
    getDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
    ),
  );
});

test('usuário anônimo não consegue ler progresso privado', async () => {
  await seedProgress('user-a');

  const db = testEnv
    .unauthenticatedContext()
    .firestore();

  await assertFails(
    getDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
    ),
  );
});

test('usuário A não consegue ler nem alterar progresso do usuário B', async () => {
  await seedProgress('user-b');

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  const otherUserProgress = doc(
    db,
    'users',
    'user-b',
    'progress',
    'current',
  );

  await assertFails(
    getDoc(otherUserProgress),
  );

  await assertFails(
    setDoc(
      otherUserProgress,
      validProgress(),
    ),
  );
});

test('Firestore rejeita campo inesperado no progresso', async () => {
  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      validProgress({
        admin: true,
      }),
    ),
  );
});

test('P1: cliente nao consegue fabricar XP, ouro ou conclusao de modulos', async () => {
  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  const forgedProgress = validProgress({
    completedLessonIds: [
      'algebra-fundamental',
      'equacoes-inequacoes',
      'funcoes',
      'limites',
      'continuidade',
      'derivadas',
    ],

    algebraFundamentalCompleted: true,
    equationsAndInequationsCompleted: true,
    functionsCompleted: true,
    limitsCompleted: true,
    continuityCompleted: true,
    derivativesCompleted: true,

    totalXp: 510,
    totalGold: 225,

    totalAnswerAttempts: 100,
    correctAnswerAttempts: 100,
    incorrectAnswerAttempts: 0,
    accuracy: 1,
    studyStreak: 999,
  });

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      forgedProgress,
    ),
  );
});
test('P1: cliente nao consegue alterar XP, ouro ou conclusao em progresso existente', async () => {
  await seedProgress('user-a');

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  const progressRef = doc(
    db,
    'users',
    'user-a',
    'progress',
    'current',
  );

  await assertFails(
    setDoc(
      progressRef,
      {
        totalXp: 510,
        totalGold: 225,
        derivativesCompleted: true,
        completedLessonIds: ['derivadas'],
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    ),
  );
});

test('cliente ainda consegue atualizar estatisticas sem alterar progresso canonico', async () => {
  await seedProgress('user-a');

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  const progressRef = doc(
    db,
    'users',
    'user-a',
    'progress',
    'current',
  );

  await assertSucceeds(
    setDoc(
      progressRef,
      {
        totalAnswerAttempts: 1,
        correctAnswerAttempts: 1,
        incorrectAnswerAttempts: 0,
        accuracy: 1,
        dailyAnsweredQuestions: 1,
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    ),
  );
});
test('P1: reset canonico nao pode ser usado para adulterar estatisticas', async () => {
  await seedProgress(
    'user-a',
    validProgress({
      completedLessonIds: ['derivadas'],
      derivativesCompleted: true,
      totalXp: 110,
      totalGold: 50,
      totalAnswerAttempts: 10,
      correctAnswerAttempts: 8,
      incorrectAnswerAttempts: 2,
      accuracy: 0.8,
      studyStreak: 5,
    }),
  );

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  const progressRef = doc(
    db,
    'users',
    'user-a',
    'progress',
    'current',
  );

  await assertFails(
    setDoc(
      progressRef,
      validProgress({
        studyStreak: 999,
        totalAnswerAttempts: 1000,
        correctAnswerAttempts: 1000,
        incorrectAnswerAttempts: 0,
        accuracy: 1,
      }),
    ),
  );
});

test('cliente consegue executar reset legitimo completo', async () => {
  await seedProgress(
    'user-a',
    validProgress({
      completedLessonIds: ['derivadas'],
      completedContentLessonIds: ['derivadas-01-significado'],
      derivativesCompleted: true,
      totalXp: 110,
      totalGold: 50,
      totalAnswerAttempts: 10,
      correctAnswerAttempts: 8,
      incorrectAnswerAttempts: 2,
      accuracy: 0.8,
      studyStreak: 5,
      lastStudyDate: '2026-09-11',
      dailyAnsweredQuestions: 3,
      dailyActivityDate: '2026-09-11',
      lastQuestionSessionIds: {
        derivadas: ['q1', 'q2'],
      },
      lastFinalTestSessionIds: {
        derivadas: ['f1', 'f2'],
      },
    }),
  );

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertSucceeds(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      validProgress({
        dailyActivityDate: '2026-09-12',
      }),
    ),
  );
});

test('P1: cliente nao consegue fabricar estatisticas em progresso inicial', async () => {
  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      validProgress({
        totalAnswerAttempts: 1000,
        correctAnswerAttempts: 1000,
        incorrectAnswerAttempts: 0,
        accuracy: 1,
        studyStreak: 999,
        dailyAnsweredQuestions: 999,
      }),
    ),
  );
});

test('P1: cliente nao consegue fabricar estatisticas em progresso existente', async () => {
  await seedProgress('user-a');

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      {
        totalAnswerAttempts: 1000,
        correctAnswerAttempts: 1000,
        incorrectAnswerAttempts: 0,
        accuracy: 1,
        studyStreak: 999,
        dailyAnsweredQuestions: 999,
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    ),
  );
});

test('cliente consegue sincronizar resumo de desempenho da revisão personalizada', async () => {
  await seedProgress('user-a');

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertSucceeds(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      {
        totalAnswerAttempts: 1,
        correctAnswerAttempts: 0,
        incorrectAnswerAttempts: 1,
        accuracy: 0,
        dailyAnsweredQuestions: 1,
        questionPerformance: {
          'simplificacao-1': {
            attempts: 1,
            correct: 0,
            incorrect: 1,
            lastAnswerCorrect: false,
          },
        },
        lastPersonalizedReviewSessionIds: ['simplificacao-1'],
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    ),
  );
});

test('Firestore limita o tamanho do resumo e da sessão de revisão', async () => {
  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  const oversizedPerformance = Object.fromEntries(
    Array.from({ length: 1501 }, (_, index) => [
      `q-${index}`,
      {
        attempts: 1,
        correct: 0,
        incorrect: 1,
        lastAnswerCorrect: false,
      },
    ]),
  );

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      validProgress({
        questionPerformance: oversizedPerformance,
      }),
    ),
  );

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      validProgress({
        lastPersonalizedReviewSessionIds: Array.from(
          { length: 11 },
          (_, index) => `q-${index}`,
        ),
      }),
    ),
  );
});

test('cliente consegue criar e concluir o desafio diário sem alterar progresso canônico', async () => {
  await seedProgress('user-a');

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  const progressRef = doc(
    db,
    'users',
    'user-a',
    'progress',
    'current',
  );

  await assertSucceeds(
    setDoc(
      progressRef,
      {
        dailyChallengeDate: '2026-10-05',
        dailyChallengeCompletedDate: null,
        dailyChallengeQuestionIds: ['q1', 'q2', 'q3', 'q4', 'q5'],
        dailyChallengeBestCorrect: 0,
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    ),
  );

  await assertSucceeds(
    setDoc(
      progressRef,
      {
        dailyChallengeCompletedDate: '2026-10-05',
        dailyChallengeBestCorrect: 4,
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    ),
  );
});

test('Firestore limita payload do desafio diário', async () => {
  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      validProgress({
        dailyChallengeQuestionIds: ['q1', 'q2', 'q3', 'q4', 'q5', 'q6'],
      }),
    ),
  );

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      validProgress({
        dailyChallengeBestCorrect: 6,
      }),
    ),
  );
});

test('cliente consegue sincronizar janela recente de prática', async () => {
  await seedProgress('user-a');

  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertSucceeds(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      {
        recentPracticeQuestionIds: {
          'funcoes': Array.from({ length: 80 }, (_, index) => `q-${index}`),
        },
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    ),
  );
});

test('Firestore limita a janela recente de prática a oitenta questões por módulo', async () => {
  const db = testEnv
    .authenticatedContext('user-a')
    .firestore();

  await assertFails(
    setDoc(
      doc(db, 'users', 'user-a', 'progress', 'current'),
      validProgress({
        recentPracticeQuestionIds: {
          'funcoes': Array.from({ length: 81 }, (_, index) => `q-${index}`),
        },
      }),
    ),
  );
});