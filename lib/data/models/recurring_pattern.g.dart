// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_pattern.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecurringPatternCollection on Isar {
  IsarCollection<RecurringPattern> get recurringPatterns => this.collection();
}

const RecurringPatternSchema = CollectionSchema(
  name: r'RecurringPattern',
  id: 4458529172076842483,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dayOfYear': PropertySchema(
      id: 1,
      name: r'dayOfYear',
      type: IsarType.long,
    ),
    r'daysOfMonth': PropertySchema(
      id: 2,
      name: r'daysOfMonth',
      type: IsarType.longList,
    ),
    r'daysOfWeek': PropertySchema(
      id: 3,
      name: r'daysOfWeek',
      type: IsarType.longList,
    ),
    r'endDate': PropertySchema(
      id: 4,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'interval': PropertySchema(
      id: 5,
      name: r'interval',
      type: IsarType.long,
    ),
    r'lastDayOfMonth': PropertySchema(
      id: 6,
      name: r'lastDayOfMonth',
      type: IsarType.bool,
    ),
    r'maxOccurrences': PropertySchema(
      id: 7,
      name: r'maxOccurrences',
      type: IsarType.long,
    ),
    r'monthOfYear': PropertySchema(
      id: 8,
      name: r'monthOfYear',
      type: IsarType.long,
    ),
    r'nthWeekday': PropertySchema(
      id: 9,
      name: r'nthWeekday',
      type: IsarType.long,
    ),
    r'skipWeekends': PropertySchema(
      id: 10,
      name: r'skipWeekends',
      type: IsarType.bool,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.string,
      enumMap: _RecurringPatterntypeEnumValueMap,
    ),
    r'weekdayOfMonth': PropertySchema(
      id: 12,
      name: r'weekdayOfMonth',
      type: IsarType.long,
    )
  },
  estimateSize: _recurringPatternEstimateSize,
  serialize: _recurringPatternSerialize,
  deserialize: _recurringPatternDeserialize,
  deserializeProp: _recurringPatternDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recurringPatternGetId,
  getLinks: _recurringPatternGetLinks,
  attach: _recurringPatternAttach,
  version: '3.1.0+1',
);

int _recurringPatternEstimateSize(
  RecurringPattern object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.daysOfMonth;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.daysOfWeek;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _recurringPatternSerialize(
  RecurringPattern object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.dayOfYear);
  writer.writeLongList(offsets[2], object.daysOfMonth);
  writer.writeLongList(offsets[3], object.daysOfWeek);
  writer.writeDateTime(offsets[4], object.endDate);
  writer.writeLong(offsets[5], object.interval);
  writer.writeBool(offsets[6], object.lastDayOfMonth);
  writer.writeLong(offsets[7], object.maxOccurrences);
  writer.writeLong(offsets[8], object.monthOfYear);
  writer.writeLong(offsets[9], object.nthWeekday);
  writer.writeBool(offsets[10], object.skipWeekends);
  writer.writeString(offsets[11], object.type.name);
  writer.writeLong(offsets[12], object.weekdayOfMonth);
}

RecurringPattern _recurringPatternDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecurringPattern();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.dayOfYear = reader.readLongOrNull(offsets[1]);
  object.daysOfMonth = reader.readLongList(offsets[2]);
  object.daysOfWeek = reader.readLongList(offsets[3]);
  object.endDate = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.interval = reader.readLong(offsets[5]);
  object.lastDayOfMonth = reader.readBoolOrNull(offsets[6]);
  object.maxOccurrences = reader.readLongOrNull(offsets[7]);
  object.monthOfYear = reader.readLongOrNull(offsets[8]);
  object.nthWeekday = reader.readLongOrNull(offsets[9]);
  object.skipWeekends = reader.readBool(offsets[10]);
  object.type =
      _RecurringPatterntypeValueEnumMap[reader.readStringOrNull(offsets[11])] ??
          RecurrenceType.daily;
  object.weekdayOfMonth = reader.readLongOrNull(offsets[12]);
  return object;
}

P _recurringPatternDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongList(offset)) as P;
    case 3:
      return (reader.readLongList(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (_RecurringPatterntypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          RecurrenceType.daily) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RecurringPatterntypeEnumValueMap = {
  r'daily': r'daily',
  r'weekly': r'weekly',
  r'monthly': r'monthly',
  r'yearly': r'yearly',
  r'custom': r'custom',
};
const _RecurringPatterntypeValueEnumMap = {
  r'daily': RecurrenceType.daily,
  r'weekly': RecurrenceType.weekly,
  r'monthly': RecurrenceType.monthly,
  r'yearly': RecurrenceType.yearly,
  r'custom': RecurrenceType.custom,
};

Id _recurringPatternGetId(RecurringPattern object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recurringPatternGetLinks(RecurringPattern object) {
  return [];
}

void _recurringPatternAttach(
    IsarCollection<dynamic> col, Id id, RecurringPattern object) {
  object.id = id;
}

extension RecurringPatternQueryWhereSort
    on QueryBuilder<RecurringPattern, RecurringPattern, QWhere> {
  QueryBuilder<RecurringPattern, RecurringPattern, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecurringPatternQueryWhere
    on QueryBuilder<RecurringPattern, RecurringPattern, QWhereClause> {
  QueryBuilder<RecurringPattern, RecurringPattern, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterWhereClause> idBetween(
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
}

extension RecurringPatternQueryFilter
    on QueryBuilder<RecurringPattern, RecurringPattern, QFilterCondition> {
  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      dayOfYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dayOfYear',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      dayOfYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dayOfYear',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      dayOfYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      dayOfYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      dayOfYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      dayOfYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'daysOfMonth',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'daysOfMonth',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfMonth',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfMonth',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfMonth',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfMonth',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfMonth',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfMonthLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfMonth',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'daysOfWeek',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'daysOfWeek',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      daysOfWeekLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      endDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      intervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      intervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      intervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      intervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      lastDayOfMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastDayOfMonth',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      lastDayOfMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastDayOfMonth',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      lastDayOfMonthEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastDayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      maxOccurrencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxOccurrences',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      maxOccurrencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxOccurrences',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      maxOccurrencesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxOccurrences',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      maxOccurrencesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxOccurrences',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      maxOccurrencesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxOccurrences',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      maxOccurrencesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxOccurrences',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      monthOfYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'monthOfYear',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      monthOfYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'monthOfYear',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      monthOfYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      monthOfYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      monthOfYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthOfYear',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      monthOfYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthOfYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      nthWeekdayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nthWeekday',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      nthWeekdayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nthWeekday',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      nthWeekdayEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nthWeekday',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      nthWeekdayGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nthWeekday',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      nthWeekdayLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nthWeekday',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      nthWeekdayBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nthWeekday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      skipWeekendsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skipWeekends',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeEqualTo(
    RecurrenceType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeGreaterThan(
    RecurrenceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeLessThan(
    RecurrenceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeBetween(
    RecurrenceType lower,
    RecurrenceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      weekdayOfMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weekdayOfMonth',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      weekdayOfMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weekdayOfMonth',
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      weekdayOfMonthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekdayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      weekdayOfMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekdayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      weekdayOfMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekdayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterFilterCondition>
      weekdayOfMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekdayOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecurringPatternQueryObject
    on QueryBuilder<RecurringPattern, RecurringPattern, QFilterCondition> {}

extension RecurringPatternQueryLinks
    on QueryBuilder<RecurringPattern, RecurringPattern, QFilterCondition> {}

extension RecurringPatternQuerySortBy
    on QueryBuilder<RecurringPattern, RecurringPattern, QSortBy> {
  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByDayOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfYear', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByDayOfYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfYear', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByLastDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByLastDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByMaxOccurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxOccurrences', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByMaxOccurrencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxOccurrences', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByMonthOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfYear', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByMonthOfYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfYear', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByNthWeekday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nthWeekday', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByNthWeekdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nthWeekday', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortBySkipWeekends() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipWeekends', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortBySkipWeekendsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipWeekends', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByWeekdayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekdayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      sortByWeekdayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekdayOfMonth', Sort.desc);
    });
  }
}

extension RecurringPatternQuerySortThenBy
    on QueryBuilder<RecurringPattern, RecurringPattern, QSortThenBy> {
  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByDayOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfYear', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByDayOfYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfYear', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByLastDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByLastDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByMaxOccurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxOccurrences', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByMaxOccurrencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxOccurrences', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByMonthOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfYear', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByMonthOfYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfYear', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByNthWeekday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nthWeekday', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByNthWeekdayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nthWeekday', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenBySkipWeekends() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipWeekends', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenBySkipWeekendsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skipWeekends', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByWeekdayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekdayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QAfterSortBy>
      thenByWeekdayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekdayOfMonth', Sort.desc);
    });
  }
}

extension RecurringPatternQueryWhereDistinct
    on QueryBuilder<RecurringPattern, RecurringPattern, QDistinct> {
  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByDayOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfYear');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByDaysOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysOfMonth');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByDaysOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysOfWeek');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interval');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByLastDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastDayOfMonth');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByMaxOccurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxOccurrences');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByMonthOfYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthOfYear');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByNthWeekday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nthWeekday');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctBySkipWeekends() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skipWeekends');
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringPattern, RecurringPattern, QDistinct>
      distinctByWeekdayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekdayOfMonth');
    });
  }
}

extension RecurringPatternQueryProperty
    on QueryBuilder<RecurringPattern, RecurringPattern, QQueryProperty> {
  QueryBuilder<RecurringPattern, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecurringPattern, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RecurringPattern, int?, QQueryOperations> dayOfYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfYear');
    });
  }

  QueryBuilder<RecurringPattern, List<int>?, QQueryOperations>
      daysOfMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysOfMonth');
    });
  }

  QueryBuilder<RecurringPattern, List<int>?, QQueryOperations>
      daysOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysOfWeek');
    });
  }

  QueryBuilder<RecurringPattern, DateTime?, QQueryOperations>
      endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<RecurringPattern, int, QQueryOperations> intervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interval');
    });
  }

  QueryBuilder<RecurringPattern, bool?, QQueryOperations>
      lastDayOfMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastDayOfMonth');
    });
  }

  QueryBuilder<RecurringPattern, int?, QQueryOperations>
      maxOccurrencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxOccurrences');
    });
  }

  QueryBuilder<RecurringPattern, int?, QQueryOperations> monthOfYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthOfYear');
    });
  }

  QueryBuilder<RecurringPattern, int?, QQueryOperations> nthWeekdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nthWeekday');
    });
  }

  QueryBuilder<RecurringPattern, bool, QQueryOperations>
      skipWeekendsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skipWeekends');
    });
  }

  QueryBuilder<RecurringPattern, RecurrenceType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<RecurringPattern, int?, QQueryOperations>
      weekdayOfMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekdayOfMonth');
    });
  }
}
