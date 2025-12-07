import '../database/database.dart';

/// Service for managing Drift database initialization and access
class DatabaseService {
  static AppDatabase? _db;

  /// Initialize the Drift database
  static Future<void> initialize() async {
    if (_db != null) {
      return; // Already initialized
    }

    _db = AppDatabase();
  }

  /// Get the AppDatabase instance
  static AppDatabase get instance {
    if (_db == null) {
      throw Exception(
        'Database not initialized. Call DatabaseService.initialize() first.',
      );
    }
    return _db!;
  }

  /// Close the database (useful for testing)
  static Future<void> close() async {
    await _db?.close();
    _db = null;
  }
}
