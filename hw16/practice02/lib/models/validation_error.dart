class ValidationError {
  final String message;

  const ValidationError(this.message);

  @override
  String toString() => message;
}
