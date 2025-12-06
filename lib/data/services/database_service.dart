import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/todo_task.dart';
import '../models/task_tag.dart';
import '../models/recurring_pattern.dart';

/// Service for managing Isar database initialization and access
class DatabaseService {
  static Isar? _isar;

  /// Initialize the Isar database
  static Future<void> initialize() async {
    if (_isar != null) {
      return; // Already initialized
    }

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [TodoTaskSchema, TaskTagSchema, RecurringPatternSchema],
      directory: dir.path,
      inspector: true, // Enable Isar Inspector for debugging
    );
  }

  /// Get the Isar instance
  static Isar get instance {
    if (_isar == null) {
      throw Exception(
        'Database not initialized. Call DatabaseService.initialize() first.',
      );
    }
    return _isar!;
  }

  /// Close the database (useful for testing)
  static Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}
