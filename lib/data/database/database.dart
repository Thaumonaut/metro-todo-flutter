import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class TodoTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get importance => text()(); // Store Enum as String
  TextColumn get status => text()(); // Store Enum as String
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();

  // Computed fields in Isar are stored as normal columns here or computed on read
  // For simplicity and performance in queries, we'll store them if the repo logic expects to write them,
  // otherwise we can make them getters in the data class.
  // The repo logic explicitly writes isDueToday and isOverdue, so we'll store them.
  BoolColumn get isDueToday => boolean().withDefault(const Constant(false))();
  BoolColumn get isOverdue => boolean().withDefault(const Constant(false))();

  // Recurrence
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  BoolColumn get isRecurringTemplate =>
      boolean().withDefault(const Constant(false))();
  IntColumn get recurringPatternId => integer().nullable()();
  TextColumn get recurringSeriesId => text().nullable()();
  DateTimeColumn get recurringOriginalDate => dateTime().nullable()();
  IntColumn get recurringInstanceNumber => integer().nullable()();
  BoolColumn get isRecurringException =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isSkipped => boolean().withDefault(const Constant(false))();
}

class TaskTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  IntColumn get colorValue => integer()();
  TextColumn get icon => text().nullable()();
}

class RecurringPatterns extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // EnumRecurrenceType
  IntColumn get interval => integer().withDefault(const Constant(1))();
  TextColumn get daysOfWeek =>
      text().nullable()(); // List<int> stored as JSON or comma-separated
  TextColumn get daysOfMonth =>
      text().nullable()(); // List<int> stored as JSON or comma-separated
  BoolColumn get lastDayOfMonth => boolean().nullable()();
  IntColumn get nthWeekday => integer().nullable()();
  IntColumn get weekdayOfMonth => integer().nullable()();
  IntColumn get monthOfYear => integer().nullable()();
  IntColumn get dayOfYear => integer().nullable()();
  BoolColumn get skipWeekends => boolean().withDefault(const Constant(false))();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get maxOccurrences => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get seriesId => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get customRule => text().nullable()();
}

class RecurringCompletions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get recurringSeriesId => text()();
  IntColumn get instanceNumber => integer()();
  DateTimeColumn get scheduledDate => dateTime()();
  DateTimeColumn get completedAt => dateTime()();
  TextColumn get note => text().nullable()();
  TextColumn get completedBy => text().nullable()();
}

class TodoTaskTags extends Table {
  IntColumn get taskId =>
      integer().references(TodoTasks, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId =>
      integer().references(TaskTags, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {taskId, tagId};
}

// Recurring Pattern/Completion tables can be added if needed, checking existing files...
// Based on file list, they exist. Let's add them or keep them pending.
// For now, sticking to what's used in TodoRepository.

@DriftDatabase(
  tables: [
    TodoTasks,
    TaskTags,
    TodoTaskTags,
    RecurringPatterns,
    RecurringCompletions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
