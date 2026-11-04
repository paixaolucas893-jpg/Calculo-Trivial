/// Server-controlled generation of immutable learning-history events.
///
/// This is read-only client state. A reset in progress must never be treated
/// as an active generation, even when local progress is still available.
class LearningHistoryGenerationState {
  const LearningHistoryGenerationState({
    required this.generation,
    required this.status,
  });

  final int generation;
  final String status;

  bool get allowsNewEvents => status == 'active';

  /// A missing control document represents accounts not yet migrated.
  static const legacy = LearningHistoryGenerationState(
    generation: 0,
    status: 'active',
  );

  /// Reject malformed server states rather than assuming reset succeeded.
  factory LearningHistoryGenerationState.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawGeneration = json['generation'];
    final rawStatus = json['status'];

    if (rawGeneration is! int ||
        rawGeneration < 0 ||
        (rawStatus != 'active' && rawStatus != 'resetting')) {
      throw const FormatException('Invalid learning-history generation state.');
    }

    return LearningHistoryGenerationState(
      generation: rawGeneration,
      status: rawStatus as String,
    );
  }
}
