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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        title,
        description,
        importance,
        status,
        dueDate,
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
        isSkipped
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
  const TodoTask(
      {required this.id,
      required this.uuid,
      required this.title,
      this.description,
      required this.importance,
      required this.status,
      this.dueDate,
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
      required this.isSkipped});
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
          bool? isSkipped}) =>
      TodoTask(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        importance: importance ?? this.importance,
        status: status ?? this.status,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
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
          ..write('isSkipped: $isSkipped')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      uuid,
      title,
      description,
      importance,
      status,
      dueDate,
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
      isSkipped);
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
          other.isSkipped == this.isSkipped);
}

class TodoTasksCompanion extends UpdateCompanion<TodoTask> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> importance;
  final Value<String> status;
  final Value<DateTime?> dueDate;
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
  const TodoTasksCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.importance = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
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
  });
  TodoTasksCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String title,
    this.description = const Value.absent(),
    required String importance,
    required String status,
    this.dueDate = const Value.absent(),
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (importance != null) 'importance': importance,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
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
      Value<bool>? isSkipped}) {
    return TodoTasksCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      importance: importance ?? this.importance,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
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
          ..write('isSkipped: $isSkipped')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TodoTasksTable todoTasks = $TodoTasksTable(this);
  late final $TaskTagsTable taskTags = $TaskTagsTable(this);
  late final $TodoTaskTagsTable todoTaskTags = $TodoTaskTagsTable(this);
  late final $RecurringPatternsTable recurringPatterns =
      $RecurringPatternsTable(this);
  late final $RecurringCompletionsTable recurringCompletions =
      $RecurringCompletionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        todoTasks,
        taskTags,
        todoTaskTags,
        recurringPatterns,
        recurringCompletions
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
        ],
      );
}
