/// Enum representing the importance level of a todo task
enum ImportanceLevel {
  low(0, 'Low'),
  medium(1, 'Medium'),
  high(2, 'High'),
  critical(3, 'Critical');

  const ImportanceLevel(this.value, this.label);

  /// Numeric value for sorting and comparison
  final int value;

  /// Display label
  final String label;
}
