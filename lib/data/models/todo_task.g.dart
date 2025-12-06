// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTodoTaskCollection on Isar {
  IsarCollection<TodoTask> get todoTasks => this.collection();
}

const TodoTaskSchema = CollectionSchema(
  name: r'TodoTask',
  id: -2211278794031792915,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 3,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'importance': PropertySchema(
      id: 4,
      name: r'importance',
      type: IsarType.string,
      enumMap: _TodoTaskimportanceEnumValueMap,
    ),
    r'importanceValue': PropertySchema(
      id: 5,
      name: r'importanceValue',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isDueToday': PropertySchema(
      id: 7,
      name: r'isDueToday',
      type: IsarType.bool,
    ),
    r'isOverdue': PropertySchema(
      id: 8,
      name: r'isOverdue',
      type: IsarType.bool,
    ),
    r'isRecurring': PropertySchema(
      id: 9,
      name: r'isRecurring',
      type: IsarType.bool,
    ),
    r'isRecurringException': PropertySchema(
      id: 10,
      name: r'isRecurringException',
      type: IsarType.bool,
    ),
    r'isRecurringTemplate': PropertySchema(
      id: 11,
      name: r'isRecurringTemplate',
      type: IsarType.bool,
    ),
    r'isSkipped': PropertySchema(
      id: 12,
      name: r'isSkipped',
      type: IsarType.bool,
    ),
    r'recurringInstanceNumber': PropertySchema(
      id: 13,
      name: r'recurringInstanceNumber',
      type: IsarType.long,
    ),
    r'recurringOriginalDate': PropertySchema(
      id: 14,
      name: r'recurringOriginalDate',
      type: IsarType.dateTime,
    ),
    r'recurringPatternId': PropertySchema(
      id: 15,
      name: r'recurringPatternId',
      type: IsarType.long,
    ),
    r'recurringSeriesId': PropertySchema(
      id: 16,
      name: r'recurringSeriesId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 17,
      name: r'status',
      type: IsarType.string,
      enumMap: _TodoTaskstatusEnumValueMap,
    ),
    r'title': PropertySchema(
      id: 18,
      name: r'title',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 19,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _todoTaskEstimateSize,
  serialize: _todoTaskSerialize,
  deserialize: _todoTaskDeserialize,
  deserializeProp: _todoTaskDeserializeProp,
  idName: r'id',
  indexes: {
    r'isDueToday': IndexSchema(
      id: 3074890932532974302,
      name: r'isDueToday',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isDueToday',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isOverdue': IndexSchema(
      id: 2685914443102384158,
      name: r'isOverdue',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isOverdue',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isRecurringTemplate': IndexSchema(
      id: -5255466212457147889,
      name: r'isRecurringTemplate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isRecurringTemplate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'recurringSeriesId': IndexSchema(
      id: -3773964136021380482,
      name: r'recurringSeriesId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'recurringSeriesId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'tags': LinkSchema(
      id: 9157553563496918570,
      name: r'tags',
      target: r'TaskTag',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _todoTaskGetId,
  getLinks: _todoTaskGetLinks,
  attach: _todoTaskAttach,
  version: '3.1.0+1',
);

int _todoTaskEstimateSize(
  TodoTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.importance.name.length * 3;
  {
    final value = object.recurringSeriesId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _todoTaskSerialize(
  TodoTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeDateTime(offsets[3], object.dueDate);
  writer.writeString(offsets[4], object.importance.name);
  writer.writeLong(offsets[5], object.importanceValue);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeBool(offsets[7], object.isDueToday);
  writer.writeBool(offsets[8], object.isOverdue);
  writer.writeBool(offsets[9], object.isRecurring);
  writer.writeBool(offsets[10], object.isRecurringException);
  writer.writeBool(offsets[11], object.isRecurringTemplate);
  writer.writeBool(offsets[12], object.isSkipped);
  writer.writeLong(offsets[13], object.recurringInstanceNumber);
  writer.writeDateTime(offsets[14], object.recurringOriginalDate);
  writer.writeLong(offsets[15], object.recurringPatternId);
  writer.writeString(offsets[16], object.recurringSeriesId);
  writer.writeString(offsets[17], object.status.name);
  writer.writeString(offsets[18], object.title);
  writer.writeString(offsets[19], object.uuid);
}

TodoTask _todoTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TodoTask();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.dueDate = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.importance =
      _TodoTaskimportanceValueEnumMap[reader.readStringOrNull(offsets[4])] ??
          ImportanceLevel.low;
  object.isCompleted = reader.readBool(offsets[6]);
  object.isDueToday = reader.readBool(offsets[7]);
  object.isOverdue = reader.readBool(offsets[8]);
  object.isRecurring = reader.readBool(offsets[9]);
  object.isRecurringException = reader.readBool(offsets[10]);
  object.isRecurringTemplate = reader.readBool(offsets[11]);
  object.isSkipped = reader.readBool(offsets[12]);
  object.recurringInstanceNumber = reader.readLongOrNull(offsets[13]);
  object.recurringOriginalDate = reader.readDateTimeOrNull(offsets[14]);
  object.recurringPatternId = reader.readLongOrNull(offsets[15]);
  object.recurringSeriesId = reader.readStringOrNull(offsets[16]);
  object.status =
      _TodoTaskstatusValueEnumMap[reader.readStringOrNull(offsets[17])] ??
          TaskStatus.notStarted;
  object.title = reader.readString(offsets[18]);
  object.uuid = reader.readString(offsets[19]);
  return object;
}

P _todoTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (_TodoTaskimportanceValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ImportanceLevel.low) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (_TodoTaskstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          TaskStatus.notStarted) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TodoTaskimportanceEnumValueMap = {
  r'low': r'low',
  r'medium': r'medium',
  r'high': r'high',
  r'critical': r'critical',
};
const _TodoTaskimportanceValueEnumMap = {
  r'low': ImportanceLevel.low,
  r'medium': ImportanceLevel.medium,
  r'high': ImportanceLevel.high,
  r'critical': ImportanceLevel.critical,
};
const _TodoTaskstatusEnumValueMap = {
  r'notStarted': r'notStarted',
  r'inProgress': r'inProgress',
  r'onHold': r'onHold',
  r'completed': r'completed',
};
const _TodoTaskstatusValueEnumMap = {
  r'notStarted': TaskStatus.notStarted,
  r'inProgress': TaskStatus.inProgress,
  r'onHold': TaskStatus.onHold,
  r'completed': TaskStatus.completed,
};

Id _todoTaskGetId(TodoTask object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _todoTaskGetLinks(TodoTask object) {
  return [object.tags];
}

void _todoTaskAttach(IsarCollection<dynamic> col, Id id, TodoTask object) {
  object.id = id;
  object.tags.attach(col, col.isar.collection<TaskTag>(), r'tags', id);
}

extension TodoTaskQueryWhereSort on QueryBuilder<TodoTask, TodoTask, QWhere> {
  QueryBuilder<TodoTask, TodoTask, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhere> anyIsDueToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isDueToday'),
      );
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhere> anyIsOverdue() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isOverdue'),
      );
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhere> anyIsRecurringTemplate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isRecurringTemplate'),
      );
    });
  }
}

extension TodoTaskQueryWhere on QueryBuilder<TodoTask, TodoTask, QWhereClause> {
  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> isDueTodayEqualTo(
      bool isDueToday) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isDueToday',
        value: [isDueToday],
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> isDueTodayNotEqualTo(
      bool isDueToday) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isDueToday',
              lower: [],
              upper: [isDueToday],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isDueToday',
              lower: [isDueToday],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isDueToday',
              lower: [isDueToday],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isDueToday',
              lower: [],
              upper: [isDueToday],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> isOverdueEqualTo(
      bool isOverdue) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isOverdue',
        value: [isOverdue],
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> isOverdueNotEqualTo(
      bool isOverdue) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isOverdue',
              lower: [],
              upper: [isOverdue],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isOverdue',
              lower: [isOverdue],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isOverdue',
              lower: [isOverdue],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isOverdue',
              lower: [],
              upper: [isOverdue],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause>
      isRecurringTemplateEqualTo(bool isRecurringTemplate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isRecurringTemplate',
        value: [isRecurringTemplate],
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause>
      isRecurringTemplateNotEqualTo(bool isRecurringTemplate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isRecurringTemplate',
              lower: [],
              upper: [isRecurringTemplate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isRecurringTemplate',
              lower: [isRecurringTemplate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isRecurringTemplate',
              lower: [isRecurringTemplate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isRecurringTemplate',
              lower: [],
              upper: [isRecurringTemplate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause>
      recurringSeriesIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recurringSeriesId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause>
      recurringSeriesIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recurringSeriesId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause> recurringSeriesIdEqualTo(
      String? recurringSeriesId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recurringSeriesId',
        value: [recurringSeriesId],
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterWhereClause>
      recurringSeriesIdNotEqualTo(String? recurringSeriesId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurringSeriesId',
              lower: [],
              upper: [recurringSeriesId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurringSeriesId',
              lower: [recurringSeriesId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurringSeriesId',
              lower: [recurringSeriesId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recurringSeriesId',
              lower: [],
              upper: [recurringSeriesId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TodoTaskQueryFilter
    on QueryBuilder<TodoTask, TodoTask, QFilterCondition> {
  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> completedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> dueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> dueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> dueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceEqualTo(
    ImportanceLevel value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceGreaterThan(
    ImportanceLevel value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceLessThan(
    ImportanceLevel value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceBetween(
    ImportanceLevel lower,
    ImportanceLevel upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'importance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'importance',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> importanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importance',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      importanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'importance',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      importanceValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importanceValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      importanceValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'importanceValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      importanceValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'importanceValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      importanceValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'importanceValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> isCompletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> isDueTodayEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDueToday',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> isOverdueEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOverdue',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> isRecurringEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRecurring',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      isRecurringExceptionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRecurringException',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      isRecurringTemplateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRecurringTemplate',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> isSkippedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSkipped',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringInstanceNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurringInstanceNumber',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringInstanceNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurringInstanceNumber',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringInstanceNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurringInstanceNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringInstanceNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurringInstanceNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringInstanceNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurringInstanceNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringInstanceNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurringInstanceNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringOriginalDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurringOriginalDate',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringOriginalDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurringOriginalDate',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringOriginalDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurringOriginalDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringOriginalDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurringOriginalDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringOriginalDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurringOriginalDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringOriginalDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurringOriginalDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringPatternIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurringPatternId',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringPatternIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurringPatternId',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringPatternIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurringPatternId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringPatternIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurringPatternId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringPatternIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurringPatternId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringPatternIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurringPatternId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurringSeriesId',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurringSeriesId',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurringSeriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurringSeriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurringSeriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurringSeriesId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recurringSeriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recurringSeriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recurringSeriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recurringSeriesId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurringSeriesId',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition>
      recurringSeriesIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recurringSeriesId',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusEqualTo(
    TaskStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusGreaterThan(
    TaskStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusLessThan(
    TaskStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusBetween(
    TaskStatus lower,
    TaskStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension TodoTaskQueryObject
    on QueryBuilder<TodoTask, TodoTask, QFilterCondition> {}

extension TodoTaskQueryLinks
    on QueryBuilder<TodoTask, TodoTask, QFilterCondition> {
  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> tags(
      FilterQuery<TaskTag> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tags');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tags', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TodoTaskQuerySortBy on QueryBuilder<TodoTask, TodoTask, QSortBy> {
  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByImportanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByImportanceValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importanceValue', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByImportanceValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importanceValue', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsDueToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDueToday', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsDueTodayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDueToday', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsOverdue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOverdue', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsOverdueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOverdue', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsRecurringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsRecurringException() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurringException', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      sortByIsRecurringExceptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurringException', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsRecurringTemplate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurringTemplate', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      sortByIsRecurringTemplateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurringTemplate', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsSkipped() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSkipped', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByIsSkippedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSkipped', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      sortByRecurringInstanceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringInstanceNumber', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      sortByRecurringInstanceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringInstanceNumber', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByRecurringOriginalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringOriginalDate', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      sortByRecurringOriginalDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringOriginalDate', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByRecurringPatternId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringPatternId', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      sortByRecurringPatternIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringPatternId', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByRecurringSeriesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringSeriesId', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByRecurringSeriesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringSeriesId', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension TodoTaskQuerySortThenBy
    on QueryBuilder<TodoTask, TodoTask, QSortThenBy> {
  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByImportanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByImportanceValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importanceValue', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByImportanceValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importanceValue', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsDueToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDueToday', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsDueTodayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDueToday', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsOverdue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOverdue', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsOverdueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOverdue', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsRecurringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurring', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsRecurringException() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurringException', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      thenByIsRecurringExceptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurringException', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsRecurringTemplate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurringTemplate', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      thenByIsRecurringTemplateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRecurringTemplate', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsSkipped() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSkipped', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByIsSkippedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSkipped', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      thenByRecurringInstanceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringInstanceNumber', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      thenByRecurringInstanceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringInstanceNumber', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByRecurringOriginalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringOriginalDate', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      thenByRecurringOriginalDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringOriginalDate', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByRecurringPatternId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringPatternId', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy>
      thenByRecurringPatternIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringPatternId', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByRecurringSeriesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringSeriesId', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByRecurringSeriesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringSeriesId', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension TodoTaskQueryWhereDistinct
    on QueryBuilder<TodoTask, TodoTask, QDistinct> {
  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByImportance(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importance', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByImportanceValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importanceValue');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByIsDueToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDueToday');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByIsOverdue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOverdue');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByIsRecurring() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRecurring');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByIsRecurringException() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRecurringException');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByIsRecurringTemplate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRecurringTemplate');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByIsSkipped() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSkipped');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct>
      distinctByRecurringInstanceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurringInstanceNumber');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct>
      distinctByRecurringOriginalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurringOriginalDate');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByRecurringPatternId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurringPatternId');
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByRecurringSeriesId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurringSeriesId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoTask, TodoTask, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension TodoTaskQueryProperty
    on QueryBuilder<TodoTask, TodoTask, QQueryProperty> {
  QueryBuilder<TodoTask, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TodoTask, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<TodoTask, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TodoTask, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TodoTask, DateTime?, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<TodoTask, ImportanceLevel, QQueryOperations>
      importanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importance');
    });
  }

  QueryBuilder<TodoTask, int, QQueryOperations> importanceValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importanceValue');
    });
  }

  QueryBuilder<TodoTask, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<TodoTask, bool, QQueryOperations> isDueTodayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDueToday');
    });
  }

  QueryBuilder<TodoTask, bool, QQueryOperations> isOverdueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOverdue');
    });
  }

  QueryBuilder<TodoTask, bool, QQueryOperations> isRecurringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRecurring');
    });
  }

  QueryBuilder<TodoTask, bool, QQueryOperations>
      isRecurringExceptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRecurringException');
    });
  }

  QueryBuilder<TodoTask, bool, QQueryOperations> isRecurringTemplateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRecurringTemplate');
    });
  }

  QueryBuilder<TodoTask, bool, QQueryOperations> isSkippedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSkipped');
    });
  }

  QueryBuilder<TodoTask, int?, QQueryOperations>
      recurringInstanceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurringInstanceNumber');
    });
  }

  QueryBuilder<TodoTask, DateTime?, QQueryOperations>
      recurringOriginalDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurringOriginalDate');
    });
  }

  QueryBuilder<TodoTask, int?, QQueryOperations> recurringPatternIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurringPatternId');
    });
  }

  QueryBuilder<TodoTask, String?, QQueryOperations>
      recurringSeriesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurringSeriesId');
    });
  }

  QueryBuilder<TodoTask, TaskStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TodoTask, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<TodoTask, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
