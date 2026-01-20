class ResultController {
  final String diagnosis;
  final int confidence;
  final String message;

  ResultController({
    required this.diagnosis,
    required this.confidence,
    required this.message,
  });

  static ResultController mock() {
    return ResultController(
      diagnosis: 'Disc Herniation',
      confidence: 93,
      message:
      'The MRI analysis indicates a high probability of disc herniation. Please consult a specialist.',
    );
  }
}
