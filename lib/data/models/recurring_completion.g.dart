// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_completion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecurringCompletionCollection on Isar {
  IsarCollection<RecurringCompletion> get recurringCompletions =>
      this.collection();
}

const RecurringCompletionSchema = CollectionSchema(
  name: r'RecurringCompletion',
  id: -6326149366173468108,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'completedBy': PropertySchema(
      id: 1,
      name: r'completedBy',
      type: IsarType.string,
    ),
    r'instanceNumber': PropertySchema(
      id: 2,
      name: r'instanceNumber',
      type: IsarType.long,
    ),
    r'note': PropertySchema(
      id: 3,
      name: r'note',
      type: IsarType.string,
    ),
    r'recurringSeriesId': PropertySchema(
      id: 4,
      name: r'recurringSeriesId',
      type: IsarType.string,
    ),
    r'scheduledDate': PropertySchema(
      id: 5,
      name: r'scheduledDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _recurringCompletionEstimateSize,
  serialize: _recurringCompletionSerialize,
  deserialize: _recurringCompletionDeserialize,
  deserializeProp: _recurringCompletionDeserializeProp,
  idName: r'id',
  indexes: {
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
  links: {},
  embeddedSchemas: {},
  getId: _recurringCompletionGetId,
  getLinks: _recurringCompletionGetLinks,
  attach: _recurringCompletionAttach,
  version: '3.1.0+1',
);

int _recurringCompletionEstimateSize(
  RecurringCompletion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.completedBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.recurringSeriesId.length * 3;
  return bytesCount;
}

void _recurringCompletionSerialize(
  RecurringCompletion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeString(offsets[1], object.completedBy);
  writer.writeLong(offsets[2], object.instanceNumber);
  writer.writeString(offsets[3], object.note);
  writer.writeString(offsets[4], object.recurringSeriesId);
  writer.writeDateTime(offsets[5], object.scheduledDate);
}

RecurringCompletion _recurringCompletionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecurringCompletion();
  object.completedAt = reader.readDateTime(offsets[0]);
  object.completedBy = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.instanceNumber = reader.readLong(offsets[2]);
  object.note = reader.readStringOrNull(offsets[3]);
  object.recurringSeriesId = reader.readString(offsets[4]);
  object.scheduledDate = reader.readDateTime(offsets[5]);
  return object;
}

P _recurringCompletionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recurringCompletionGetId(RecurringCompletion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recurringCompletionGetLinks(
    RecurringCompletion object) {
  return [];
}

void _recurringCompletionAttach(
    IsarCollection<dynamic> col, Id id, RecurringCompletion object) {
  object.id = id;
}

extension RecurringCompletionQueryWhereSort
    on QueryBuilder<RecurringCompletion, RecurringCompletion, QWhere> {
  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecurringCompletionQueryWhere
    on QueryBuilder<RecurringCompletion, RecurringCompletion, QWhereClause> {
  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterWhereClause>
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterWhereClause>
      recurringSeriesIdEqualTo(String recurringSeriesId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recurringSeriesId',
        value: [recurringSeriesId],
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterWhereClause>
      recurringSeriesIdNotEqualTo(String recurringSeriesId) {
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

extension RecurringCompletionQueryFilter on QueryBuilder<RecurringCompletion,
    RecurringCompletion, QFilterCondition> {
  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedAtLessThan(
    DateTime value, {
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedBy',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedBy',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'completedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'completedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'completedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'completedBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      completedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'completedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      instanceNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instanceNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      instanceNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instanceNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      instanceNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instanceNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      instanceNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instanceNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      recurringSeriesIdEqualTo(
    String value, {
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      recurringSeriesIdGreaterThan(
    String value, {
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      recurringSeriesIdLessThan(
    String value, {
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      recurringSeriesIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
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

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      recurringSeriesIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recurringSeriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      recurringSeriesIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recurringSeriesId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      recurringSeriesIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurringSeriesId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      recurringSeriesIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recurringSeriesId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      scheduledDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      scheduledDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      scheduledDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterFilterCondition>
      scheduledDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecurringCompletionQueryObject on QueryBuilder<RecurringCompletion,
    RecurringCompletion, QFilterCondition> {}

extension RecurringCompletionQueryLinks on QueryBuilder<RecurringCompletion,
    RecurringCompletion, QFilterCondition> {}

extension RecurringCompletionQuerySortBy
    on QueryBuilder<RecurringCompletion, RecurringCompletion, QSortBy> {
  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByCompletedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedBy', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByCompletedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedBy', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByInstanceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceNumber', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByInstanceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceNumber', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByRecurringSeriesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringSeriesId', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByRecurringSeriesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringSeriesId', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByScheduledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDate', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      sortByScheduledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDate', Sort.desc);
    });
  }
}

extension RecurringCompletionQuerySortThenBy
    on QueryBuilder<RecurringCompletion, RecurringCompletion, QSortThenBy> {
  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByCompletedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedBy', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByCompletedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedBy', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByInstanceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceNumber', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByInstanceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceNumber', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByRecurringSeriesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringSeriesId', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByRecurringSeriesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurringSeriesId', Sort.desc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByScheduledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDate', Sort.asc);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QAfterSortBy>
      thenByScheduledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDate', Sort.desc);
    });
  }
}

extension RecurringCompletionQueryWhereDistinct
    on QueryBuilder<RecurringCompletion, RecurringCompletion, QDistinct> {
  QueryBuilder<RecurringCompletion, RecurringCompletion, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QDistinct>
      distinctByCompletedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QDistinct>
      distinctByInstanceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instanceNumber');
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QDistinct>
      distinctByRecurringSeriesId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurringSeriesId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecurringCompletion, RecurringCompletion, QDistinct>
      distinctByScheduledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledDate');
    });
  }
}

extension RecurringCompletionQueryProperty
    on QueryBuilder<RecurringCompletion, RecurringCompletion, QQueryProperty> {
  QueryBuilder<RecurringCompletion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecurringCompletion, DateTime, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<RecurringCompletion, String?, QQueryOperations>
      completedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedBy');
    });
  }

  QueryBuilder<RecurringCompletion, int, QQueryOperations>
      instanceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instanceNumber');
    });
  }

  QueryBuilder<RecurringCompletion, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<RecurringCompletion, String, QQueryOperations>
      recurringSeriesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurringSeriesId');
    });
  }

  QueryBuilder<RecurringCompletion, DateTime, QQueryOperations>
      scheduledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledDate');
    });
  }
}
