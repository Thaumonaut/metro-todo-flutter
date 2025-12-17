// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodoTasksTable extends TodoTasks
    with TableInfo<$TodoTasksTable, TodoTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _importanceMeta =
      const VerificationMeta('importance');
  @override
  late final GeneratedColumn<String> importance = GeneratedColumn<String>(
      'importance', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _reminderDateTimeMeta =
      const VerificationMeta('reminderDateTime');
  @override
  late final GeneratedColumn<DateTime> reminderDateTime =
      GeneratedColumn<DateTime>('reminder_date_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isDueTodayMeta =
      const VerificationMeta('isDueToday');
  @override
  late final GeneratedColumn<bool> isDueToday = GeneratedColumn<bool>(
      'is_due_today', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_due_today" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isOverdueMeta =
      const VerificationMeta('isOverdue');
  @override
  late final GeneratedColumn<bool> isOverdue = GeneratedColumn<bool>(
      'is_overdue', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_overdue" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isRecurringMeta =
      const VerificationMeta('isRecurring');
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
      'is_recurring', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_recurring" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isRecurringTemplateMeta =
      const VerificationMeta('isRecurringTemplate');
  @override
  late final GeneratedColumn<bool> isRecurringTemplate = GeneratedColumn<bool>(
      'is_recurring_template', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_recurring_template" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _recurringPatternIdMeta =
      const VerificationMeta('recurringPatternId');
  @override
  late final GeneratedColumn<int> recurringPatternId = GeneratedColumn<int>(
      'recurring_pattern_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _recurringSeriesIdMeta =
      const VerificationMeta('recurringSeriesId');
  @override
  late final GeneratedColumn<String> recurringSeriesId =
      GeneratedColumn<String>('recurring_series_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recurringOriginalDateMeta =
      const VerificationMeta('recurringOriginalDate');
  @override
  late final GeneratedColumn<DateTime> recurringOriginalDate =
      GeneratedColumn<DateTime>('recurring_original_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _recurringInstanceNumberMeta =
      const VerificationMeta('recurringInstanceNumber');
  @override
  late final GeneratedColumn<int> recurringInstanceNumber =
      GeneratedColumn<int>('recurring_instance_number', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isRecurringExceptionMeta =
      const VerificationMeta('isRecurringException');
  @override
  late final GeneratedColumn<bool> isRecurringException = GeneratedColumn<bool>(
      'is_recurring_exception', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_recurring_exception" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isSkippedMeta =
      const VerificationMeta('isSkipped');
  @override
  late final GeneratedColumn<bool> isSkipped = GeneratedColumn<bool>(
      'is_skipped', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_skipped" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _taskTypeMeta =
      const VerificationMeta('taskType');
  @override
  late final GeneratedColumn<String> taskType = GeneratedColumn<String>(
      'task_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('standard'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        title,
        description,
        importance,
        status,
        dueDate,
        reminderDateTime,
        createdAt,
        completedAt,
        isCompleted,
        isDueToday,
        isOverdue,
        isRecurring,
        isRecurringTemplate,
        recurringPatternId,
        recurringSeriesId,
        recurringOriginalDate,
        recurringInstanceNumber,
        isRecurringException,
        isSkipped,
        taskType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<TodoTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('importance')) {
      context.handle(
          _importanceMeta,
          importance.isAcceptableOrUnknown(
              data['importance']!, _importanceMeta));
    } else if (isInserting) {
      context.missing(_importanceMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('reminder_date_time')) {
      context.handle(
          _reminderDateTimeMeta,
          reminderDateTime.isAcceptableOrUnknown(
              data['reminder_date_time']!, _reminderDateTimeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('is_due_today')) {
      context.handle(
          _isDueTodayMeta,
          isDueToday.isAcceptableOrUnknown(
              data['is_due_today']!, _isDueTodayMeta));
    }
    if (data.containsKey('is_overdue')) {
      context.handle(_isOverdueMeta,
          isOverdue.isAcceptableOrUnknown(data['is_overdue']!, _isOverdueMeta));
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
          _isRecurringMeta,
          isRecurring.isAcceptableOrUnknown(
              data['is_recurring']!, _isRecurringMeta));
    }
    if (data.containsKey('is_recurring_template')) {
      context.handle(
          _isRecurringTemplateMeta,
          isRecurringTemplate.isAcceptableOrUnknown(
              data['is_recurring_template']!, _isRecurringTemplateMeta));
    }
    if (data.containsKey('recurring_pattern_id')) {
      context.handle(
          _recurringPatternIdMeta,
          recurringPatternId.isAcceptableOrUnknown(
              data['recurring_pattern_id']!, _recurringPatternIdMeta));
    }
    if (data.containsKey('recurring_series_id')) {
      context.handle(
          _recurringSeriesIdMeta,
          recurringSeriesId.isAcceptableOrUnknown(
              data['recurring_series_id']!, _recurringSeriesIdMeta));
    }
    if (data.containsKey('recurring_original_date')) {
      context.handle(
          _recurringOriginalDateMeta,
          recurringOriginalDate.isAcceptableOrUnknown(
              data['recurring_original_date']!, _recurringOriginalDateMeta));
    }
    if (data.containsKey('recurring_instance_number')) {
      context.handle(
          _recurringInstanceNumberMeta,
          recurringInstanceNumber.isAcceptableOrUnknown(
              data['recurring_instance_number']!,
              _recurringInstanceNumberMeta));
    }
    if (data.containsKey('is_recurring_exception')) {
      context.handle(
          _isRecurringExceptionMeta,
          isRecurringException.isAcceptableOrUnknown(
              data['is_recurring_exception']!, _isRecurringExceptionMeta));
    }
    if (data.containsKey('is_skipped')) {
      context.handle(_isSkippedMeta,
          isSkipped.isAcceptableOrUnknown(data['is_skipped']!, _isSkippedMeta));
    }
    if (data.containsKey('task_type')) {
      context.handle(_taskTypeMeta,
          taskType.isAcceptableOrUnknown(data['task_type']!, _taskTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoTask(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      importance: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}importance'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      reminderDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}reminder_date_time']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      isDueToday: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_due_today'])!,
      isOverdue: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_overdue'])!,
      isRecurring: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_recurring'])!,
      isRecurringTemplate: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_recurring_template'])!,
      recurringPatternId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}recurring_pattern_id']),
      recurringSeriesId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}recurring_series_id']),
      recurringOriginalDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}recurring_original_date']),
      recurringInstanceNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}recurring_instance_number']),
      isRecurringException: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_recurring_exception'])!,
      isSkipped: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_skipped'])!,
      taskType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_type'])!,
    );
  }

  @override
  $TodoTasksTable createAlias(String alias) {
    return $TodoTasksTable(attachedDatabase, alias);
  }
}

class TodoTask extends DataClass implements Insertable<TodoTask> {
  final int id;
  final String uuid;
  final String title;
  final String? description;
  final String importance;
  final String status;
  final DateTime? dueDate;
  final DateTime? reminderDateTime;
  final DateTime createdAt;
  final DateTime? completedAt;
  final bool isCompleted;
  final bool isDueToday;
  final bool isOverdue;
  final bool isRecurring;
  final bool isRecurringTemplate;
  final int? recurringPatternId;
  final String? recurringSeriesId;
  final DateTime? recurringOriginalDate;
  final int? recurringInstanceNumber;
  final bool isRecurringException;
  final bool isSkipped;
  final String taskType;
  const TodoTask(
      {required this.id,
      required this.uuid,
      required this.title,
      this.description,
      required this.importance,
      required this.status,
      this.dueDate,
      this.reminderDateTime,
      required this.createdAt,
      this.completedAt,
      required this.isCompleted,
      required this.isDueToday,
      required this.isOverdue,
      required this.isRecurring,
      required this.isRecurringTemplate,
      this.recurringPatternId,
      this.recurringSeriesId,
      this.recurringOriginalDate,
      this.recurringInstanceNumber,
      required this.isRecurringException,
      required this.isSkipped,
      required this.taskType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['importance'] = Variable<String>(importance);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || reminderDateTime != null) {
      map['reminder_date_time'] = Variable<DateTime>(reminderDateTime);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_due_today'] = Variable<bool>(isDueToday);
    map['is_overdue'] = Variable<bool>(isOverdue);
    map['is_recurring'] = Variable<bool>(isRecurring);
    map['is_recurring_template'] = Variable<bool>(isRecurringTemplate);
    if (!nullToAbsent || recurringPatternId != null) {
      map['recurring_pattern_id'] = Variable<int>(recurringPatternId);
    }
    if (!nullToAbsent || recurringSeriesId != null) {
      map['recurring_series_id'] = Variable<String>(recurringSeriesId);
    }
    if (!nullToAbsent || recurringOriginalDate != null) {
      map['recurring_original_date'] =
          Variable<DateTime>(recurringOriginalDate);
    }
    if (!nullToAbsent || recurringInstanceNumber != null) {
      map['recurring_instance_number'] = Variable<int>(recurringInstanceNumber);
    }
    map['is_recurring_exception'] = Variable<bool>(isRecurringException);
    map['is_skipped'] = Variable<bool>(isSkipped);
    map['task_type'] = Variable<String>(taskType);
    return map;
  }

  TodoTasksCompanion toCompanion(bool nullToAbsent) {
    return TodoTasksCompanion(
      id: Value(id),
      uuid: Value(uuid),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      importance: Value(importance),
      status: Value(status),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      reminderDateTime: reminderDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderDateTime),
      createdAt: Value(createdAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      isCompleted: Value(isCompleted),
      isDueToday: Value(isDueToday),
      isOverdue: Value(isOverdue),
      isRecurring: Value(isRecurring),
      isRecurringTemplate: Value(isRecurringTemplate),
      recurringPatternId: recurringPatternId == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringPatternId),
      recurringSeriesId: recurringSeriesId == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringSeriesId),
      recurringOriginalDate: recurringOriginalDate == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringOriginalDate),
      recurringInstanceNumber: recurringInstanceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringInstanceNumber),
      isRecurringException: Value(isRecurringException),
      isSkipped: Value(isSkipped),
      taskType: Value(taskType),
    );
  }

  factory TodoTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoTask(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      importance: serializer.fromJson<String>(json['importance']),
      status: serializer.fromJson<String>(json['status']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      reminderDateTime:
          serializer.fromJson<DateTime?>(json['reminderDateTime']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isDueToday: serializer.fromJson<bool>(json['isDueToday']),
      isOverdue: serializer.fromJson<bool>(json['isOverdue']),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      isRecurringTemplate:
          serializer.fromJson<bool>(json['isRecurringTemplate']),
      recurringPatternId: serializer.fromJson<int?>(json['recurringPatternId']),
      recurringSeriesId:
          serializer.fromJson<String?>(json['recurringSeriesId']),
      recurringOriginalDate:
          serializer.fromJson<DateTime?>(json['recurringOriginalDate']),
      recurringInstanceNumber:
          serializer.fromJson<int?>(json['recurringInstanceNumber']),
      isRecurringException:
          serializer.fromJson<bool>(json['isRecurringException']),
      isSkipped: serializer.fromJson<bool>(json['isSkipped']),
      taskType: serializer.fromJson<String>(json['taskType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'importance': serializer.toJson<String>(importance),
      'status': serializer.toJson<String>(status),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'reminderDateTime': serializer.toJson<DateTime?>(reminderDateTime),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isDueToday': serializer.toJson<bool>(isDueToday),
      'isOverdue': serializer.toJson<bool>(isOverdue),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'isRecurringTemplate': serializer.toJson<bool>(isRecurringTemplate),
      'recurringPatternId': serializer.toJson<int?>(recurringPatternId),
      'recurringSeriesId': serializer.toJson<String?>(recurringSeriesId),
      'recurringOriginalDate':
          serializer.toJson<DateTime?>(recurringOriginalDate),
      'recurringInstanceNumber':
          serializer.toJson<int?>(recurringInstanceNumber),
      'isRecurringException': serializer.toJson<bool>(isRecurringException),
      'isSkipped': serializer.toJson<bool>(isSkipped),
      'taskType': serializer.toJson<String>(taskType),
    };
  }

  TodoTask copyWith(
          {int? id,
          String? uuid,
          String? title,
          Value<String?> description = const Value.absent(),
          String? importance,
          String? status,
          Value<DateTime?> dueDate = const Value.absent(),
          Value<DateTime?> reminderDateTime = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> completedAt = const Value.absent(),
          bool? isCompleted,
          bool? isDueToday,
          bool? isOverdue,
          bool? isRecurring,
          bool? isRecurringTemplate,
          Value<int?> recurringPatternId = const Value.absent(),
          Value<String?> recurringSeriesId = const Value.absent(),
          Value<DateTime?> recurringOriginalDate = const Value.absent(),
          Value<int?> recurringInstanceNumber = const Value.absent(),
          bool? isRecurringException,
          bool? isSkipped,
          String? taskType}) =>
      TodoTask(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        importance: importance ?? this.importance,
        status: status ?? this.status,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        reminderDateTime: reminderDateTime.present
            ? reminderDateTime.value
            : this.reminderDateTime,
        createdAt: createdAt ?? this.createdAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        isCompleted: isCompleted ?? this.isCompleted,
        isDueToday: isDueToday ?? this.isDueToday,
        isOverdue: isOverdue ?? this.isOverdue,
        isRecurring: isRecurring ?? this.isRecurring,
        isRecurringTemplate: isRecurringTemplate ?? this.isRecurringTemplate,
        recurringPatternId: recurringPatternId.present
            ? recurringPatternId.value
            : this.recurringPatternId,
        recurringSeriesId: recurringSeriesId.present
            ? recurringSeriesId.value
            : this.recurringSeriesId,
        recurringOriginalDate: recurringOriginalDate.present
            ? recurringOriginalDate.value
            : this.recurringOriginalDate,
        recurringInstanceNumber: recurringInstanceNumber.present
            ? recurringInstanceNumber.value
            : this.recurringInstanceNumber,
        isRecurringException: isRecurringException ?? this.isRecurringException,
        isSkipped: isSkipped ?? this.isSkipped,
        taskType: taskType ?? this.taskType,
      );
  @override
  String toString() {
    return (StringBuffer('TodoTask(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('importance: $importance, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('reminderDateTime: $reminderDateTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isDueToday: $isDueToday, ')
          ..write('isOverdue: $isOverdue, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('isRecurringTemplate: $isRecurringTemplate, ')
          ..write('recurringPatternId: $recurringPatternId, ')
          ..write('recurringSeriesId: $recurringSeriesId, ')
          ..write('recurringOriginalDate: $recurringOriginalDate, ')
          ..write('recurringInstanceNumber: $recurringInstanceNumber, ')
          ..write('isRecurringException: $isRecurringException, ')
          ..write('isSkipped: $isSkipped, ')
          ..write('taskType: $taskType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        uuid,
        title,
        description,
        importance,
        status,
        dueDate,
        reminderDateTime,
        createdAt,
        completedAt,
        isCompleted,
        isDueToday,
        isOverdue,
        isRecurring,
        isRecurringTemplate,
        recurringPatternId,
        recurringSeriesId,
        recurringOriginalDate,
        recurringInstanceNumber,
        isRecurringException,
        isSkipped,
        taskType
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoTask &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.title == this.title &&
          other.description == this.description &&
          other.importance == this.importance &&
          other.status == this.status &&
          other.dueDate == this.dueDate &&
          other.reminderDateTime == this.reminderDateTime &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt &&
          other.isCompleted == this.isCompleted &&
          other.isDueToday == this.isDueToday &&
          other.isOverdue == this.isOverdue &&
          other.isRecurring == this.isRecurring &&
          other.isRecurringTemplate == this.isRecurringTemplate &&
          other.recurringPatternId == this.recurringPatternId &&
          other.recurringSeriesId == this.recurringSeriesId &&
          other.recurringOriginalDate == this.recurringOriginalDate &&
          other.recurringInstanceNumber == this.recurringInstanceNumber &&
          other.isRecurringException == this.isRecurringException &&
          other.isSkipped == this.isSkipped &&
          other.taskType == this.taskType);
}

class TodoTasksCompanion extends UpdateCompanion<TodoTask> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> importance;
  final Value<String> status;
  final Value<DateTime?> dueDate;
  final Value<DateTime?> reminderDateTime;
  final Value<DateTime> createdAt;
  final Value<DateTime?> completedAt;
  final Value<bool> isCompleted;
  final Value<bool> isDueToday;
  final Value<bool> isOverdue;
  final Value<bool> isRecurring;
  final Value<bool> isRecurringTemplate;
  final Value<int?> recurringPatternId;
  final Value<String?> recurringSeriesId;
  final Value<DateTime?> recurringOriginalDate;
  final Value<int?> recurringInstanceNumber;
  final Value<bool> isRecurringException;
  final Value<bool> isSkipped;
  final Value<String> taskType;
  const TodoTasksCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.importance = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.reminderDateTime = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isDueToday = const Value.absent(),
    this.isOverdue = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.isRecurringTemplate = const Value.absent(),
    this.recurringPatternId = const Value.absent(),
    this.recurringSeriesId = const Value.absent(),
    this.recurringOriginalDate = const Value.absent(),
    this.recurringInstanceNumber = const Value.absent(),
    this.isRecurringException = const Value.absent(),
    this.isSkipped = const Value.absent(),
    this.taskType = const Value.absent(),
  });
  TodoTasksCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String title,
    this.description = const Value.absent(),
    required String importance,
    required String status,
    this.dueDate = const Value.absent(),
    this.reminderDateTime = const Value.absent(),
    required DateTime createdAt,
    this.completedAt = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isDueToday = const Value.absent(),
    this.isOverdue = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.isRecurringTemplate = const Value.absent(),
    this.recurringPatternId = const Value.absent(),
    this.recurringSeriesId = const Value.absent(),
    this.recurringOriginalDate = const Value.absent(),
    this.recurringInstanceNumber = const Value.absent(),
    this.isRecurringException = const Value.absent(),
    this.isSkipped = const Value.absent(),
    this.taskType = const Value.absent(),
  })  : uuid = Value(uuid),
        title = Value(title),
        importance = Value(importance),
        status = Value(status),
        createdAt = Value(createdAt);
  static Insertable<TodoTask> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? importance,
    Expression<String>? status,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? reminderDateTime,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? completedAt,
    Expression<bool>? isCompleted,
    Expression<bool>? isDueToday,
    Expression<bool>? isOverdue,
    Expression<bool>? isRecurring,
    Expression<bool>? isRecurringTemplate,
    Expression<int>? recurringPatternId,
    Expression<String>? recurringSeriesId,
    Expression<DateTime>? recurringOriginalDate,
    Expression<int>? recurringInstanceNumber,
    Expression<bool>? isRecurringException,
    Expression<bool>? isSkipped,
    Expression<String>? taskType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (importance != null) 'importance': importance,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
      if (reminderDateTime != null) 'reminder_date_time': reminderDateTime,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isDueToday != null) 'is_due_today': isDueToday,
      if (isOverdue != null) 'is_overdue': isOverdue,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (isRecurringTemplate != null)
        'is_recurring_template': isRecurringTemplate,
      if (recurringPatternId != null)
        'recurring_pattern_id': recurringPatternId,
      if (recurringSeriesId != null) 'recurring_series_id': recurringSeriesId,
      if (recurringOriginalDate != null)
        'recurring_original_date': recurringOriginalDate,
      if (recurringInstanceNumber != null)
        'recurring_instance_number': recurringInstanceNumber,
      if (isRecurringException != null)
        'is_recurring_exception': isRecurringException,
      if (isSkipped != null) 'is_skipped': isSkipped,
      if (taskType != null) 'task_type': taskType,
    });
  }

  TodoTasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? importance,
      Value<String>? status,
      Value<DateTime?>? dueDate,
      Value<DateTime?>? reminderDateTime,
      Value<DateTime>? createdAt,
      Value<DateTime?>? completedAt,
      Value<bool>? isCompleted,
      Value<bool>? isDueToday,
      Value<bool>? isOverdue,
      Value<bool>? isRecurring,
      Value<bool>? isRecurringTemplate,
      Value<int?>? recurringPatternId,
      Value<String?>? recurringSeriesId,
      Value<DateTime?>? recurringOriginalDate,
      Value<int?>? recurringInstanceNumber,
      Value<bool>? isRecurringException,
      Value<bool>? isSkipped,
      Value<String>? taskType}) {
    return TodoTasksCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      importance: importance ?? this.importance,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      reminderDateTime: reminderDateTime ?? this.reminderDateTime,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      isCompleted: isCompleted ?? this.isCompleted,
      isDueToday: isDueToday ?? this.isDueToday,
      isOverdue: isOverdue ?? this.isOverdue,
      isRecurring: isRecurring ?? this.isRecurring,
      isRecurringTemplate: isRecurringTemplate ?? this.isRecurringTemplate,
      recurringPatternId: recurringPatternId ?? this.recurringPatternId,
      recurringSeriesId: recurringSeriesId ?? this.recurringSeriesId,
      recurringOriginalDate:
          recurringOriginalDate ?? this.recurringOriginalDate,
      recurringInstanceNumber:
          recurringInstanceNumber ?? this.recurringInstanceNumber,
      isRecurringException: isRecurringException ?? this.isRecurringException,
      isSkipped: isSkipped ?? this.isSkipped,
      taskType: taskType ?? this.taskType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (importance.present) {
      map['importance'] = Variable<String>(importance.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (reminderDateTime.present) {
      map['reminder_date_time'] = Variable<DateTime>(reminderDateTime.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isDueToday.present) {
      map['is_due_today'] = Variable<bool>(isDueToday.value);
    }
    if (isOverdue.present) {
      map['is_overdue'] = Variable<bool>(isOverdue.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (isRecurringTemplate.present) {
      map['is_recurring_template'] = Variable<bool>(isRecurringTemplate.value);
    }
    if (recurringPatternId.present) {
      map['recurring_pattern_id'] = Variable<int>(recurringPatternId.value);
    }
    if (recurringSeriesId.present) {
      map['recurring_series_id'] = Variable<String>(recurringSeriesId.value);
    }
    if (recurringOriginalDate.present) {
      map['recurring_original_date'] =
          Variable<DateTime>(recurringOriginalDate.value);
    }
    if (recurringInstanceNumber.present) {
      map['recurring_instance_number'] =
          Variable<int>(recurringInstanceNumber.value);
    }
    if (isRecurringException.present) {
      map['is_recurring_exception'] =
          Variable<bool>(isRecurringException.value);
    }
    if (isSkipped.present) {
      map['is_skipped'] = Variable<bool>(isSkipped.value);
    }
    if (taskType.present) {
      map['task_type'] = Variable<String>(taskType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoTasksCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('importance: $importance, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('reminderDateTime: $reminderDateTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isDueToday: $isDueToday, ')
          ..write('isOverdue: $isOverdue, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('isRecurringTemplate: $isRecurringTemplate, ')
          ..write('recurringPatternId: $recurringPatternId, ')
          ..write('recurringSeriesId: $recurringSeriesId, ')
          ..write('recurringOriginalDate: $recurringOriginalDate, ')
          ..write('recurringInstanceNumber: $recurringInstanceNumber, ')
          ..write('isRecurringException: $isRecurringException, ')
          ..write('isSkipped: $isSkipped, ')
          ..write('taskType: $taskType')
          ..write(')'))
        .toString();
  }
}

class $TaskTagsTable extends TaskTags with TableInfo<$TaskTagsTable, TaskTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _colorValueMeta =
      const VerificationMeta('colorValue');
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
      'color_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, colorValue, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_tags';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
          _colorValueMeta,
          colorValue.isAcceptableOrUnknown(
              data['color_value']!, _colorValueMeta));
    } else if (isInserting) {
      context.missing(_colorValueMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_value'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
    );
  }

  @override
  $TaskTagsTable createAlias(String alias) {
    return $TaskTagsTable(attachedDatabase, alias);
  }
}

class TaskTag extends DataClass implements Insertable<TaskTag> {
  final int id;
  final String name;
  final int colorValue;
  final String? icon;
  const TaskTag(
      {required this.id,
      required this.name,
      required this.colorValue,
      this.icon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color_value'] = Variable<int>(colorValue);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    return map;
  }

  TaskTagsCompanion toCompanion(bool nullToAbsent) {
    return TaskTagsCompanion(
      id: Value(id),
      name: Value(name),
      colorValue: Value(colorValue),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
    );
  }

  factory TaskTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      icon: serializer.fromJson<String?>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'colorValue': serializer.toJson<int>(colorValue),
      'icon': serializer.toJson<String?>(icon),
    };
  }

  TaskTag copyWith(
          {int? id,
          String? name,
          int? colorValue,
          Value<String?> icon = const Value.absent()}) =>
      TaskTag(
        id: id ?? this.id,
        name: name ?? this.name,
        colorValue: colorValue ?? this.colorValue,
        icon: icon.present ? icon.value : this.icon,
      );
  @override
  String toString() {
    return (StringBuffer('TaskTag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorValue: $colorValue, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorValue, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTag &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorValue == this.colorValue &&
          other.icon == this.icon);
}

class TaskTagsCompanion extends UpdateCompanion<TaskTag> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> colorValue;
  final Value<String?> icon;
  const TaskTagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.icon = const Value.absent(),
  });
  TaskTagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int colorValue,
    this.icon = const Value.absent(),
  })  : name = Value(name),
        colorValue = Value(colorValue);
  static Insertable<TaskTag> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? colorValue,
    Expression<String>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorValue != null) 'color_value': colorValue,
      if (icon != null) 'icon': icon,
    });
  }

  TaskTagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? colorValue,
      Value<String?>? icon}) {
    return TaskTagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorValue: colorValue ?? this.colorValue,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorValue: $colorValue, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $TodoTaskTagsTable extends TodoTaskTags
    with TableInfo<$TodoTaskTagsTable, TodoTaskTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTaskTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES task_tags (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [taskId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_task_tags';
  @override
  VerificationContext validateIntegrity(Insertable<TodoTaskTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {taskId, tagId};
  @override
  TodoTaskTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoTaskTag(
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $TodoTaskTagsTable createAlias(String alias) {
    return $TodoTaskTagsTable(attachedDatabase, alias);
  }
}

class TodoTaskTag extends DataClass implements Insertable<TodoTaskTag> {
  final int taskId;
  final int tagId;
  const TodoTaskTag({required this.taskId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task_id'] = Variable<int>(taskId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  TodoTaskTagsCompanion toCompanion(bool nullToAbsent) {
    return TodoTaskTagsCompanion(
      taskId: Value(taskId),
      tagId: Value(tagId),
    );
  }

  factory TodoTaskTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoTaskTag(
      taskId: serializer.fromJson<int>(json['taskId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskId': serializer.toJson<int>(taskId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  TodoTaskTag copyWith({int? taskId, int? tagId}) => TodoTaskTag(
        taskId: taskId ?? this.taskId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('TodoTaskTag(')
          ..write('taskId: $taskId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(taskId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoTaskTag &&
          other.taskId == this.taskId &&
          other.tagId == this.tagId);
}

class TodoTaskTagsCompanion extends UpdateCompanion<TodoTaskTag> {
  final Value<int> taskId;
  final Value<int> tagId;
  final Value<int> rowid;
  const TodoTaskTagsCompanion({
    this.taskId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoTaskTagsCompanion.insert({
    required int taskId,
    required int tagId,
    this.rowid = const Value.absent(),
  })  : taskId = Value(taskId),
        tagId = Value(tagId);
  static Insertable<TodoTaskTag> custom({
    Expression<int>? taskId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (taskId != null) 'task_id': taskId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoTaskTagsCompanion copyWith(
      {Value<int>? taskId, Value<int>? tagId, Value<int>? rowid}) {
    return TodoTaskTagsCompanion(
      taskId: taskId ?? this.taskId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoTaskTagsCompanion(')
          ..write('taskId: $taskId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecurringPatternsTable extends RecurringPatterns
    with TableInfo<$RecurringPatternsTable, RecurringPattern> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecurringPatternsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _intervalMeta =
      const VerificationMeta('interval');
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
      'interval', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _daysOfWeekMeta =
      const VerificationMeta('daysOfWeek');
  @override
  late final GeneratedColumn<String> daysOfWeek = GeneratedColumn<String>(
      'days_of_week', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _daysOfMonthMeta =
      const VerificationMeta('daysOfMonth');
  @override
  late final GeneratedColumn<String> daysOfMonth = GeneratedColumn<String>(
      'days_of_month', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastDayOfMonthMeta =
      const VerificationMeta('lastDayOfMonth');
  @override
  late final GeneratedColumn<bool> lastDayOfMonth = GeneratedColumn<bool>(
      'last_day_of_month', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("last_day_of_month" IN (0, 1))'));
  static const VerificationMeta _nthWeekdayMeta =
      const VerificationMeta('nthWeekday');
  @override
  late final GeneratedColumn<int> nthWeekday = GeneratedColumn<int>(
      'nth_weekday', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weekdayOfMonthMeta =
      const VerificationMeta('weekdayOfMonth');
  @override
  late final GeneratedColumn<int> weekdayOfMonth = GeneratedColumn<int>(
      'weekday_of_month', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _monthOfYearMeta =
      const VerificationMeta('monthOfYear');
  @override
  late final GeneratedColumn<int> monthOfYear = GeneratedColumn<int>(
      'month_of_year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dayOfYearMeta =
      const VerificationMeta('dayOfYear');
  @override
  late final GeneratedColumn<int> dayOfYear = GeneratedColumn<int>(
      'day_of_year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _skipWeekendsMeta =
      const VerificationMeta('skipWeekends');
  @override
  late final GeneratedColumn<bool> skipWeekends = GeneratedColumn<bool>(
      'skip_weekends', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("skip_weekends" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _maxOccurrencesMeta =
      const VerificationMeta('maxOccurrences');
  @override
  late final GeneratedColumn<int> maxOccurrences = GeneratedColumn<int>(
      'max_occurrences', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _seriesIdMeta =
      const VerificationMeta('seriesId');
  @override
  late final GeneratedColumn<String> seriesId = GeneratedColumn<String>(
      'series_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _customRuleMeta =
      const VerificationMeta('customRule');
  @override
  late final GeneratedColumn<String> customRule = GeneratedColumn<String>(
      'custom_rule', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        interval,
        daysOfWeek,
        daysOfMonth,
        lastDayOfMonth,
        nthWeekday,
        weekdayOfMonth,
        monthOfYear,
        dayOfYear,
        skipWeekends,
        endDate,
        maxOccurrences,
        createdAt,
        seriesId,
        isActive,
        customRule
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recurring_patterns';
  @override
  VerificationContext validateIntegrity(Insertable<RecurringPattern> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('interval')) {
      context.handle(_intervalMeta,
          interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta));
    }
    if (data.containsKey('days_of_week')) {
      context.handle(
          _daysOfWeekMeta,
          daysOfWeek.isAcceptableOrUnknown(
              data['days_of_week']!, _daysOfWeekMeta));
    }
    if (data.containsKey('days_of_month')) {
      context.handle(
          _daysOfMonthMeta,
          daysOfMonth.isAcceptableOrUnknown(
              data['days_of_month']!, _daysOfMonthMeta));
    }
    if (data.containsKey('last_day_of_month')) {
      context.handle(
          _lastDayOfMonthMeta,
          lastDayOfMonth.isAcceptableOrUnknown(
              data['last_day_of_month']!, _lastDayOfMonthMeta));
    }
    if (data.containsKey('nth_weekday')) {
      context.handle(
          _nthWeekdayMeta,
          nthWeekday.isAcceptableOrUnknown(
              data['nth_weekday']!, _nthWeekdayMeta));
    }
    if (data.containsKey('weekday_of_month')) {
      context.handle(
          _weekdayOfMonthMeta,
          weekdayOfMonth.isAcceptableOrUnknown(
              data['weekday_of_month']!, _weekdayOfMonthMeta));
    }
    if (data.containsKey('month_of_year')) {
      context.handle(
          _monthOfYearMeta,
          monthOfYear.isAcceptableOrUnknown(
              data['month_of_year']!, _monthOfYearMeta));
    }
    if (data.containsKey('day_of_year')) {
      context.handle(
          _dayOfYearMeta,
          dayOfYear.isAcceptableOrUnknown(
              data['day_of_year']!, _dayOfYearMeta));
    }
    if (data.containsKey('skip_weekends')) {
      context.handle(
          _skipWeekendsMeta,
          skipWeekends.isAcceptableOrUnknown(
              data['skip_weekends']!, _skipWeekendsMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('max_occurrences')) {
      context.handle(
          _maxOccurrencesMeta,
          maxOccurrences.isAcceptableOrUnknown(
              data['max_occurrences']!, _maxOccurrencesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('series_id')) {
      context.handle(_seriesIdMeta,
          seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('custom_rule')) {
      context.handle(
          _customRuleMeta,
          customRule.isAcceptableOrUnknown(
              data['custom_rule']!, _customRuleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecurringPattern map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecurringPattern(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      interval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interval'])!,
      daysOfWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}days_of_week']),
      daysOfMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}days_of_month']),
      lastDayOfMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}last_day_of_month']),
      nthWeekday: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nth_weekday']),
      weekdayOfMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weekday_of_month']),
      monthOfYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}month_of_year']),
      dayOfYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_of_year']),
      skipWeekends: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}skip_weekends'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      maxOccurrences: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_occurrences']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      seriesId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}series_id']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      customRule: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}custom_rule']),
    );
  }

  @override
  $RecurringPatternsTable createAlias(String alias) {
    return $RecurringPatternsTable(attachedDatabase, alias);
  }
}

class RecurringPattern extends DataClass
    implements Insertable<RecurringPattern> {
  final int id;
  final String type;
  final int interval;
  final String? daysOfWeek;
  final String? daysOfMonth;
  final bool? lastDayOfMonth;
  final int? nthWeekday;
  final int? weekdayOfMonth;
  final int? monthOfYear;
  final int? dayOfYear;
  final bool skipWeekends;
  final DateTime? endDate;
  final int? maxOccurrences;
  final DateTime createdAt;
  final String? seriesId;
  final bool isActive;
  final String? customRule;
  const RecurringPattern(
      {required this.id,
      required this.type,
      required this.interval,
      this.daysOfWeek,
      this.daysOfMonth,
      this.lastDayOfMonth,
      this.nthWeekday,
      this.weekdayOfMonth,
      this.monthOfYear,
      this.dayOfYear,
      required this.skipWeekends,
      this.endDate,
      this.maxOccurrences,
      required this.createdAt,
      this.seriesId,
      required this.isActive,
      this.customRule});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['interval'] = Variable<int>(interval);
    if (!nullToAbsent || daysOfWeek != null) {
      map['days_of_week'] = Variable<String>(daysOfWeek);
    }
    if (!nullToAbsent || daysOfMonth != null) {
      map['days_of_month'] = Variable<String>(daysOfMonth);
    }
    if (!nullToAbsent || lastDayOfMonth != null) {
      map['last_day_of_month'] = Variable<bool>(lastDayOfMonth);
    }
    if (!nullToAbsent || nthWeekday != null) {
      map['nth_weekday'] = Variable<int>(nthWeekday);
    }
    if (!nullToAbsent || weekdayOfMonth != null) {
      map['weekday_of_month'] = Variable<int>(weekdayOfMonth);
    }
    if (!nullToAbsent || monthOfYear != null) {
      map['month_of_year'] = Variable<int>(monthOfYear);
    }
    if (!nullToAbsent || dayOfYear != null) {
      map['day_of_year'] = Variable<int>(dayOfYear);
    }
    map['skip_weekends'] = Variable<bool>(skipWeekends);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || maxOccurrences != null) {
      map['max_occurrences'] = Variable<int>(maxOccurrences);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || seriesId != null) {
      map['series_id'] = Variable<String>(seriesId);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || customRule != null) {
      map['custom_rule'] = Variable<String>(customRule);
    }
    return map;
  }

  RecurringPatternsCompanion toCompanion(bool nullToAbsent) {
    return RecurringPatternsCompanion(
      id: Value(id),
      type: Value(type),
      interval: Value(interval),
      daysOfWeek: daysOfWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(daysOfWeek),
      daysOfMonth: daysOfMonth == null && nullToAbsent
          ? const Value.absent()
          : Value(daysOfMonth),
      lastDayOfMonth: lastDayOfMonth == null && nullToAbsent
          ? const Value.absent()
          : Value(lastDayOfMonth),
      nthWeekday: nthWeekday == null && nullToAbsent
          ? const Value.absent()
          : Value(nthWeekday),
      weekdayOfMonth: weekdayOfMonth == null && nullToAbsent
          ? const Value.absent()
          : Value(weekdayOfMonth),
      monthOfYear: monthOfYear == null && nullToAbsent
          ? const Value.absent()
          : Value(monthOfYear),
      dayOfYear: dayOfYear == null && nullToAbsent
          ? const Value.absent()
          : Value(dayOfYear),
      skipWeekends: Value(skipWeekends),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      maxOccurrences: maxOccurrences == null && nullToAbsent
          ? const Value.absent()
          : Value(maxOccurrences),
      createdAt: Value(createdAt),
      seriesId: seriesId == null && nullToAbsent
          ? const Value.absent()
          : Value(seriesId),
      isActive: Value(isActive),
      customRule: customRule == null && nullToAbsent
          ? const Value.absent()
          : Value(customRule),
    );
  }

  factory RecurringPattern.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecurringPattern(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      interval: serializer.fromJson<int>(json['interval']),
      daysOfWeek: serializer.fromJson<String?>(json['daysOfWeek']),
      daysOfMonth: serializer.fromJson<String?>(json['daysOfMonth']),
      lastDayOfMonth: serializer.fromJson<bool?>(json['lastDayOfMonth']),
      nthWeekday: serializer.fromJson<int?>(json['nthWeekday']),
      weekdayOfMonth: serializer.fromJson<int?>(json['weekdayOfMonth']),
      monthOfYear: serializer.fromJson<int?>(json['monthOfYear']),
      dayOfYear: serializer.fromJson<int?>(json['dayOfYear']),
      skipWeekends: serializer.fromJson<bool>(json['skipWeekends']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      maxOccurrences: serializer.fromJson<int?>(json['maxOccurrences']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      seriesId: serializer.fromJson<String?>(json['seriesId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      customRule: serializer.fromJson<String?>(json['customRule']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'interval': serializer.toJson<int>(interval),
      'daysOfWeek': serializer.toJson<String?>(daysOfWeek),
      'daysOfMonth': serializer.toJson<String?>(daysOfMonth),
      'lastDayOfMonth': serializer.toJson<bool?>(lastDayOfMonth),
      'nthWeekday': serializer.toJson<int?>(nthWeekday),
      'weekdayOfMonth': serializer.toJson<int?>(weekdayOfMonth),
      'monthOfYear': serializer.toJson<int?>(monthOfYear),
      'dayOfYear': serializer.toJson<int?>(dayOfYear),
      'skipWeekends': serializer.toJson<bool>(skipWeekends),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'maxOccurrences': serializer.toJson<int?>(maxOccurrences),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'seriesId': serializer.toJson<String?>(seriesId),
      'isActive': serializer.toJson<bool>(isActive),
      'customRule': serializer.toJson<String?>(customRule),
    };
  }

  RecurringPattern copyWith(
          {int? id,
          String? type,
          int? interval,
          Value<String?> daysOfWeek = const Value.absent(),
          Value<String?> daysOfMonth = const Value.absent(),
          Value<bool?> lastDayOfMonth = const Value.absent(),
          Value<int?> nthWeekday = const Value.absent(),
          Value<int?> weekdayOfMonth = const Value.absent(),
          Value<int?> monthOfYear = const Value.absent(),
          Value<int?> dayOfYear = const Value.absent(),
          bool? skipWeekends,
          Value<DateTime?> endDate = const Value.absent(),
          Value<int?> maxOccurrences = const Value.absent(),
          DateTime? createdAt,
          Value<String?> seriesId = const Value.absent(),
          bool? isActive,
          Value<String?> customRule = const Value.absent()}) =>
      RecurringPattern(
        id: id ?? this.id,
        type: type ?? this.type,
        interval: interval ?? this.interval,
        daysOfWeek: daysOfWeek.present ? daysOfWeek.value : this.daysOfWeek,
        daysOfMonth: daysOfMonth.present ? daysOfMonth.value : this.daysOfMonth,
        lastDayOfMonth:
            lastDayOfMonth.present ? lastDayOfMonth.value : this.lastDayOfMonth,
        nthWeekday: nthWeekday.present ? nthWeekday.value : this.nthWeekday,
        weekdayOfMonth:
            weekdayOfMonth.present ? weekdayOfMonth.value : this.weekdayOfMonth,
        monthOfYear: monthOfYear.present ? monthOfYear.value : this.monthOfYear,
        dayOfYear: dayOfYear.present ? dayOfYear.value : this.dayOfYear,
        skipWeekends: skipWeekends ?? this.skipWeekends,
        endDate: endDate.present ? endDate.value : this.endDate,
        maxOccurrences:
            maxOccurrences.present ? maxOccurrences.value : this.maxOccurrences,
        createdAt: createdAt ?? this.createdAt,
        seriesId: seriesId.present ? seriesId.value : this.seriesId,
        isActive: isActive ?? this.isActive,
        customRule: customRule.present ? customRule.value : this.customRule,
      );
  @override
  String toString() {
    return (StringBuffer('RecurringPattern(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('interval: $interval, ')
          ..write('daysOfWeek: $daysOfWeek, ')
          ..write('daysOfMonth: $daysOfMonth, ')
          ..write('lastDayOfMonth: $lastDayOfMonth, ')
          ..write('nthWeekday: $nthWeekday, ')
          ..write('weekdayOfMonth: $weekdayOfMonth, ')
          ..write('monthOfYear: $monthOfYear, ')
          ..write('dayOfYear: $dayOfYear, ')
          ..write('skipWeekends: $skipWeekends, ')
          ..write('endDate: $endDate, ')
          ..write('maxOccurrences: $maxOccurrences, ')
          ..write('createdAt: $createdAt, ')
          ..write('seriesId: $seriesId, ')
          ..write('isActive: $isActive, ')
          ..write('customRule: $customRule')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      type,
      interval,
      daysOfWeek,
      daysOfMonth,
      lastDayOfMonth,
      nthWeekday,
      weekdayOfMonth,
      monthOfYear,
      dayOfYear,
      skipWeekends,
      endDate,
      maxOccurrences,
      createdAt,
      seriesId,
      isActive,
      customRule);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecurringPattern &&
          other.id == this.id &&
          other.type == this.type &&
          other.interval == this.interval &&
          other.daysOfWeek == this.daysOfWeek &&
          other.daysOfMonth == this.daysOfMonth &&
          other.lastDayOfMonth == this.lastDayOfMonth &&
          other.nthWeekday == this.nthWeekday &&
          other.weekdayOfMonth == this.weekdayOfMonth &&
          other.monthOfYear == this.monthOfYear &&
          other.dayOfYear == this.dayOfYear &&
          other.skipWeekends == this.skipWeekends &&
          other.endDate == this.endDate &&
          other.maxOccurrences == this.maxOccurrences &&
          other.createdAt == this.createdAt &&
          other.seriesId == this.seriesId &&
          other.isActive == this.isActive &&
          other.customRule == this.customRule);
}

class RecurringPatternsCompanion extends UpdateCompanion<RecurringPattern> {
  final Value<int> id;
  final Value<String> type;
  final Value<int> interval;
  final Value<String?> daysOfWeek;
  final Value<String?> daysOfMonth;
  final Value<bool?> lastDayOfMonth;
  final Value<int?> nthWeekday;
  final Value<int?> weekdayOfMonth;
  final Value<int?> monthOfYear;
  final Value<int?> dayOfYear;
  final Value<bool> skipWeekends;
  final Value<DateTime?> endDate;
  final Value<int?> maxOccurrences;
  final Value<DateTime> createdAt;
  final Value<String?> seriesId;
  final Value<bool> isActive;
  final Value<String?> customRule;
  const RecurringPatternsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.interval = const Value.absent(),
    this.daysOfWeek = const Value.absent(),
    this.daysOfMonth = const Value.absent(),
    this.lastDayOfMonth = const Value.absent(),
    this.nthWeekday = const Value.absent(),
    this.weekdayOfMonth = const Value.absent(),
    this.monthOfYear = const Value.absent(),
    this.dayOfYear = const Value.absent(),
    this.skipWeekends = const Value.absent(),
    this.endDate = const Value.absent(),
    this.maxOccurrences = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.seriesId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.customRule = const Value.absent(),
  });
  RecurringPatternsCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    this.interval = const Value.absent(),
    this.daysOfWeek = const Value.absent(),
    this.daysOfMonth = const Value.absent(),
    this.lastDayOfMonth = const Value.absent(),
    this.nthWeekday = const Value.absent(),
    this.weekdayOfMonth = const Value.absent(),
    this.monthOfYear = const Value.absent(),
    this.dayOfYear = const Value.absent(),
    this.skipWeekends = const Value.absent(),
    this.endDate = const Value.absent(),
    this.maxOccurrences = const Value.absent(),
    required DateTime createdAt,
    this.seriesId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.customRule = const Value.absent(),
  })  : type = Value(type),
        createdAt = Value(createdAt);
  static Insertable<RecurringPattern> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<int>? interval,
    Expression<String>? daysOfWeek,
    Expression<String>? daysOfMonth,
    Expression<bool>? lastDayOfMonth,
    Expression<int>? nthWeekday,
    Expression<int>? weekdayOfMonth,
    Expression<int>? monthOfYear,
    Expression<int>? dayOfYear,
    Expression<bool>? skipWeekends,
    Expression<DateTime>? endDate,
    Expression<int>? maxOccurrences,
    Expression<DateTime>? createdAt,
    Expression<String>? seriesId,
    Expression<bool>? isActive,
    Expression<String>? customRule,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (interval != null) 'interval': interval,
      if (daysOfWeek != null) 'days_of_week': daysOfWeek,
      if (daysOfMonth != null) 'days_of_month': daysOfMonth,
      if (lastDayOfMonth != null) 'last_day_of_month': lastDayOfMonth,
      if (nthWeekday != null) 'nth_weekday': nthWeekday,
      if (weekdayOfMonth != null) 'weekday_of_month': weekdayOfMonth,
      if (monthOfYear != null) 'month_of_year': monthOfYear,
      if (dayOfYear != null) 'day_of_year': dayOfYear,
      if (skipWeekends != null) 'skip_weekends': skipWeekends,
      if (endDate != null) 'end_date': endDate,
      if (maxOccurrences != null) 'max_occurrences': maxOccurrences,
      if (createdAt != null) 'created_at': createdAt,
      if (seriesId != null) 'series_id': seriesId,
      if (isActive != null) 'is_active': isActive,
      if (customRule != null) 'custom_rule': customRule,
    });
  }

  RecurringPatternsCompanion copyWith(
      {Value<int>? id,
      Value<String>? type,
      Value<int>? interval,
      Value<String?>? daysOfWeek,
      Value<String?>? daysOfMonth,
      Value<bool?>? lastDayOfMonth,
      Value<int?>? nthWeekday,
      Value<int?>? weekdayOfMonth,
      Value<int?>? monthOfYear,
      Value<int?>? dayOfYear,
      Value<bool>? skipWeekends,
      Value<DateTime?>? endDate,
      Value<int?>? maxOccurrences,
      Value<DateTime>? createdAt,
      Value<String?>? seriesId,
      Value<bool>? isActive,
      Value<String?>? customRule}) {
    return RecurringPatternsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      interval: interval ?? this.interval,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      daysOfMonth: daysOfMonth ?? this.daysOfMonth,
      lastDayOfMonth: lastDayOfMonth ?? this.lastDayOfMonth,
      nthWeekday: nthWeekday ?? this.nthWeekday,
      weekdayOfMonth: weekdayOfMonth ?? this.weekdayOfMonth,
      monthOfYear: monthOfYear ?? this.monthOfYear,
      dayOfYear: dayOfYear ?? this.dayOfYear,
      skipWeekends: skipWeekends ?? this.skipWeekends,
      endDate: endDate ?? this.endDate,
      maxOccurrences: maxOccurrences ?? this.maxOccurrences,
      createdAt: createdAt ?? this.createdAt,
      seriesId: seriesId ?? this.seriesId,
      isActive: isActive ?? this.isActive,
      customRule: customRule ?? this.customRule,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (daysOfWeek.present) {
      map['days_of_week'] = Variable<String>(daysOfWeek.value);
    }
    if (daysOfMonth.present) {
      map['days_of_month'] = Variable<String>(daysOfMonth.value);
    }
    if (lastDayOfMonth.present) {
      map['last_day_of_month'] = Variable<bool>(lastDayOfMonth.value);
    }
    if (nthWeekday.present) {
      map['nth_weekday'] = Variable<int>(nthWeekday.value);
    }
    if (weekdayOfMonth.present) {
      map['weekday_of_month'] = Variable<int>(weekdayOfMonth.value);
    }
    if (monthOfYear.present) {
      map['month_of_year'] = Variable<int>(monthOfYear.value);
    }
    if (dayOfYear.present) {
      map['day_of_year'] = Variable<int>(dayOfYear.value);
    }
    if (skipWeekends.present) {
      map['skip_weekends'] = Variable<bool>(skipWeekends.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (maxOccurrences.present) {
      map['max_occurrences'] = Variable<int>(maxOccurrences.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (seriesId.present) {
      map['series_id'] = Variable<String>(seriesId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (customRule.present) {
      map['custom_rule'] = Variable<String>(customRule.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecurringPatternsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('interval: $interval, ')
          ..write('daysOfWeek: $daysOfWeek, ')
          ..write('daysOfMonth: $daysOfMonth, ')
          ..write('lastDayOfMonth: $lastDayOfMonth, ')
          ..write('nthWeekday: $nthWeekday, ')
          ..write('weekdayOfMonth: $weekdayOfMonth, ')
          ..write('monthOfYear: $monthOfYear, ')
          ..write('dayOfYear: $dayOfYear, ')
          ..write('skipWeekends: $skipWeekends, ')
          ..write('endDate: $endDate, ')
          ..write('maxOccurrences: $maxOccurrences, ')
          ..write('createdAt: $createdAt, ')
          ..write('seriesId: $seriesId, ')
          ..write('isActive: $isActive, ')
          ..write('customRule: $customRule')
          ..write(')'))
        .toString();
  }
}

class $RecurringCompletionsTable extends RecurringCompletions
    with TableInfo<$RecurringCompletionsTable, RecurringCompletion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecurringCompletionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _recurringSeriesIdMeta =
      const VerificationMeta('recurringSeriesId');
  @override
  late final GeneratedColumn<String> recurringSeriesId =
      GeneratedColumn<String>('recurring_series_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instanceNumberMeta =
      const VerificationMeta('instanceNumber');
  @override
  late final GeneratedColumn<int> instanceNumber = GeneratedColumn<int>(
      'instance_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scheduledDateMeta =
      const VerificationMeta('scheduledDate');
  @override
  late final GeneratedColumn<DateTime> scheduledDate =
      GeneratedColumn<DateTime>('scheduled_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _completedByMeta =
      const VerificationMeta('completedBy');
  @override
  late final GeneratedColumn<String> completedBy = GeneratedColumn<String>(
      'completed_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        recurringSeriesId,
        instanceNumber,
        scheduledDate,
        completedAt,
        note,
        completedBy
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recurring_completions';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecurringCompletion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recurring_series_id')) {
      context.handle(
          _recurringSeriesIdMeta,
          recurringSeriesId.isAcceptableOrUnknown(
              data['recurring_series_id']!, _recurringSeriesIdMeta));
    } else if (isInserting) {
      context.missing(_recurringSeriesIdMeta);
    }
    if (data.containsKey('instance_number')) {
      context.handle(
          _instanceNumberMeta,
          instanceNumber.isAcceptableOrUnknown(
              data['instance_number']!, _instanceNumberMeta));
    } else if (isInserting) {
      context.missing(_instanceNumberMeta);
    }
    if (data.containsKey('scheduled_date')) {
      context.handle(
          _scheduledDateMeta,
          scheduledDate.isAcceptableOrUnknown(
              data['scheduled_date']!, _scheduledDateMeta));
    } else if (isInserting) {
      context.missing(_scheduledDateMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('completed_by')) {
      context.handle(
          _completedByMeta,
          completedBy.isAcceptableOrUnknown(
              data['completed_by']!, _completedByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecurringCompletion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecurringCompletion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      recurringSeriesId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}recurring_series_id'])!,
      instanceNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}instance_number'])!,
      scheduledDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_date'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      completedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}completed_by']),
    );
  }

  @override
  $RecurringCompletionsTable createAlias(String alias) {
    return $RecurringCompletionsTable(attachedDatabase, alias);
  }
}

class RecurringCompletion extends DataClass
    implements Insertable<RecurringCompletion> {
  final int id;
  final String recurringSeriesId;
  final int instanceNumber;
  final DateTime scheduledDate;
  final DateTime completedAt;
  final String? note;
  final String? completedBy;
  const RecurringCompletion(
      {required this.id,
      required this.recurringSeriesId,
      required this.instanceNumber,
      required this.scheduledDate,
      required this.completedAt,
      this.note,
      this.completedBy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recurring_series_id'] = Variable<String>(recurringSeriesId);
    map['instance_number'] = Variable<int>(instanceNumber);
    map['scheduled_date'] = Variable<DateTime>(scheduledDate);
    map['completed_at'] = Variable<DateTime>(completedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || completedBy != null) {
      map['completed_by'] = Variable<String>(completedBy);
    }
    return map;
  }

  RecurringCompletionsCompanion toCompanion(bool nullToAbsent) {
    return RecurringCompletionsCompanion(
      id: Value(id),
      recurringSeriesId: Value(recurringSeriesId),
      instanceNumber: Value(instanceNumber),
      scheduledDate: Value(scheduledDate),
      completedAt: Value(completedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      completedBy: completedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(completedBy),
    );
  }

  factory RecurringCompletion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecurringCompletion(
      id: serializer.fromJson<int>(json['id']),
      recurringSeriesId: serializer.fromJson<String>(json['recurringSeriesId']),
      instanceNumber: serializer.fromJson<int>(json['instanceNumber']),
      scheduledDate: serializer.fromJson<DateTime>(json['scheduledDate']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      note: serializer.fromJson<String?>(json['note']),
      completedBy: serializer.fromJson<String?>(json['completedBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recurringSeriesId': serializer.toJson<String>(recurringSeriesId),
      'instanceNumber': serializer.toJson<int>(instanceNumber),
      'scheduledDate': serializer.toJson<DateTime>(scheduledDate),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'note': serializer.toJson<String?>(note),
      'completedBy': serializer.toJson<String?>(completedBy),
    };
  }

  RecurringCompletion copyWith(
          {int? id,
          String? recurringSeriesId,
          int? instanceNumber,
          DateTime? scheduledDate,
          DateTime? completedAt,
          Value<String?> note = const Value.absent(),
          Value<String?> completedBy = const Value.absent()}) =>
      RecurringCompletion(
        id: id ?? this.id,
        recurringSeriesId: recurringSeriesId ?? this.recurringSeriesId,
        instanceNumber: instanceNumber ?? this.instanceNumber,
        scheduledDate: scheduledDate ?? this.scheduledDate,
        completedAt: completedAt ?? this.completedAt,
        note: note.present ? note.value : this.note,
        completedBy: completedBy.present ? completedBy.value : this.completedBy,
      );
  @override
  String toString() {
    return (StringBuffer('RecurringCompletion(')
          ..write('id: $id, ')
          ..write('recurringSeriesId: $recurringSeriesId, ')
          ..write('instanceNumber: $instanceNumber, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note, ')
          ..write('completedBy: $completedBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recurringSeriesId, instanceNumber,
      scheduledDate, completedAt, note, completedBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecurringCompletion &&
          other.id == this.id &&
          other.recurringSeriesId == this.recurringSeriesId &&
          other.instanceNumber == this.instanceNumber &&
          other.scheduledDate == this.scheduledDate &&
          other.completedAt == this.completedAt &&
          other.note == this.note &&
          other.completedBy == this.completedBy);
}

class RecurringCompletionsCompanion
    extends UpdateCompanion<RecurringCompletion> {
  final Value<int> id;
  final Value<String> recurringSeriesId;
  final Value<int> instanceNumber;
  final Value<DateTime> scheduledDate;
  final Value<DateTime> completedAt;
  final Value<String?> note;
  final Value<String?> completedBy;
  const RecurringCompletionsCompanion({
    this.id = const Value.absent(),
    this.recurringSeriesId = const Value.absent(),
    this.instanceNumber = const Value.absent(),
    this.scheduledDate = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.note = const Value.absent(),
    this.completedBy = const Value.absent(),
  });
  RecurringCompletionsCompanion.insert({
    this.id = const Value.absent(),
    required String recurringSeriesId,
    required int instanceNumber,
    required DateTime scheduledDate,
    required DateTime completedAt,
    this.note = const Value.absent(),
    this.completedBy = const Value.absent(),
  })  : recurringSeriesId = Value(recurringSeriesId),
        instanceNumber = Value(instanceNumber),
        scheduledDate = Value(scheduledDate),
        completedAt = Value(completedAt);
  static Insertable<RecurringCompletion> custom({
    Expression<int>? id,
    Expression<String>? recurringSeriesId,
    Expression<int>? instanceNumber,
    Expression<DateTime>? scheduledDate,
    Expression<DateTime>? completedAt,
    Expression<String>? note,
    Expression<String>? completedBy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recurringSeriesId != null) 'recurring_series_id': recurringSeriesId,
      if (instanceNumber != null) 'instance_number': instanceNumber,
      if (scheduledDate != null) 'scheduled_date': scheduledDate,
      if (completedAt != null) 'completed_at': completedAt,
      if (note != null) 'note': note,
      if (completedBy != null) 'completed_by': completedBy,
    });
  }

  RecurringCompletionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? recurringSeriesId,
      Value<int>? instanceNumber,
      Value<DateTime>? scheduledDate,
      Value<DateTime>? completedAt,
      Value<String?>? note,
      Value<String?>? completedBy}) {
    return RecurringCompletionsCompanion(
      id: id ?? this.id,
      recurringSeriesId: recurringSeriesId ?? this.recurringSeriesId,
      instanceNumber: instanceNumber ?? this.instanceNumber,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      completedAt: completedAt ?? this.completedAt,
      note: note ?? this.note,
      completedBy: completedBy ?? this.completedBy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recurringSeriesId.present) {
      map['recurring_series_id'] = Variable<String>(recurringSeriesId.value);
    }
    if (instanceNumber.present) {
      map['instance_number'] = Variable<int>(instanceNumber.value);
    }
    if (scheduledDate.present) {
      map['scheduled_date'] = Variable<DateTime>(scheduledDate.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (completedBy.present) {
      map['completed_by'] = Variable<String>(completedBy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecurringCompletionsCompanion(')
          ..write('id: $id, ')
          ..write('recurringSeriesId: $recurringSeriesId, ')
          ..write('instanceNumber: $instanceNumber, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note, ')
          ..write('completedBy: $completedBy')
          ..write(')'))
        .toString();
  }
}

class $TaskRemindersTable extends TaskReminders
    with TableInfo<$TaskRemindersTable, TaskReminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskRemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _scheduledAtMeta =
      const VerificationMeta('scheduledAt');
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
      'scheduled_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isSentMeta = const VerificationMeta('isSent');
  @override
  late final GeneratedColumn<bool> isSent = GeneratedColumn<bool>(
      'is_sent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sent" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, taskId, scheduledAt, isSent, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_reminders';
  @override
  VerificationContext validateIntegrity(Insertable<TaskReminder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
          _scheduledAtMeta,
          scheduledAt.isAcceptableOrUnknown(
              data['scheduled_at']!, _scheduledAtMeta));
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('is_sent')) {
      context.handle(_isSentMeta,
          isSent.isAcceptableOrUnknown(data['is_sent']!, _isSentMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskReminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskReminder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      scheduledAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}scheduled_at'])!,
      isSent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sent'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TaskRemindersTable createAlias(String alias) {
    return $TaskRemindersTable(attachedDatabase, alias);
  }
}

class TaskReminder extends DataClass implements Insertable<TaskReminder> {
  final int id;
  final int taskId;
  final DateTime scheduledAt;
  final bool isSent;
  final DateTime createdAt;
  const TaskReminder(
      {required this.id,
      required this.taskId,
      required this.scheduledAt,
      required this.isSent,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<int>(taskId);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['is_sent'] = Variable<bool>(isSent);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TaskRemindersCompanion toCompanion(bool nullToAbsent) {
    return TaskRemindersCompanion(
      id: Value(id),
      taskId: Value(taskId),
      scheduledAt: Value(scheduledAt),
      isSent: Value(isSent),
      createdAt: Value(createdAt),
    );
  }

  factory TaskReminder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskReminder(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<int>(json['taskId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      isSent: serializer.fromJson<bool>(json['isSent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<int>(taskId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'isSent': serializer.toJson<bool>(isSent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TaskReminder copyWith(
          {int? id,
          int? taskId,
          DateTime? scheduledAt,
          bool? isSent,
          DateTime? createdAt}) =>
      TaskReminder(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        isSent: isSent ?? this.isSent,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('TaskReminder(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('isSent: $isSent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, taskId, scheduledAt, isSent, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskReminder &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.scheduledAt == this.scheduledAt &&
          other.isSent == this.isSent &&
          other.createdAt == this.createdAt);
}

class TaskRemindersCompanion extends UpdateCompanion<TaskReminder> {
  final Value<int> id;
  final Value<int> taskId;
  final Value<DateTime> scheduledAt;
  final Value<bool> isSent;
  final Value<DateTime> createdAt;
  const TaskRemindersCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.isSent = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TaskRemindersCompanion.insert({
    this.id = const Value.absent(),
    required int taskId,
    required DateTime scheduledAt,
    this.isSent = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : taskId = Value(taskId),
        scheduledAt = Value(scheduledAt);
  static Insertable<TaskReminder> custom({
    Expression<int>? id,
    Expression<int>? taskId,
    Expression<DateTime>? scheduledAt,
    Expression<bool>? isSent,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (isSent != null) 'is_sent': isSent,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TaskRemindersCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskId,
      Value<DateTime>? scheduledAt,
      Value<bool>? isSent,
      Value<DateTime>? createdAt}) {
    return TaskRemindersCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      isSent: isSent ?? this.isSent,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (isSent.present) {
      map['is_sent'] = Variable<bool>(isSent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskRemindersCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('isSent: $isSent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _medicationNameMeta =
      const VerificationMeta('medicationName');
  @override
  late final GeneratedColumn<String> medicationName = GeneratedColumn<String>(
      'medication_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
      'dosage', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentQuantityMeta =
      const VerificationMeta('currentQuantity');
  @override
  late final GeneratedColumn<double> currentQuantity = GeneratedColumn<double>(
      'current_quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _refillThresholdMeta =
      const VerificationMeta('refillThreshold');
  @override
  late final GeneratedColumn<double> refillThreshold = GeneratedColumn<double>(
      'refill_threshold', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityPerDoseMeta =
      const VerificationMeta('quantityPerDose');
  @override
  late final GeneratedColumn<double> quantityPerDose = GeneratedColumn<double>(
      'quantity_per_dose', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(1.0));
  static const VerificationMeta _autoDecrementEnabledMeta =
      const VerificationMeta('autoDecrementEnabled');
  @override
  late final GeneratedColumn<bool> autoDecrementEnabled = GeneratedColumn<bool>(
      'auto_decrement_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("auto_decrement_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _prescribingDoctorMeta =
      const VerificationMeta('prescribingDoctor');
  @override
  late final GeneratedColumn<String> prescribingDoctor =
      GeneratedColumn<String>('prescribing_doctor', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pharmacyInfoMeta =
      const VerificationMeta('pharmacyInfo');
  @override
  late final GeneratedColumn<String> pharmacyInfo = GeneratedColumn<String>(
      'pharmacy_info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _prescriptionNumberMeta =
      const VerificationMeta('prescriptionNumber');
  @override
  late final GeneratedColumn<String> prescriptionNumber =
      GeneratedColumn<String>('prescription_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
      'instructions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        taskId,
        medicationName,
        dosage,
        currentQuantity,
        refillThreshold,
        quantityPerDose,
        autoDecrementEnabled,
        prescribingDoctor,
        pharmacyInfo,
        prescriptionNumber,
        instructions,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(Insertable<Medication> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('medication_name')) {
      context.handle(
          _medicationNameMeta,
          medicationName.isAcceptableOrUnknown(
              data['medication_name']!, _medicationNameMeta));
    } else if (isInserting) {
      context.missing(_medicationNameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(_dosageMeta,
          dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta));
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('current_quantity')) {
      context.handle(
          _currentQuantityMeta,
          currentQuantity.isAcceptableOrUnknown(
              data['current_quantity']!, _currentQuantityMeta));
    } else if (isInserting) {
      context.missing(_currentQuantityMeta);
    }
    if (data.containsKey('refill_threshold')) {
      context.handle(
          _refillThresholdMeta,
          refillThreshold.isAcceptableOrUnknown(
              data['refill_threshold']!, _refillThresholdMeta));
    } else if (isInserting) {
      context.missing(_refillThresholdMeta);
    }
    if (data.containsKey('quantity_per_dose')) {
      context.handle(
          _quantityPerDoseMeta,
          quantityPerDose.isAcceptableOrUnknown(
              data['quantity_per_dose']!, _quantityPerDoseMeta));
    }
    if (data.containsKey('auto_decrement_enabled')) {
      context.handle(
          _autoDecrementEnabledMeta,
          autoDecrementEnabled.isAcceptableOrUnknown(
              data['auto_decrement_enabled']!, _autoDecrementEnabledMeta));
    }
    if (data.containsKey('prescribing_doctor')) {
      context.handle(
          _prescribingDoctorMeta,
          prescribingDoctor.isAcceptableOrUnknown(
              data['prescribing_doctor']!, _prescribingDoctorMeta));
    }
    if (data.containsKey('pharmacy_info')) {
      context.handle(
          _pharmacyInfoMeta,
          pharmacyInfo.isAcceptableOrUnknown(
              data['pharmacy_info']!, _pharmacyInfoMeta));
    }
    if (data.containsKey('prescription_number')) {
      context.handle(
          _prescriptionNumberMeta,
          prescriptionNumber.isAcceptableOrUnknown(
              data['prescription_number']!, _prescriptionNumberMeta));
    }
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions']!, _instructionsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      medicationName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}medication_name'])!,
      dosage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dosage'])!,
      currentQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}current_quantity'])!,
      refillThreshold: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}refill_threshold'])!,
      quantityPerDose: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}quantity_per_dose'])!,
      autoDecrementEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}auto_decrement_enabled'])!,
      prescribingDoctor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}prescribing_doctor']),
      pharmacyInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pharmacy_info']),
      prescriptionNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}prescription_number']),
      instructions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instructions']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final int id;
  final int taskId;
  final String medicationName;
  final String dosage;
  final double currentQuantity;
  final double refillThreshold;
  final double quantityPerDose;
  final bool autoDecrementEnabled;
  final String? prescribingDoctor;
  final String? pharmacyInfo;
  final String? prescriptionNumber;
  final String? instructions;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Medication(
      {required this.id,
      required this.taskId,
      required this.medicationName,
      required this.dosage,
      required this.currentQuantity,
      required this.refillThreshold,
      required this.quantityPerDose,
      required this.autoDecrementEnabled,
      this.prescribingDoctor,
      this.pharmacyInfo,
      this.prescriptionNumber,
      this.instructions,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<int>(taskId);
    map['medication_name'] = Variable<String>(medicationName);
    map['dosage'] = Variable<String>(dosage);
    map['current_quantity'] = Variable<double>(currentQuantity);
    map['refill_threshold'] = Variable<double>(refillThreshold);
    map['quantity_per_dose'] = Variable<double>(quantityPerDose);
    map['auto_decrement_enabled'] = Variable<bool>(autoDecrementEnabled);
    if (!nullToAbsent || prescribingDoctor != null) {
      map['prescribing_doctor'] = Variable<String>(prescribingDoctor);
    }
    if (!nullToAbsent || pharmacyInfo != null) {
      map['pharmacy_info'] = Variable<String>(pharmacyInfo);
    }
    if (!nullToAbsent || prescriptionNumber != null) {
      map['prescription_number'] = Variable<String>(prescriptionNumber);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      taskId: Value(taskId),
      medicationName: Value(medicationName),
      dosage: Value(dosage),
      currentQuantity: Value(currentQuantity),
      refillThreshold: Value(refillThreshold),
      quantityPerDose: Value(quantityPerDose),
      autoDecrementEnabled: Value(autoDecrementEnabled),
      prescribingDoctor: prescribingDoctor == null && nullToAbsent
          ? const Value.absent()
          : Value(prescribingDoctor),
      pharmacyInfo: pharmacyInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(pharmacyInfo),
      prescriptionNumber: prescriptionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(prescriptionNumber),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Medication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<int>(json['taskId']),
      medicationName: serializer.fromJson<String>(json['medicationName']),
      dosage: serializer.fromJson<String>(json['dosage']),
      currentQuantity: serializer.fromJson<double>(json['currentQuantity']),
      refillThreshold: serializer.fromJson<double>(json['refillThreshold']),
      quantityPerDose: serializer.fromJson<double>(json['quantityPerDose']),
      autoDecrementEnabled:
          serializer.fromJson<bool>(json['autoDecrementEnabled']),
      prescribingDoctor:
          serializer.fromJson<String?>(json['prescribingDoctor']),
      pharmacyInfo: serializer.fromJson<String?>(json['pharmacyInfo']),
      prescriptionNumber:
          serializer.fromJson<String?>(json['prescriptionNumber']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<int>(taskId),
      'medicationName': serializer.toJson<String>(medicationName),
      'dosage': serializer.toJson<String>(dosage),
      'currentQuantity': serializer.toJson<double>(currentQuantity),
      'refillThreshold': serializer.toJson<double>(refillThreshold),
      'quantityPerDose': serializer.toJson<double>(quantityPerDose),
      'autoDecrementEnabled': serializer.toJson<bool>(autoDecrementEnabled),
      'prescribingDoctor': serializer.toJson<String?>(prescribingDoctor),
      'pharmacyInfo': serializer.toJson<String?>(pharmacyInfo),
      'prescriptionNumber': serializer.toJson<String?>(prescriptionNumber),
      'instructions': serializer.toJson<String?>(instructions),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Medication copyWith(
          {int? id,
          int? taskId,
          String? medicationName,
          String? dosage,
          double? currentQuantity,
          double? refillThreshold,
          double? quantityPerDose,
          bool? autoDecrementEnabled,
          Value<String?> prescribingDoctor = const Value.absent(),
          Value<String?> pharmacyInfo = const Value.absent(),
          Value<String?> prescriptionNumber = const Value.absent(),
          Value<String?> instructions = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Medication(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        medicationName: medicationName ?? this.medicationName,
        dosage: dosage ?? this.dosage,
        currentQuantity: currentQuantity ?? this.currentQuantity,
        refillThreshold: refillThreshold ?? this.refillThreshold,
        quantityPerDose: quantityPerDose ?? this.quantityPerDose,
        autoDecrementEnabled: autoDecrementEnabled ?? this.autoDecrementEnabled,
        prescribingDoctor: prescribingDoctor.present
            ? prescribingDoctor.value
            : this.prescribingDoctor,
        pharmacyInfo:
            pharmacyInfo.present ? pharmacyInfo.value : this.pharmacyInfo,
        prescriptionNumber: prescriptionNumber.present
            ? prescriptionNumber.value
            : this.prescriptionNumber,
        instructions:
            instructions.present ? instructions.value : this.instructions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('medicationName: $medicationName, ')
          ..write('dosage: $dosage, ')
          ..write('currentQuantity: $currentQuantity, ')
          ..write('refillThreshold: $refillThreshold, ')
          ..write('quantityPerDose: $quantityPerDose, ')
          ..write('autoDecrementEnabled: $autoDecrementEnabled, ')
          ..write('prescribingDoctor: $prescribingDoctor, ')
          ..write('pharmacyInfo: $pharmacyInfo, ')
          ..write('prescriptionNumber: $prescriptionNumber, ')
          ..write('instructions: $instructions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      taskId,
      medicationName,
      dosage,
      currentQuantity,
      refillThreshold,
      quantityPerDose,
      autoDecrementEnabled,
      prescribingDoctor,
      pharmacyInfo,
      prescriptionNumber,
      instructions,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.medicationName == this.medicationName &&
          other.dosage == this.dosage &&
          other.currentQuantity == this.currentQuantity &&
          other.refillThreshold == this.refillThreshold &&
          other.quantityPerDose == this.quantityPerDose &&
          other.autoDecrementEnabled == this.autoDecrementEnabled &&
          other.prescribingDoctor == this.prescribingDoctor &&
          other.pharmacyInfo == this.pharmacyInfo &&
          other.prescriptionNumber == this.prescriptionNumber &&
          other.instructions == this.instructions &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<int> id;
  final Value<int> taskId;
  final Value<String> medicationName;
  final Value<String> dosage;
  final Value<double> currentQuantity;
  final Value<double> refillThreshold;
  final Value<double> quantityPerDose;
  final Value<bool> autoDecrementEnabled;
  final Value<String?> prescribingDoctor;
  final Value<String?> pharmacyInfo;
  final Value<String?> prescriptionNumber;
  final Value<String?> instructions;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.dosage = const Value.absent(),
    this.currentQuantity = const Value.absent(),
    this.refillThreshold = const Value.absent(),
    this.quantityPerDose = const Value.absent(),
    this.autoDecrementEnabled = const Value.absent(),
    this.prescribingDoctor = const Value.absent(),
    this.pharmacyInfo = const Value.absent(),
    this.prescriptionNumber = const Value.absent(),
    this.instructions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MedicationsCompanion.insert({
    this.id = const Value.absent(),
    required int taskId,
    required String medicationName,
    required String dosage,
    required double currentQuantity,
    required double refillThreshold,
    this.quantityPerDose = const Value.absent(),
    this.autoDecrementEnabled = const Value.absent(),
    this.prescribingDoctor = const Value.absent(),
    this.pharmacyInfo = const Value.absent(),
    this.prescriptionNumber = const Value.absent(),
    this.instructions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : taskId = Value(taskId),
        medicationName = Value(medicationName),
        dosage = Value(dosage),
        currentQuantity = Value(currentQuantity),
        refillThreshold = Value(refillThreshold);
  static Insertable<Medication> custom({
    Expression<int>? id,
    Expression<int>? taskId,
    Expression<String>? medicationName,
    Expression<String>? dosage,
    Expression<double>? currentQuantity,
    Expression<double>? refillThreshold,
    Expression<double>? quantityPerDose,
    Expression<bool>? autoDecrementEnabled,
    Expression<String>? prescribingDoctor,
    Expression<String>? pharmacyInfo,
    Expression<String>? prescriptionNumber,
    Expression<String>? instructions,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (medicationName != null) 'medication_name': medicationName,
      if (dosage != null) 'dosage': dosage,
      if (currentQuantity != null) 'current_quantity': currentQuantity,
      if (refillThreshold != null) 'refill_threshold': refillThreshold,
      if (quantityPerDose != null) 'quantity_per_dose': quantityPerDose,
      if (autoDecrementEnabled != null)
        'auto_decrement_enabled': autoDecrementEnabled,
      if (prescribingDoctor != null) 'prescribing_doctor': prescribingDoctor,
      if (pharmacyInfo != null) 'pharmacy_info': pharmacyInfo,
      if (prescriptionNumber != null) 'prescription_number': prescriptionNumber,
      if (instructions != null) 'instructions': instructions,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MedicationsCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskId,
      Value<String>? medicationName,
      Value<String>? dosage,
      Value<double>? currentQuantity,
      Value<double>? refillThreshold,
      Value<double>? quantityPerDose,
      Value<bool>? autoDecrementEnabled,
      Value<String?>? prescribingDoctor,
      Value<String?>? pharmacyInfo,
      Value<String?>? prescriptionNumber,
      Value<String?>? instructions,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return MedicationsCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      medicationName: medicationName ?? this.medicationName,
      dosage: dosage ?? this.dosage,
      currentQuantity: currentQuantity ?? this.currentQuantity,
      refillThreshold: refillThreshold ?? this.refillThreshold,
      quantityPerDose: quantityPerDose ?? this.quantityPerDose,
      autoDecrementEnabled: autoDecrementEnabled ?? this.autoDecrementEnabled,
      prescribingDoctor: prescribingDoctor ?? this.prescribingDoctor,
      pharmacyInfo: pharmacyInfo ?? this.pharmacyInfo,
      prescriptionNumber: prescriptionNumber ?? this.prescriptionNumber,
      instructions: instructions ?? this.instructions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (medicationName.present) {
      map['medication_name'] = Variable<String>(medicationName.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (currentQuantity.present) {
      map['current_quantity'] = Variable<double>(currentQuantity.value);
    }
    if (refillThreshold.present) {
      map['refill_threshold'] = Variable<double>(refillThreshold.value);
    }
    if (quantityPerDose.present) {
      map['quantity_per_dose'] = Variable<double>(quantityPerDose.value);
    }
    if (autoDecrementEnabled.present) {
      map['auto_decrement_enabled'] =
          Variable<bool>(autoDecrementEnabled.value);
    }
    if (prescribingDoctor.present) {
      map['prescribing_doctor'] = Variable<String>(prescribingDoctor.value);
    }
    if (pharmacyInfo.present) {
      map['pharmacy_info'] = Variable<String>(pharmacyInfo.value);
    }
    if (prescriptionNumber.present) {
      map['prescription_number'] = Variable<String>(prescriptionNumber.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('medicationName: $medicationName, ')
          ..write('dosage: $dosage, ')
          ..write('currentQuantity: $currentQuantity, ')
          ..write('refillThreshold: $refillThreshold, ')
          ..write('quantityPerDose: $quantityPerDose, ')
          ..write('autoDecrementEnabled: $autoDecrementEnabled, ')
          ..write('prescribingDoctor: $prescribingDoctor, ')
          ..write('pharmacyInfo: $pharmacyInfo, ')
          ..write('prescriptionNumber: $prescriptionNumber, ')
          ..write('instructions: $instructions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MedicationInventoryLogTable extends MedicationInventoryLog
    with TableInfo<$MedicationInventoryLogTable, MedicationInventoryLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationInventoryLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _medicationIdMeta =
      const VerificationMeta('medicationId');
  @override
  late final GeneratedColumn<int> medicationId = GeneratedColumn<int>(
      'medication_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES medications (id) ON DELETE CASCADE'));
  static const VerificationMeta _previousQuantityMeta =
      const VerificationMeta('previousQuantity');
  @override
  late final GeneratedColumn<double> previousQuantity = GeneratedColumn<double>(
      'previous_quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _newQuantityMeta =
      const VerificationMeta('newQuantity');
  @override
  late final GeneratedColumn<double> newQuantity = GeneratedColumn<double>(
      'new_quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _changeAmountMeta =
      const VerificationMeta('changeAmount');
  @override
  late final GeneratedColumn<double> changeAmount = GeneratedColumn<double>(
      'change_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _changeReasonMeta =
      const VerificationMeta('changeReason');
  @override
  late final GeneratedColumn<String> changeReason = GeneratedColumn<String>(
      'change_reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relatedTaskCompletionIdMeta =
      const VerificationMeta('relatedTaskCompletionId');
  @override
  late final GeneratedColumn<int> relatedTaskCompletionId =
      GeneratedColumn<int>('related_task_completion_id', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        medicationId,
        previousQuantity,
        newQuantity,
        changeAmount,
        changeReason,
        relatedTaskCompletionId,
        timestamp
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_inventory_log';
  @override
  VerificationContext validateIntegrity(
      Insertable<MedicationInventoryLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
          _medicationIdMeta,
          medicationId.isAcceptableOrUnknown(
              data['medication_id']!, _medicationIdMeta));
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('previous_quantity')) {
      context.handle(
          _previousQuantityMeta,
          previousQuantity.isAcceptableOrUnknown(
              data['previous_quantity']!, _previousQuantityMeta));
    } else if (isInserting) {
      context.missing(_previousQuantityMeta);
    }
    if (data.containsKey('new_quantity')) {
      context.handle(
          _newQuantityMeta,
          newQuantity.isAcceptableOrUnknown(
              data['new_quantity']!, _newQuantityMeta));
    } else if (isInserting) {
      context.missing(_newQuantityMeta);
    }
    if (data.containsKey('change_amount')) {
      context.handle(
          _changeAmountMeta,
          changeAmount.isAcceptableOrUnknown(
              data['change_amount']!, _changeAmountMeta));
    } else if (isInserting) {
      context.missing(_changeAmountMeta);
    }
    if (data.containsKey('change_reason')) {
      context.handle(
          _changeReasonMeta,
          changeReason.isAcceptableOrUnknown(
              data['change_reason']!, _changeReasonMeta));
    } else if (isInserting) {
      context.missing(_changeReasonMeta);
    }
    if (data.containsKey('related_task_completion_id')) {
      context.handle(
          _relatedTaskCompletionIdMeta,
          relatedTaskCompletionId.isAcceptableOrUnknown(
              data['related_task_completion_id']!,
              _relatedTaskCompletionIdMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationInventoryLogData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationInventoryLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      medicationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}medication_id'])!,
      previousQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}previous_quantity'])!,
      newQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}new_quantity'])!,
      changeAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}change_amount'])!,
      changeReason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}change_reason'])!,
      relatedTaskCompletionId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}related_task_completion_id']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $MedicationInventoryLogTable createAlias(String alias) {
    return $MedicationInventoryLogTable(attachedDatabase, alias);
  }
}

class MedicationInventoryLogData extends DataClass
    implements Insertable<MedicationInventoryLogData> {
  final int id;
  final int medicationId;
  final double previousQuantity;
  final double newQuantity;
  final double changeAmount;
  final String changeReason;
  final int? relatedTaskCompletionId;
  final DateTime timestamp;
  const MedicationInventoryLogData(
      {required this.id,
      required this.medicationId,
      required this.previousQuantity,
      required this.newQuantity,
      required this.changeAmount,
      required this.changeReason,
      this.relatedTaskCompletionId,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medication_id'] = Variable<int>(medicationId);
    map['previous_quantity'] = Variable<double>(previousQuantity);
    map['new_quantity'] = Variable<double>(newQuantity);
    map['change_amount'] = Variable<double>(changeAmount);
    map['change_reason'] = Variable<String>(changeReason);
    if (!nullToAbsent || relatedTaskCompletionId != null) {
      map['related_task_completion_id'] =
          Variable<int>(relatedTaskCompletionId);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  MedicationInventoryLogCompanion toCompanion(bool nullToAbsent) {
    return MedicationInventoryLogCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      previousQuantity: Value(previousQuantity),
      newQuantity: Value(newQuantity),
      changeAmount: Value(changeAmount),
      changeReason: Value(changeReason),
      relatedTaskCompletionId: relatedTaskCompletionId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedTaskCompletionId),
      timestamp: Value(timestamp),
    );
  }

  factory MedicationInventoryLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationInventoryLogData(
      id: serializer.fromJson<int>(json['id']),
      medicationId: serializer.fromJson<int>(json['medicationId']),
      previousQuantity: serializer.fromJson<double>(json['previousQuantity']),
      newQuantity: serializer.fromJson<double>(json['newQuantity']),
      changeAmount: serializer.fromJson<double>(json['changeAmount']),
      changeReason: serializer.fromJson<String>(json['changeReason']),
      relatedTaskCompletionId:
          serializer.fromJson<int?>(json['relatedTaskCompletionId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicationId': serializer.toJson<int>(medicationId),
      'previousQuantity': serializer.toJson<double>(previousQuantity),
      'newQuantity': serializer.toJson<double>(newQuantity),
      'changeAmount': serializer.toJson<double>(changeAmount),
      'changeReason': serializer.toJson<String>(changeReason),
      'relatedTaskCompletionId':
          serializer.toJson<int?>(relatedTaskCompletionId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  MedicationInventoryLogData copyWith(
          {int? id,
          int? medicationId,
          double? previousQuantity,
          double? newQuantity,
          double? changeAmount,
          String? changeReason,
          Value<int?> relatedTaskCompletionId = const Value.absent(),
          DateTime? timestamp}) =>
      MedicationInventoryLogData(
        id: id ?? this.id,
        medicationId: medicationId ?? this.medicationId,
        previousQuantity: previousQuantity ?? this.previousQuantity,
        newQuantity: newQuantity ?? this.newQuantity,
        changeAmount: changeAmount ?? this.changeAmount,
        changeReason: changeReason ?? this.changeReason,
        relatedTaskCompletionId: relatedTaskCompletionId.present
            ? relatedTaskCompletionId.value
            : this.relatedTaskCompletionId,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('MedicationInventoryLogData(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('previousQuantity: $previousQuantity, ')
          ..write('newQuantity: $newQuantity, ')
          ..write('changeAmount: $changeAmount, ')
          ..write('changeReason: $changeReason, ')
          ..write('relatedTaskCompletionId: $relatedTaskCompletionId, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      medicationId,
      previousQuantity,
      newQuantity,
      changeAmount,
      changeReason,
      relatedTaskCompletionId,
      timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationInventoryLogData &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.previousQuantity == this.previousQuantity &&
          other.newQuantity == this.newQuantity &&
          other.changeAmount == this.changeAmount &&
          other.changeReason == this.changeReason &&
          other.relatedTaskCompletionId == this.relatedTaskCompletionId &&
          other.timestamp == this.timestamp);
}

class MedicationInventoryLogCompanion
    extends UpdateCompanion<MedicationInventoryLogData> {
  final Value<int> id;
  final Value<int> medicationId;
  final Value<double> previousQuantity;
  final Value<double> newQuantity;
  final Value<double> changeAmount;
  final Value<String> changeReason;
  final Value<int?> relatedTaskCompletionId;
  final Value<DateTime> timestamp;
  const MedicationInventoryLogCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.previousQuantity = const Value.absent(),
    this.newQuantity = const Value.absent(),
    this.changeAmount = const Value.absent(),
    this.changeReason = const Value.absent(),
    this.relatedTaskCompletionId = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  MedicationInventoryLogCompanion.insert({
    this.id = const Value.absent(),
    required int medicationId,
    required double previousQuantity,
    required double newQuantity,
    required double changeAmount,
    required String changeReason,
    this.relatedTaskCompletionId = const Value.absent(),
    this.timestamp = const Value.absent(),
  })  : medicationId = Value(medicationId),
        previousQuantity = Value(previousQuantity),
        newQuantity = Value(newQuantity),
        changeAmount = Value(changeAmount),
        changeReason = Value(changeReason);
  static Insertable<MedicationInventoryLogData> custom({
    Expression<int>? id,
    Expression<int>? medicationId,
    Expression<double>? previousQuantity,
    Expression<double>? newQuantity,
    Expression<double>? changeAmount,
    Expression<String>? changeReason,
    Expression<int>? relatedTaskCompletionId,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (previousQuantity != null) 'previous_quantity': previousQuantity,
      if (newQuantity != null) 'new_quantity': newQuantity,
      if (changeAmount != null) 'change_amount': changeAmount,
      if (changeReason != null) 'change_reason': changeReason,
      if (relatedTaskCompletionId != null)
        'related_task_completion_id': relatedTaskCompletionId,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  MedicationInventoryLogCompanion copyWith(
      {Value<int>? id,
      Value<int>? medicationId,
      Value<double>? previousQuantity,
      Value<double>? newQuantity,
      Value<double>? changeAmount,
      Value<String>? changeReason,
      Value<int?>? relatedTaskCompletionId,
      Value<DateTime>? timestamp}) {
    return MedicationInventoryLogCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      previousQuantity: previousQuantity ?? this.previousQuantity,
      newQuantity: newQuantity ?? this.newQuantity,
      changeAmount: changeAmount ?? this.changeAmount,
      changeReason: changeReason ?? this.changeReason,
      relatedTaskCompletionId:
          relatedTaskCompletionId ?? this.relatedTaskCompletionId,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<int>(medicationId.value);
    }
    if (previousQuantity.present) {
      map['previous_quantity'] = Variable<double>(previousQuantity.value);
    }
    if (newQuantity.present) {
      map['new_quantity'] = Variable<double>(newQuantity.value);
    }
    if (changeAmount.present) {
      map['change_amount'] = Variable<double>(changeAmount.value);
    }
    if (changeReason.present) {
      map['change_reason'] = Variable<String>(changeReason.value);
    }
    if (relatedTaskCompletionId.present) {
      map['related_task_completion_id'] =
          Variable<int>(relatedTaskCompletionId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationInventoryLogCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('previousQuantity: $previousQuantity, ')
          ..write('newQuantity: $newQuantity, ')
          ..write('changeAmount: $changeAmount, ')
          ..write('changeReason: $changeReason, ')
          ..write('relatedTaskCompletionId: $relatedTaskCompletionId, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $TaskTriggersTable extends TaskTriggers
    with TableInfo<$TaskTriggersTable, TaskTrigger> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTriggersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceTaskIdMeta =
      const VerificationMeta('sourceTaskId');
  @override
  late final GeneratedColumn<int> sourceTaskId = GeneratedColumn<int>(
      'source_task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _triggerTypeMeta =
      const VerificationMeta('triggerType');
  @override
  late final GeneratedColumn<String> triggerType = GeneratedColumn<String>(
      'trigger_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _triggerConditionMeta =
      const VerificationMeta('triggerCondition');
  @override
  late final GeneratedColumn<String> triggerCondition = GeneratedColumn<String>(
      'trigger_condition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetTaskTitleMeta =
      const VerificationMeta('targetTaskTitle');
  @override
  late final GeneratedColumn<String> targetTaskTitle = GeneratedColumn<String>(
      'target_task_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetTaskDescriptionMeta =
      const VerificationMeta('targetTaskDescription');
  @override
  late final GeneratedColumn<String> targetTaskDescription =
      GeneratedColumn<String>('target_task_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _targetTaskTypeMeta =
      const VerificationMeta('targetTaskType');
  @override
  late final GeneratedColumn<String> targetTaskType = GeneratedColumn<String>(
      'target_task_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('standard'));
  static const VerificationMeta _targetImportanceMeta =
      const VerificationMeta('targetImportance');
  @override
  late final GeneratedColumn<String> targetImportance = GeneratedColumn<String>(
      'target_importance', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _lastTriggeredMeta =
      const VerificationMeta('lastTriggered');
  @override
  late final GeneratedColumn<DateTime> lastTriggered =
      GeneratedColumn<DateTime>('last_triggered', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdTaskIdMeta =
      const VerificationMeta('createdTaskId');
  @override
  late final GeneratedColumn<int> createdTaskId = GeneratedColumn<int>(
      'created_task_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sourceTaskId,
        triggerType,
        triggerCondition,
        targetTaskTitle,
        targetTaskDescription,
        targetTaskType,
        targetImportance,
        isActive,
        lastTriggered,
        createdTaskId,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_triggers';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTrigger> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_task_id')) {
      context.handle(
          _sourceTaskIdMeta,
          sourceTaskId.isAcceptableOrUnknown(
              data['source_task_id']!, _sourceTaskIdMeta));
    } else if (isInserting) {
      context.missing(_sourceTaskIdMeta);
    }
    if (data.containsKey('trigger_type')) {
      context.handle(
          _triggerTypeMeta,
          triggerType.isAcceptableOrUnknown(
              data['trigger_type']!, _triggerTypeMeta));
    } else if (isInserting) {
      context.missing(_triggerTypeMeta);
    }
    if (data.containsKey('trigger_condition')) {
      context.handle(
          _triggerConditionMeta,
          triggerCondition.isAcceptableOrUnknown(
              data['trigger_condition']!, _triggerConditionMeta));
    } else if (isInserting) {
      context.missing(_triggerConditionMeta);
    }
    if (data.containsKey('target_task_title')) {
      context.handle(
          _targetTaskTitleMeta,
          targetTaskTitle.isAcceptableOrUnknown(
              data['target_task_title']!, _targetTaskTitleMeta));
    } else if (isInserting) {
      context.missing(_targetTaskTitleMeta);
    }
    if (data.containsKey('target_task_description')) {
      context.handle(
          _targetTaskDescriptionMeta,
          targetTaskDescription.isAcceptableOrUnknown(
              data['target_task_description']!, _targetTaskDescriptionMeta));
    }
    if (data.containsKey('target_task_type')) {
      context.handle(
          _targetTaskTypeMeta,
          targetTaskType.isAcceptableOrUnknown(
              data['target_task_type']!, _targetTaskTypeMeta));
    }
    if (data.containsKey('target_importance')) {
      context.handle(
          _targetImportanceMeta,
          targetImportance.isAcceptableOrUnknown(
              data['target_importance']!, _targetImportanceMeta));
    } else if (isInserting) {
      context.missing(_targetImportanceMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('last_triggered')) {
      context.handle(
          _lastTriggeredMeta,
          lastTriggered.isAcceptableOrUnknown(
              data['last_triggered']!, _lastTriggeredMeta));
    }
    if (data.containsKey('created_task_id')) {
      context.handle(
          _createdTaskIdMeta,
          createdTaskId.isAcceptableOrUnknown(
              data['created_task_id']!, _createdTaskIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTrigger map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTrigger(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sourceTaskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source_task_id'])!,
      triggerType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trigger_type'])!,
      triggerCondition: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}trigger_condition'])!,
      targetTaskTitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_task_title'])!,
      targetTaskDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}target_task_description']),
      targetTaskType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_task_type'])!,
      targetImportance: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_importance'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      lastTriggered: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_triggered']),
      createdTaskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_task_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TaskTriggersTable createAlias(String alias) {
    return $TaskTriggersTable(attachedDatabase, alias);
  }
}

class TaskTrigger extends DataClass implements Insertable<TaskTrigger> {
  final int id;
  final int sourceTaskId;
  final String triggerType;
  final String triggerCondition;
  final String targetTaskTitle;
  final String? targetTaskDescription;
  final String targetTaskType;
  final String targetImportance;
  final bool isActive;
  final DateTime? lastTriggered;
  final int? createdTaskId;
  final DateTime createdAt;
  const TaskTrigger(
      {required this.id,
      required this.sourceTaskId,
      required this.triggerType,
      required this.triggerCondition,
      required this.targetTaskTitle,
      this.targetTaskDescription,
      required this.targetTaskType,
      required this.targetImportance,
      required this.isActive,
      this.lastTriggered,
      this.createdTaskId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_task_id'] = Variable<int>(sourceTaskId);
    map['trigger_type'] = Variable<String>(triggerType);
    map['trigger_condition'] = Variable<String>(triggerCondition);
    map['target_task_title'] = Variable<String>(targetTaskTitle);
    if (!nullToAbsent || targetTaskDescription != null) {
      map['target_task_description'] = Variable<String>(targetTaskDescription);
    }
    map['target_task_type'] = Variable<String>(targetTaskType);
    map['target_importance'] = Variable<String>(targetImportance);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || lastTriggered != null) {
      map['last_triggered'] = Variable<DateTime>(lastTriggered);
    }
    if (!nullToAbsent || createdTaskId != null) {
      map['created_task_id'] = Variable<int>(createdTaskId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TaskTriggersCompanion toCompanion(bool nullToAbsent) {
    return TaskTriggersCompanion(
      id: Value(id),
      sourceTaskId: Value(sourceTaskId),
      triggerType: Value(triggerType),
      triggerCondition: Value(triggerCondition),
      targetTaskTitle: Value(targetTaskTitle),
      targetTaskDescription: targetTaskDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(targetTaskDescription),
      targetTaskType: Value(targetTaskType),
      targetImportance: Value(targetImportance),
      isActive: Value(isActive),
      lastTriggered: lastTriggered == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTriggered),
      createdTaskId: createdTaskId == null && nullToAbsent
          ? const Value.absent()
          : Value(createdTaskId),
      createdAt: Value(createdAt),
    );
  }

  factory TaskTrigger.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTrigger(
      id: serializer.fromJson<int>(json['id']),
      sourceTaskId: serializer.fromJson<int>(json['sourceTaskId']),
      triggerType: serializer.fromJson<String>(json['triggerType']),
      triggerCondition: serializer.fromJson<String>(json['triggerCondition']),
      targetTaskTitle: serializer.fromJson<String>(json['targetTaskTitle']),
      targetTaskDescription:
          serializer.fromJson<String?>(json['targetTaskDescription']),
      targetTaskType: serializer.fromJson<String>(json['targetTaskType']),
      targetImportance: serializer.fromJson<String>(json['targetImportance']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      lastTriggered: serializer.fromJson<DateTime?>(json['lastTriggered']),
      createdTaskId: serializer.fromJson<int?>(json['createdTaskId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceTaskId': serializer.toJson<int>(sourceTaskId),
      'triggerType': serializer.toJson<String>(triggerType),
      'triggerCondition': serializer.toJson<String>(triggerCondition),
      'targetTaskTitle': serializer.toJson<String>(targetTaskTitle),
      'targetTaskDescription':
          serializer.toJson<String?>(targetTaskDescription),
      'targetTaskType': serializer.toJson<String>(targetTaskType),
      'targetImportance': serializer.toJson<String>(targetImportance),
      'isActive': serializer.toJson<bool>(isActive),
      'lastTriggered': serializer.toJson<DateTime?>(lastTriggered),
      'createdTaskId': serializer.toJson<int?>(createdTaskId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TaskTrigger copyWith(
          {int? id,
          int? sourceTaskId,
          String? triggerType,
          String? triggerCondition,
          String? targetTaskTitle,
          Value<String?> targetTaskDescription = const Value.absent(),
          String? targetTaskType,
          String? targetImportance,
          bool? isActive,
          Value<DateTime?> lastTriggered = const Value.absent(),
          Value<int?> createdTaskId = const Value.absent(),
          DateTime? createdAt}) =>
      TaskTrigger(
        id: id ?? this.id,
        sourceTaskId: sourceTaskId ?? this.sourceTaskId,
        triggerType: triggerType ?? this.triggerType,
        triggerCondition: triggerCondition ?? this.triggerCondition,
        targetTaskTitle: targetTaskTitle ?? this.targetTaskTitle,
        targetTaskDescription: targetTaskDescription.present
            ? targetTaskDescription.value
            : this.targetTaskDescription,
        targetTaskType: targetTaskType ?? this.targetTaskType,
        targetImportance: targetImportance ?? this.targetImportance,
        isActive: isActive ?? this.isActive,
        lastTriggered:
            lastTriggered.present ? lastTriggered.value : this.lastTriggered,
        createdTaskId:
            createdTaskId.present ? createdTaskId.value : this.createdTaskId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('TaskTrigger(')
          ..write('id: $id, ')
          ..write('sourceTaskId: $sourceTaskId, ')
          ..write('triggerType: $triggerType, ')
          ..write('triggerCondition: $triggerCondition, ')
          ..write('targetTaskTitle: $targetTaskTitle, ')
          ..write('targetTaskDescription: $targetTaskDescription, ')
          ..write('targetTaskType: $targetTaskType, ')
          ..write('targetImportance: $targetImportance, ')
          ..write('isActive: $isActive, ')
          ..write('lastTriggered: $lastTriggered, ')
          ..write('createdTaskId: $createdTaskId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sourceTaskId,
      triggerType,
      triggerCondition,
      targetTaskTitle,
      targetTaskDescription,
      targetTaskType,
      targetImportance,
      isActive,
      lastTriggered,
      createdTaskId,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTrigger &&
          other.id == this.id &&
          other.sourceTaskId == this.sourceTaskId &&
          other.triggerType == this.triggerType &&
          other.triggerCondition == this.triggerCondition &&
          other.targetTaskTitle == this.targetTaskTitle &&
          other.targetTaskDescription == this.targetTaskDescription &&
          other.targetTaskType == this.targetTaskType &&
          other.targetImportance == this.targetImportance &&
          other.isActive == this.isActive &&
          other.lastTriggered == this.lastTriggered &&
          other.createdTaskId == this.createdTaskId &&
          other.createdAt == this.createdAt);
}

class TaskTriggersCompanion extends UpdateCompanion<TaskTrigger> {
  final Value<int> id;
  final Value<int> sourceTaskId;
  final Value<String> triggerType;
  final Value<String> triggerCondition;
  final Value<String> targetTaskTitle;
  final Value<String?> targetTaskDescription;
  final Value<String> targetTaskType;
  final Value<String> targetImportance;
  final Value<bool> isActive;
  final Value<DateTime?> lastTriggered;
  final Value<int?> createdTaskId;
  final Value<DateTime> createdAt;
  const TaskTriggersCompanion({
    this.id = const Value.absent(),
    this.sourceTaskId = const Value.absent(),
    this.triggerType = const Value.absent(),
    this.triggerCondition = const Value.absent(),
    this.targetTaskTitle = const Value.absent(),
    this.targetTaskDescription = const Value.absent(),
    this.targetTaskType = const Value.absent(),
    this.targetImportance = const Value.absent(),
    this.isActive = const Value.absent(),
    this.lastTriggered = const Value.absent(),
    this.createdTaskId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TaskTriggersCompanion.insert({
    this.id = const Value.absent(),
    required int sourceTaskId,
    required String triggerType,
    required String triggerCondition,
    required String targetTaskTitle,
    this.targetTaskDescription = const Value.absent(),
    this.targetTaskType = const Value.absent(),
    required String targetImportance,
    this.isActive = const Value.absent(),
    this.lastTriggered = const Value.absent(),
    this.createdTaskId = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : sourceTaskId = Value(sourceTaskId),
        triggerType = Value(triggerType),
        triggerCondition = Value(triggerCondition),
        targetTaskTitle = Value(targetTaskTitle),
        targetImportance = Value(targetImportance);
  static Insertable<TaskTrigger> custom({
    Expression<int>? id,
    Expression<int>? sourceTaskId,
    Expression<String>? triggerType,
    Expression<String>? triggerCondition,
    Expression<String>? targetTaskTitle,
    Expression<String>? targetTaskDescription,
    Expression<String>? targetTaskType,
    Expression<String>? targetImportance,
    Expression<bool>? isActive,
    Expression<DateTime>? lastTriggered,
    Expression<int>? createdTaskId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceTaskId != null) 'source_task_id': sourceTaskId,
      if (triggerType != null) 'trigger_type': triggerType,
      if (triggerCondition != null) 'trigger_condition': triggerCondition,
      if (targetTaskTitle != null) 'target_task_title': targetTaskTitle,
      if (targetTaskDescription != null)
        'target_task_description': targetTaskDescription,
      if (targetTaskType != null) 'target_task_type': targetTaskType,
      if (targetImportance != null) 'target_importance': targetImportance,
      if (isActive != null) 'is_active': isActive,
      if (lastTriggered != null) 'last_triggered': lastTriggered,
      if (createdTaskId != null) 'created_task_id': createdTaskId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TaskTriggersCompanion copyWith(
      {Value<int>? id,
      Value<int>? sourceTaskId,
      Value<String>? triggerType,
      Value<String>? triggerCondition,
      Value<String>? targetTaskTitle,
      Value<String?>? targetTaskDescription,
      Value<String>? targetTaskType,
      Value<String>? targetImportance,
      Value<bool>? isActive,
      Value<DateTime?>? lastTriggered,
      Value<int?>? createdTaskId,
      Value<DateTime>? createdAt}) {
    return TaskTriggersCompanion(
      id: id ?? this.id,
      sourceTaskId: sourceTaskId ?? this.sourceTaskId,
      triggerType: triggerType ?? this.triggerType,
      triggerCondition: triggerCondition ?? this.triggerCondition,
      targetTaskTitle: targetTaskTitle ?? this.targetTaskTitle,
      targetTaskDescription:
          targetTaskDescription ?? this.targetTaskDescription,
      targetTaskType: targetTaskType ?? this.targetTaskType,
      targetImportance: targetImportance ?? this.targetImportance,
      isActive: isActive ?? this.isActive,
      lastTriggered: lastTriggered ?? this.lastTriggered,
      createdTaskId: createdTaskId ?? this.createdTaskId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceTaskId.present) {
      map['source_task_id'] = Variable<int>(sourceTaskId.value);
    }
    if (triggerType.present) {
      map['trigger_type'] = Variable<String>(triggerType.value);
    }
    if (triggerCondition.present) {
      map['trigger_condition'] = Variable<String>(triggerCondition.value);
    }
    if (targetTaskTitle.present) {
      map['target_task_title'] = Variable<String>(targetTaskTitle.value);
    }
    if (targetTaskDescription.present) {
      map['target_task_description'] =
          Variable<String>(targetTaskDescription.value);
    }
    if (targetTaskType.present) {
      map['target_task_type'] = Variable<String>(targetTaskType.value);
    }
    if (targetImportance.present) {
      map['target_importance'] = Variable<String>(targetImportance.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (lastTriggered.present) {
      map['last_triggered'] = Variable<DateTime>(lastTriggered.value);
    }
    if (createdTaskId.present) {
      map['created_task_id'] = Variable<int>(createdTaskId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTriggersCompanion(')
          ..write('id: $id, ')
          ..write('sourceTaskId: $sourceTaskId, ')
          ..write('triggerType: $triggerType, ')
          ..write('triggerCondition: $triggerCondition, ')
          ..write('targetTaskTitle: $targetTaskTitle, ')
          ..write('targetTaskDescription: $targetTaskDescription, ')
          ..write('targetTaskType: $targetTaskType, ')
          ..write('targetImportance: $targetImportance, ')
          ..write('isActive: $isActive, ')
          ..write('lastTriggered: $lastTriggered, ')
          ..write('createdTaskId: $createdTaskId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _currentStreakMeta =
      const VerificationMeta('currentStreak');
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
      'current_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _longestStreakMeta =
      const VerificationMeta('longestStreak');
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
      'longest_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastCompletedDateMeta =
      const VerificationMeta('lastCompletedDate');
  @override
  late final GeneratedColumn<DateTime> lastCompletedDate =
      GeneratedColumn<DateTime>('last_completed_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, taskId, currentStreak, longestStreak, lastCompletedDate, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('current_streak')) {
      context.handle(
          _currentStreakMeta,
          currentStreak.isAcceptableOrUnknown(
              data['current_streak']!, _currentStreakMeta));
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
          _longestStreakMeta,
          longestStreak.isAcceptableOrUnknown(
              data['longest_streak']!, _longestStreakMeta));
    }
    if (data.containsKey('last_completed_date')) {
      context.handle(
          _lastCompletedDateMeta,
          lastCompletedDate.isAcceptableOrUnknown(
              data['last_completed_date']!, _lastCompletedDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      currentStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_streak'])!,
      longestStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}longest_streak'])!,
      lastCompletedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_completed_date']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final int taskId;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastCompletedDate;
  final DateTime createdAt;
  const Habit(
      {required this.id,
      required this.taskId,
      required this.currentStreak,
      required this.longestStreak,
      this.lastCompletedDate,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<int>(taskId);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    if (!nullToAbsent || lastCompletedDate != null) {
      map['last_completed_date'] = Variable<DateTime>(lastCompletedDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      taskId: Value(taskId),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      lastCompletedDate: lastCompletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompletedDate),
      createdAt: Value(createdAt),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<int>(json['taskId']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      lastCompletedDate:
          serializer.fromJson<DateTime?>(json['lastCompletedDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<int>(taskId),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'lastCompletedDate': serializer.toJson<DateTime?>(lastCompletedDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Habit copyWith(
          {int? id,
          int? taskId,
          int? currentStreak,
          int? longestStreak,
          Value<DateTime?> lastCompletedDate = const Value.absent(),
          DateTime? createdAt}) =>
      Habit(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        currentStreak: currentStreak ?? this.currentStreak,
        longestStreak: longestStreak ?? this.longestStreak,
        lastCompletedDate: lastCompletedDate.present
            ? lastCompletedDate.value
            : this.lastCompletedDate,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastCompletedDate: $lastCompletedDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, taskId, currentStreak, longestStreak, lastCompletedDate, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.lastCompletedDate == this.lastCompletedDate &&
          other.createdAt == this.createdAt);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<int> taskId;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<DateTime?> lastCompletedDate;
  final Value<DateTime> createdAt;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastCompletedDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    required int taskId,
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastCompletedDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : taskId = Value(taskId);
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<int>? taskId,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<DateTime>? lastCompletedDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (lastCompletedDate != null) 'last_completed_date': lastCompletedDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HabitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskId,
      Value<int>? currentStreak,
      Value<int>? longestStreak,
      Value<DateTime?>? lastCompletedDate,
      Value<DateTime>? createdAt}) {
    return HabitsCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastCompletedDate: lastCompletedDate ?? this.lastCompletedDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (lastCompletedDate.present) {
      map['last_completed_date'] = Variable<DateTime>(lastCompletedDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastCompletedDate: $lastCompletedDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BillsTable extends Bills with TableInfo<$BillsTable, Bill> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('USD'));
  static const VerificationMeta _payeeMeta = const VerificationMeta('payee');
  @override
  late final GeneratedColumn<String> payee = GeneratedColumn<String>(
      'payee', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNumberMeta =
      const VerificationMeta('accountNumber');
  @override
  late final GeneratedColumn<String> accountNumber = GeneratedColumn<String>(
      'account_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
      'is_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_paid" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _paidAtMeta = const VerificationMeta('paidAt');
  @override
  late final GeneratedColumn<DateTime> paidAt = GeneratedColumn<DateTime>(
      'paid_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        taskId,
        amount,
        currency,
        payee,
        accountNumber,
        paymentMethod,
        isPaid,
        paidAt,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bills';
  @override
  VerificationContext validateIntegrity(Insertable<Bill> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('payee')) {
      context.handle(
          _payeeMeta, payee.isAcceptableOrUnknown(data['payee']!, _payeeMeta));
    } else if (isInserting) {
      context.missing(_payeeMeta);
    }
    if (data.containsKey('account_number')) {
      context.handle(
          _accountNumberMeta,
          accountNumber.isAcceptableOrUnknown(
              data['account_number']!, _accountNumberMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('is_paid')) {
      context.handle(_isPaidMeta,
          isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta));
    }
    if (data.containsKey('paid_at')) {
      context.handle(_paidAtMeta,
          paidAt.isAcceptableOrUnknown(data['paid_at']!, _paidAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bill map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bill(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      payee: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payee'])!,
      accountNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_number']),
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method']),
      isPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paid'])!,
      paidAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}paid_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BillsTable createAlias(String alias) {
    return $BillsTable(attachedDatabase, alias);
  }
}

class Bill extends DataClass implements Insertable<Bill> {
  final int id;
  final int taskId;
  final double amount;
  final String currency;
  final String payee;
  final String? accountNumber;
  final String? paymentMethod;
  final bool isPaid;
  final DateTime? paidAt;
  final DateTime createdAt;
  const Bill(
      {required this.id,
      required this.taskId,
      required this.amount,
      required this.currency,
      required this.payee,
      this.accountNumber,
      this.paymentMethod,
      required this.isPaid,
      this.paidAt,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<int>(taskId);
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    map['payee'] = Variable<String>(payee);
    if (!nullToAbsent || accountNumber != null) {
      map['account_number'] = Variable<String>(accountNumber);
    }
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    map['is_paid'] = Variable<bool>(isPaid);
    if (!nullToAbsent || paidAt != null) {
      map['paid_at'] = Variable<DateTime>(paidAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BillsCompanion toCompanion(bool nullToAbsent) {
    return BillsCompanion(
      id: Value(id),
      taskId: Value(taskId),
      amount: Value(amount),
      currency: Value(currency),
      payee: Value(payee),
      accountNumber: accountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(accountNumber),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      isPaid: Value(isPaid),
      paidAt:
          paidAt == null && nullToAbsent ? const Value.absent() : Value(paidAt),
      createdAt: Value(createdAt),
    );
  }

  factory Bill.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bill(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<int>(json['taskId']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      payee: serializer.fromJson<String>(json['payee']),
      accountNumber: serializer.fromJson<String?>(json['accountNumber']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
      paidAt: serializer.fromJson<DateTime?>(json['paidAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<int>(taskId),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'payee': serializer.toJson<String>(payee),
      'accountNumber': serializer.toJson<String?>(accountNumber),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'isPaid': serializer.toJson<bool>(isPaid),
      'paidAt': serializer.toJson<DateTime?>(paidAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Bill copyWith(
          {int? id,
          int? taskId,
          double? amount,
          String? currency,
          String? payee,
          Value<String?> accountNumber = const Value.absent(),
          Value<String?> paymentMethod = const Value.absent(),
          bool? isPaid,
          Value<DateTime?> paidAt = const Value.absent(),
          DateTime? createdAt}) =>
      Bill(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        payee: payee ?? this.payee,
        accountNumber:
            accountNumber.present ? accountNumber.value : this.accountNumber,
        paymentMethod:
            paymentMethod.present ? paymentMethod.value : this.paymentMethod,
        isPaid: isPaid ?? this.isPaid,
        paidAt: paidAt.present ? paidAt.value : this.paidAt,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Bill(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('payee: $payee, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('isPaid: $isPaid, ')
          ..write('paidAt: $paidAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, taskId, amount, currency, payee,
      accountNumber, paymentMethod, isPaid, paidAt, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bill &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.payee == this.payee &&
          other.accountNumber == this.accountNumber &&
          other.paymentMethod == this.paymentMethod &&
          other.isPaid == this.isPaid &&
          other.paidAt == this.paidAt &&
          other.createdAt == this.createdAt);
}

class BillsCompanion extends UpdateCompanion<Bill> {
  final Value<int> id;
  final Value<int> taskId;
  final Value<double> amount;
  final Value<String> currency;
  final Value<String> payee;
  final Value<String?> accountNumber;
  final Value<String?> paymentMethod;
  final Value<bool> isPaid;
  final Value<DateTime?> paidAt;
  final Value<DateTime> createdAt;
  const BillsCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.payee = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BillsCompanion.insert({
    this.id = const Value.absent(),
    required int taskId,
    required double amount,
    this.currency = const Value.absent(),
    required String payee,
    this.accountNumber = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : taskId = Value(taskId),
        amount = Value(amount),
        payee = Value(payee);
  static Insertable<Bill> custom({
    Expression<int>? id,
    Expression<int>? taskId,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<String>? payee,
    Expression<String>? accountNumber,
    Expression<String>? paymentMethod,
    Expression<bool>? isPaid,
    Expression<DateTime>? paidAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (payee != null) 'payee': payee,
      if (accountNumber != null) 'account_number': accountNumber,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (isPaid != null) 'is_paid': isPaid,
      if (paidAt != null) 'paid_at': paidAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BillsCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskId,
      Value<double>? amount,
      Value<String>? currency,
      Value<String>? payee,
      Value<String?>? accountNumber,
      Value<String?>? paymentMethod,
      Value<bool>? isPaid,
      Value<DateTime?>? paidAt,
      Value<DateTime>? createdAt}) {
    return BillsCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      payee: payee ?? this.payee,
      accountNumber: accountNumber ?? this.accountNumber,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      isPaid: isPaid ?? this.isPaid,
      paidAt: paidAt ?? this.paidAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (payee.present) {
      map['payee'] = Variable<String>(payee.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<String>(accountNumber.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (paidAt.present) {
      map['paid_at'] = Variable<DateTime>(paidAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillsCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('payee: $payee, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('isPaid: $isPaid, ')
          ..write('paidAt: $paidAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
      'sets', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _workoutTypeMeta =
      const VerificationMeta('workoutType');
  @override
  late final GeneratedColumn<String> workoutType = GeneratedColumn<String>(
      'workout_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, taskId, sets, reps, duration, workoutType, notes, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
          _setsMeta, sets.isAcceptableOrUnknown(data['sets']!, _setsMeta));
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('workout_type')) {
      context.handle(
          _workoutTypeMeta,
          workoutType.isAcceptableOrUnknown(
              data['workout_type']!, _workoutTypeMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      sets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sets']),
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      workoutType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_type']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final int taskId;
  final int? sets;
  final int? reps;
  final int? duration;
  final String? workoutType;
  final String? notes;
  final DateTime createdAt;
  const Exercise(
      {required this.id,
      required this.taskId,
      this.sets,
      this.reps,
      this.duration,
      this.workoutType,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<int>(taskId);
    if (!nullToAbsent || sets != null) {
      map['sets'] = Variable<int>(sets);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || workoutType != null) {
      map['workout_type'] = Variable<String>(workoutType);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      taskId: Value(taskId),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      workoutType: workoutType == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutType),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<int>(json['taskId']),
      sets: serializer.fromJson<int?>(json['sets']),
      reps: serializer.fromJson<int?>(json['reps']),
      duration: serializer.fromJson<int?>(json['duration']),
      workoutType: serializer.fromJson<String?>(json['workoutType']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<int>(taskId),
      'sets': serializer.toJson<int?>(sets),
      'reps': serializer.toJson<int?>(reps),
      'duration': serializer.toJson<int?>(duration),
      'workoutType': serializer.toJson<String?>(workoutType),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Exercise copyWith(
          {int? id,
          int? taskId,
          Value<int?> sets = const Value.absent(),
          Value<int?> reps = const Value.absent(),
          Value<int?> duration = const Value.absent(),
          Value<String?> workoutType = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      Exercise(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        sets: sets.present ? sets.value : this.sets,
        reps: reps.present ? reps.value : this.reps,
        duration: duration.present ? duration.value : this.duration,
        workoutType: workoutType.present ? workoutType.value : this.workoutType,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('duration: $duration, ')
          ..write('workoutType: $workoutType, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, taskId, sets, reps, duration, workoutType, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.sets == this.sets &&
          other.reps == this.reps &&
          other.duration == this.duration &&
          other.workoutType == this.workoutType &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<int> taskId;
  final Value<int?> sets;
  final Value<int?> reps;
  final Value<int?> duration;
  final Value<String?> workoutType;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.sets = const Value.absent(),
    this.reps = const Value.absent(),
    this.duration = const Value.absent(),
    this.workoutType = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    required int taskId,
    this.sets = const Value.absent(),
    this.reps = const Value.absent(),
    this.duration = const Value.absent(),
    this.workoutType = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : taskId = Value(taskId);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<int>? taskId,
    Expression<int>? sets,
    Expression<int>? reps,
    Expression<int>? duration,
    Expression<String>? workoutType,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (sets != null) 'sets': sets,
      if (reps != null) 'reps': reps,
      if (duration != null) 'duration': duration,
      if (workoutType != null) 'workout_type': workoutType,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskId,
      Value<int?>? sets,
      Value<int?>? reps,
      Value<int?>? duration,
      Value<String?>? workoutType,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      duration: duration ?? this.duration,
      workoutType: workoutType ?? this.workoutType,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (workoutType.present) {
      map['workout_type'] = Variable<String>(workoutType.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('duration: $duration, ')
          ..write('workoutType: $workoutType, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ChoresTable extends Chores with TableInfo<$ChoresTable, Chore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _completionCountMeta =
      const VerificationMeta('completionCount');
  @override
  late final GeneratedColumn<int> completionCount = GeneratedColumn<int>(
      'completion_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastCompletedAtMeta =
      const VerificationMeta('lastCompletedAt');
  @override
  late final GeneratedColumn<DateTime> lastCompletedAt =
      GeneratedColumn<DateTime>('last_completed_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cleaningProductsMeta =
      const VerificationMeta('cleaningProducts');
  @override
  late final GeneratedColumn<String> cleaningProducts = GeneratedColumn<String>(
      'cleaning_products', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        taskId,
        completionCount,
        lastCompletedAt,
        cleaningProducts,
        notes,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chores';
  @override
  VerificationContext validateIntegrity(Insertable<Chore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('completion_count')) {
      context.handle(
          _completionCountMeta,
          completionCount.isAcceptableOrUnknown(
              data['completion_count']!, _completionCountMeta));
    }
    if (data.containsKey('last_completed_at')) {
      context.handle(
          _lastCompletedAtMeta,
          lastCompletedAt.isAcceptableOrUnknown(
              data['last_completed_at']!, _lastCompletedAtMeta));
    }
    if (data.containsKey('cleaning_products')) {
      context.handle(
          _cleaningProductsMeta,
          cleaningProducts.isAcceptableOrUnknown(
              data['cleaning_products']!, _cleaningProductsMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chore(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      completionCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}completion_count'])!,
      lastCompletedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_completed_at']),
      cleaningProducts: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cleaning_products']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ChoresTable createAlias(String alias) {
    return $ChoresTable(attachedDatabase, alias);
  }
}

class Chore extends DataClass implements Insertable<Chore> {
  final int id;
  final int taskId;
  final int completionCount;
  final DateTime? lastCompletedAt;
  final String? cleaningProducts;
  final String? notes;
  final DateTime createdAt;
  const Chore(
      {required this.id,
      required this.taskId,
      required this.completionCount,
      this.lastCompletedAt,
      this.cleaningProducts,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<int>(taskId);
    map['completion_count'] = Variable<int>(completionCount);
    if (!nullToAbsent || lastCompletedAt != null) {
      map['last_completed_at'] = Variable<DateTime>(lastCompletedAt);
    }
    if (!nullToAbsent || cleaningProducts != null) {
      map['cleaning_products'] = Variable<String>(cleaningProducts);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ChoresCompanion toCompanion(bool nullToAbsent) {
    return ChoresCompanion(
      id: Value(id),
      taskId: Value(taskId),
      completionCount: Value(completionCount),
      lastCompletedAt: lastCompletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompletedAt),
      cleaningProducts: cleaningProducts == null && nullToAbsent
          ? const Value.absent()
          : Value(cleaningProducts),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Chore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chore(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<int>(json['taskId']),
      completionCount: serializer.fromJson<int>(json['completionCount']),
      lastCompletedAt: serializer.fromJson<DateTime?>(json['lastCompletedAt']),
      cleaningProducts: serializer.fromJson<String?>(json['cleaningProducts']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<int>(taskId),
      'completionCount': serializer.toJson<int>(completionCount),
      'lastCompletedAt': serializer.toJson<DateTime?>(lastCompletedAt),
      'cleaningProducts': serializer.toJson<String?>(cleaningProducts),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Chore copyWith(
          {int? id,
          int? taskId,
          int? completionCount,
          Value<DateTime?> lastCompletedAt = const Value.absent(),
          Value<String?> cleaningProducts = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      Chore(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        completionCount: completionCount ?? this.completionCount,
        lastCompletedAt: lastCompletedAt.present
            ? lastCompletedAt.value
            : this.lastCompletedAt,
        cleaningProducts: cleaningProducts.present
            ? cleaningProducts.value
            : this.cleaningProducts,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Chore(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('completionCount: $completionCount, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('cleaningProducts: $cleaningProducts, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, taskId, completionCount, lastCompletedAt,
      cleaningProducts, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chore &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.completionCount == this.completionCount &&
          other.lastCompletedAt == this.lastCompletedAt &&
          other.cleaningProducts == this.cleaningProducts &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class ChoresCompanion extends UpdateCompanion<Chore> {
  final Value<int> id;
  final Value<int> taskId;
  final Value<int> completionCount;
  final Value<DateTime?> lastCompletedAt;
  final Value<String?> cleaningProducts;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const ChoresCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.completionCount = const Value.absent(),
    this.lastCompletedAt = const Value.absent(),
    this.cleaningProducts = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ChoresCompanion.insert({
    this.id = const Value.absent(),
    required int taskId,
    this.completionCount = const Value.absent(),
    this.lastCompletedAt = const Value.absent(),
    this.cleaningProducts = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : taskId = Value(taskId);
  static Insertable<Chore> custom({
    Expression<int>? id,
    Expression<int>? taskId,
    Expression<int>? completionCount,
    Expression<DateTime>? lastCompletedAt,
    Expression<String>? cleaningProducts,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (completionCount != null) 'completion_count': completionCount,
      if (lastCompletedAt != null) 'last_completed_at': lastCompletedAt,
      if (cleaningProducts != null) 'cleaning_products': cleaningProducts,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ChoresCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskId,
      Value<int>? completionCount,
      Value<DateTime?>? lastCompletedAt,
      Value<String?>? cleaningProducts,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return ChoresCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      completionCount: completionCount ?? this.completionCount,
      lastCompletedAt: lastCompletedAt ?? this.lastCompletedAt,
      cleaningProducts: cleaningProducts ?? this.cleaningProducts,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (completionCount.present) {
      map['completion_count'] = Variable<int>(completionCount.value);
    }
    if (lastCompletedAt.present) {
      map['last_completed_at'] = Variable<DateTime>(lastCompletedAt.value);
    }
    if (cleaningProducts.present) {
      map['cleaning_products'] = Variable<String>(cleaningProducts.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChoresCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('completionCount: $completionCount, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('cleaningProducts: $cleaningProducts, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DaysSinceTable extends DaysSince
    with TableInfo<$DaysSinceTable, DaysSinceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DaysSinceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_tasks (id) ON DELETE CASCADE'));
  static const VerificationMeta _behaviorDescriptionMeta =
      const VerificationMeta('behaviorDescription');
  @override
  late final GeneratedColumn<String> behaviorDescription =
      GeneratedColumn<String>('behavior_description', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastOccurrenceMeta =
      const VerificationMeta('lastOccurrence');
  @override
  late final GeneratedColumn<DateTime> lastOccurrence =
      GeneratedColumn<DateTime>('last_occurrence', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _targetDaysGoalMeta =
      const VerificationMeta('targetDaysGoal');
  @override
  late final GeneratedColumn<int> targetDaysGoal = GeneratedColumn<int>(
      'target_days_goal', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _longestStreakMeta =
      const VerificationMeta('longestStreak');
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
      'longest_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        taskId,
        behaviorDescription,
        lastOccurrence,
        targetDaysGoal,
        longestStreak,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'days_since';
  @override
  VerificationContext validateIntegrity(Insertable<DaysSinceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('behavior_description')) {
      context.handle(
          _behaviorDescriptionMeta,
          behaviorDescription.isAcceptableOrUnknown(
              data['behavior_description']!, _behaviorDescriptionMeta));
    } else if (isInserting) {
      context.missing(_behaviorDescriptionMeta);
    }
    if (data.containsKey('last_occurrence')) {
      context.handle(
          _lastOccurrenceMeta,
          lastOccurrence.isAcceptableOrUnknown(
              data['last_occurrence']!, _lastOccurrenceMeta));
    } else if (isInserting) {
      context.missing(_lastOccurrenceMeta);
    }
    if (data.containsKey('target_days_goal')) {
      context.handle(
          _targetDaysGoalMeta,
          targetDaysGoal.isAcceptableOrUnknown(
              data['target_days_goal']!, _targetDaysGoalMeta));
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
          _longestStreakMeta,
          longestStreak.isAcceptableOrUnknown(
              data['longest_streak']!, _longestStreakMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DaysSinceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DaysSinceData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      behaviorDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}behavior_description'])!,
      lastOccurrence: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_occurrence'])!,
      targetDaysGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_days_goal']),
      longestStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}longest_streak'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $DaysSinceTable createAlias(String alias) {
    return $DaysSinceTable(attachedDatabase, alias);
  }
}

class DaysSinceData extends DataClass implements Insertable<DaysSinceData> {
  final int id;
  final int taskId;
  final String behaviorDescription;
  final DateTime lastOccurrence;
  final int? targetDaysGoal;
  final int longestStreak;
  final DateTime createdAt;
  const DaysSinceData(
      {required this.id,
      required this.taskId,
      required this.behaviorDescription,
      required this.lastOccurrence,
      this.targetDaysGoal,
      required this.longestStreak,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_id'] = Variable<int>(taskId);
    map['behavior_description'] = Variable<String>(behaviorDescription);
    map['last_occurrence'] = Variable<DateTime>(lastOccurrence);
    if (!nullToAbsent || targetDaysGoal != null) {
      map['target_days_goal'] = Variable<int>(targetDaysGoal);
    }
    map['longest_streak'] = Variable<int>(longestStreak);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DaysSinceCompanion toCompanion(bool nullToAbsent) {
    return DaysSinceCompanion(
      id: Value(id),
      taskId: Value(taskId),
      behaviorDescription: Value(behaviorDescription),
      lastOccurrence: Value(lastOccurrence),
      targetDaysGoal: targetDaysGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDaysGoal),
      longestStreak: Value(longestStreak),
      createdAt: Value(createdAt),
    );
  }

  factory DaysSinceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DaysSinceData(
      id: serializer.fromJson<int>(json['id']),
      taskId: serializer.fromJson<int>(json['taskId']),
      behaviorDescription:
          serializer.fromJson<String>(json['behaviorDescription']),
      lastOccurrence: serializer.fromJson<DateTime>(json['lastOccurrence']),
      targetDaysGoal: serializer.fromJson<int?>(json['targetDaysGoal']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskId': serializer.toJson<int>(taskId),
      'behaviorDescription': serializer.toJson<String>(behaviorDescription),
      'lastOccurrence': serializer.toJson<DateTime>(lastOccurrence),
      'targetDaysGoal': serializer.toJson<int?>(targetDaysGoal),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DaysSinceData copyWith(
          {int? id,
          int? taskId,
          String? behaviorDescription,
          DateTime? lastOccurrence,
          Value<int?> targetDaysGoal = const Value.absent(),
          int? longestStreak,
          DateTime? createdAt}) =>
      DaysSinceData(
        id: id ?? this.id,
        taskId: taskId ?? this.taskId,
        behaviorDescription: behaviorDescription ?? this.behaviorDescription,
        lastOccurrence: lastOccurrence ?? this.lastOccurrence,
        targetDaysGoal:
            targetDaysGoal.present ? targetDaysGoal.value : this.targetDaysGoal,
        longestStreak: longestStreak ?? this.longestStreak,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DaysSinceData(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('behaviorDescription: $behaviorDescription, ')
          ..write('lastOccurrence: $lastOccurrence, ')
          ..write('targetDaysGoal: $targetDaysGoal, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, taskId, behaviorDescription,
      lastOccurrence, targetDaysGoal, longestStreak, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DaysSinceData &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.behaviorDescription == this.behaviorDescription &&
          other.lastOccurrence == this.lastOccurrence &&
          other.targetDaysGoal == this.targetDaysGoal &&
          other.longestStreak == this.longestStreak &&
          other.createdAt == this.createdAt);
}

class DaysSinceCompanion extends UpdateCompanion<DaysSinceData> {
  final Value<int> id;
  final Value<int> taskId;
  final Value<String> behaviorDescription;
  final Value<DateTime> lastOccurrence;
  final Value<int?> targetDaysGoal;
  final Value<int> longestStreak;
  final Value<DateTime> createdAt;
  const DaysSinceCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.behaviorDescription = const Value.absent(),
    this.lastOccurrence = const Value.absent(),
    this.targetDaysGoal = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DaysSinceCompanion.insert({
    this.id = const Value.absent(),
    required int taskId,
    required String behaviorDescription,
    required DateTime lastOccurrence,
    this.targetDaysGoal = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : taskId = Value(taskId),
        behaviorDescription = Value(behaviorDescription),
        lastOccurrence = Value(lastOccurrence);
  static Insertable<DaysSinceData> custom({
    Expression<int>? id,
    Expression<int>? taskId,
    Expression<String>? behaviorDescription,
    Expression<DateTime>? lastOccurrence,
    Expression<int>? targetDaysGoal,
    Expression<int>? longestStreak,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (behaviorDescription != null)
        'behavior_description': behaviorDescription,
      if (lastOccurrence != null) 'last_occurrence': lastOccurrence,
      if (targetDaysGoal != null) 'target_days_goal': targetDaysGoal,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DaysSinceCompanion copyWith(
      {Value<int>? id,
      Value<int>? taskId,
      Value<String>? behaviorDescription,
      Value<DateTime>? lastOccurrence,
      Value<int?>? targetDaysGoal,
      Value<int>? longestStreak,
      Value<DateTime>? createdAt}) {
    return DaysSinceCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      behaviorDescription: behaviorDescription ?? this.behaviorDescription,
      lastOccurrence: lastOccurrence ?? this.lastOccurrence,
      targetDaysGoal: targetDaysGoal ?? this.targetDaysGoal,
      longestStreak: longestStreak ?? this.longestStreak,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (behaviorDescription.present) {
      map['behavior_description'] = Variable<String>(behaviorDescription.value);
    }
    if (lastOccurrence.present) {
      map['last_occurrence'] = Variable<DateTime>(lastOccurrence.value);
    }
    if (targetDaysGoal.present) {
      map['target_days_goal'] = Variable<int>(targetDaysGoal.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DaysSinceCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('behaviorDescription: $behaviorDescription, ')
          ..write('lastOccurrence: $lastOccurrence, ')
          ..write('targetDaysGoal: $targetDaysGoal, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TodoTasksTable todoTasks = $TodoTasksTable(this);
  late final $TaskTagsTable taskTags = $TaskTagsTable(this);
  late final $TodoTaskTagsTable todoTaskTags = $TodoTaskTagsTable(this);
  late final $RecurringPatternsTable recurringPatterns =
      $RecurringPatternsTable(this);
  late final $RecurringCompletionsTable recurringCompletions =
      $RecurringCompletionsTable(this);
  late final $TaskRemindersTable taskReminders = $TaskRemindersTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $MedicationInventoryLogTable medicationInventoryLog =
      $MedicationInventoryLogTable(this);
  late final $TaskTriggersTable taskTriggers = $TaskTriggersTable(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $BillsTable bills = $BillsTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $ChoresTable chores = $ChoresTable(this);
  late final $DaysSinceTable daysSince = $DaysSinceTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        todoTasks,
        taskTags,
        todoTaskTags,
        recurringPatterns,
        recurringCompletions,
        taskReminders,
        medications,
        medicationInventoryLog,
        taskTriggers,
        habits,
        bills,
        exercises,
        chores,
        daysSince
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('todo_task_tags', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('task_tags',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('todo_task_tags', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('task_reminders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('medications', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('medications',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('medication_inventory_log', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('task_triggers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('habits', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('bills', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('exercises', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('chores', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_tasks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('days_since', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
