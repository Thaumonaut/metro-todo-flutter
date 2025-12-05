/// Enum representing the status of a todo task
enum TaskStatus {
  notStarted('Not Started'),
  inProgress('In Progress'),
  onHold('On Hold'),
  completed('Completed');

  const TaskStatus(this.label);

  /// Display label
  final String label;
}
