// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emotionLevel1Meta = const VerificationMeta(
    'emotionLevel1',
  );
  @override
  late final GeneratedColumn<String> emotionLevel1 = GeneratedColumn<String>(
    'emotion_level1',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionLevel2Meta = const VerificationMeta(
    'emotionLevel2',
  );
  @override
  late final GeneratedColumn<String> emotionLevel2 = GeneratedColumn<String>(
    'emotion_level2',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emotionLevel3Meta = const VerificationMeta(
    'emotionLevel3',
  );
  @override
  late final GeneratedColumn<String> emotionLevel3 = GeneratedColumn<String>(
    'emotion_level3',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entryMeta = const VerificationMeta('entry');
  @override
  late final GeneratedColumn<String> entry = GeneratedColumn<String>(
    'entry',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMapDrawingMeta = const VerificationMeta(
    'bodyMapDrawing',
  );
  @override
  late final GeneratedColumn<String> bodyMapDrawing = GeneratedColumn<String>(
    'body_map_drawing',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    emotionLevel1,
    emotionLevel2,
    emotionLevel3,
    entry,
    bodyMapDrawing,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('emotion_level1')) {
      context.handle(
        _emotionLevel1Meta,
        emotionLevel1.isAcceptableOrUnknown(
          data['emotion_level1']!,
          _emotionLevel1Meta,
        ),
      );
    }
    if (data.containsKey('emotion_level2')) {
      context.handle(
        _emotionLevel2Meta,
        emotionLevel2.isAcceptableOrUnknown(
          data['emotion_level2']!,
          _emotionLevel2Meta,
        ),
      );
    }
    if (data.containsKey('emotion_level3')) {
      context.handle(
        _emotionLevel3Meta,
        emotionLevel3.isAcceptableOrUnknown(
          data['emotion_level3']!,
          _emotionLevel3Meta,
        ),
      );
    }
    if (data.containsKey('entry')) {
      context.handle(
        _entryMeta,
        entry.isAcceptableOrUnknown(data['entry']!, _entryMeta),
      );
    } else if (isInserting) {
      context.missing(_entryMeta);
    }
    if (data.containsKey('body_map_drawing')) {
      context.handle(
        _bodyMapDrawingMeta,
        bodyMapDrawing.isAcceptableOrUnknown(
          data['body_map_drawing']!,
          _bodyMapDrawingMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      emotionLevel1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion_level1'],
      ),
      emotionLevel2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion_level2'],
      ),
      emotionLevel3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion_level3'],
      ),
      entry: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry'],
      )!,
      bodyMapDrawing: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_map_drawing'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }
}

class JournalEntry extends DataClass implements Insertable<JournalEntry> {
  final String id;
  final String? emotionLevel1;
  final String? emotionLevel2;
  final String? emotionLevel3;
  final String entry;
  final String? bodyMapDrawing;
  final DateTime createdAt;
  final DateTime updatedAt;
  const JournalEntry({
    required this.id,
    this.emotionLevel1,
    this.emotionLevel2,
    this.emotionLevel3,
    required this.entry,
    this.bodyMapDrawing,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || emotionLevel1 != null) {
      map['emotion_level1'] = Variable<String>(emotionLevel1);
    }
    if (!nullToAbsent || emotionLevel2 != null) {
      map['emotion_level2'] = Variable<String>(emotionLevel2);
    }
    if (!nullToAbsent || emotionLevel3 != null) {
      map['emotion_level3'] = Variable<String>(emotionLevel3);
    }
    map['entry'] = Variable<String>(entry);
    if (!nullToAbsent || bodyMapDrawing != null) {
      map['body_map_drawing'] = Variable<String>(bodyMapDrawing);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      emotionLevel1: emotionLevel1 == null && nullToAbsent
          ? const Value.absent()
          : Value(emotionLevel1),
      emotionLevel2: emotionLevel2 == null && nullToAbsent
          ? const Value.absent()
          : Value(emotionLevel2),
      emotionLevel3: emotionLevel3 == null && nullToAbsent
          ? const Value.absent()
          : Value(emotionLevel3),
      entry: Value(entry),
      bodyMapDrawing: bodyMapDrawing == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyMapDrawing),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory JournalEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntry(
      id: serializer.fromJson<String>(json['id']),
      emotionLevel1: serializer.fromJson<String?>(json['emotionLevel1']),
      emotionLevel2: serializer.fromJson<String?>(json['emotionLevel2']),
      emotionLevel3: serializer.fromJson<String?>(json['emotionLevel3']),
      entry: serializer.fromJson<String>(json['entry']),
      bodyMapDrawing: serializer.fromJson<String?>(json['bodyMapDrawing']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'emotionLevel1': serializer.toJson<String?>(emotionLevel1),
      'emotionLevel2': serializer.toJson<String?>(emotionLevel2),
      'emotionLevel3': serializer.toJson<String?>(emotionLevel3),
      'entry': serializer.toJson<String>(entry),
      'bodyMapDrawing': serializer.toJson<String?>(bodyMapDrawing),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  JournalEntry copyWith({
    String? id,
    Value<String?> emotionLevel1 = const Value.absent(),
    Value<String?> emotionLevel2 = const Value.absent(),
    Value<String?> emotionLevel3 = const Value.absent(),
    String? entry,
    Value<String?> bodyMapDrawing = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => JournalEntry(
    id: id ?? this.id,
    emotionLevel1: emotionLevel1.present
        ? emotionLevel1.value
        : this.emotionLevel1,
    emotionLevel2: emotionLevel2.present
        ? emotionLevel2.value
        : this.emotionLevel2,
    emotionLevel3: emotionLevel3.present
        ? emotionLevel3.value
        : this.emotionLevel3,
    entry: entry ?? this.entry,
    bodyMapDrawing: bodyMapDrawing.present
        ? bodyMapDrawing.value
        : this.bodyMapDrawing,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  JournalEntry copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntry(
      id: data.id.present ? data.id.value : this.id,
      emotionLevel1: data.emotionLevel1.present
          ? data.emotionLevel1.value
          : this.emotionLevel1,
      emotionLevel2: data.emotionLevel2.present
          ? data.emotionLevel2.value
          : this.emotionLevel2,
      emotionLevel3: data.emotionLevel3.present
          ? data.emotionLevel3.value
          : this.emotionLevel3,
      entry: data.entry.present ? data.entry.value : this.entry,
      bodyMapDrawing: data.bodyMapDrawing.present
          ? data.bodyMapDrawing.value
          : this.bodyMapDrawing,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntry(')
          ..write('id: $id, ')
          ..write('emotionLevel1: $emotionLevel1, ')
          ..write('emotionLevel2: $emotionLevel2, ')
          ..write('emotionLevel3: $emotionLevel3, ')
          ..write('entry: $entry, ')
          ..write('bodyMapDrawing: $bodyMapDrawing, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    emotionLevel1,
    emotionLevel2,
    emotionLevel3,
    entry,
    bodyMapDrawing,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntry &&
          other.id == this.id &&
          other.emotionLevel1 == this.emotionLevel1 &&
          other.emotionLevel2 == this.emotionLevel2 &&
          other.emotionLevel3 == this.emotionLevel3 &&
          other.entry == this.entry &&
          other.bodyMapDrawing == this.bodyMapDrawing &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntry> {
  final Value<String> id;
  final Value<String?> emotionLevel1;
  final Value<String?> emotionLevel2;
  final Value<String?> emotionLevel3;
  final Value<String> entry;
  final Value<String?> bodyMapDrawing;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.emotionLevel1 = const Value.absent(),
    this.emotionLevel2 = const Value.absent(),
    this.emotionLevel3 = const Value.absent(),
    this.entry = const Value.absent(),
    this.bodyMapDrawing = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    required String id,
    this.emotionLevel1 = const Value.absent(),
    this.emotionLevel2 = const Value.absent(),
    this.emotionLevel3 = const Value.absent(),
    required String entry,
    this.bodyMapDrawing = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entry = Value(entry),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<JournalEntry> custom({
    Expression<String>? id,
    Expression<String>? emotionLevel1,
    Expression<String>? emotionLevel2,
    Expression<String>? emotionLevel3,
    Expression<String>? entry,
    Expression<String>? bodyMapDrawing,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (emotionLevel1 != null) 'emotion_level1': emotionLevel1,
      if (emotionLevel2 != null) 'emotion_level2': emotionLevel2,
      if (emotionLevel3 != null) 'emotion_level3': emotionLevel3,
      if (entry != null) 'entry': entry,
      if (bodyMapDrawing != null) 'body_map_drawing': bodyMapDrawing,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalEntriesCompanion copyWith({
    Value<String>? id,
    Value<String?>? emotionLevel1,
    Value<String?>? emotionLevel2,
    Value<String?>? emotionLevel3,
    Value<String>? entry,
    Value<String?>? bodyMapDrawing,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      emotionLevel1: emotionLevel1 ?? this.emotionLevel1,
      emotionLevel2: emotionLevel2 ?? this.emotionLevel2,
      emotionLevel3: emotionLevel3 ?? this.emotionLevel3,
      entry: entry ?? this.entry,
      bodyMapDrawing: bodyMapDrawing ?? this.bodyMapDrawing,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (emotionLevel1.present) {
      map['emotion_level1'] = Variable<String>(emotionLevel1.value);
    }
    if (emotionLevel2.present) {
      map['emotion_level2'] = Variable<String>(emotionLevel2.value);
    }
    if (emotionLevel3.present) {
      map['emotion_level3'] = Variable<String>(emotionLevel3.value);
    }
    if (entry.present) {
      map['entry'] = Variable<String>(entry.value);
    }
    if (bodyMapDrawing.present) {
      map['body_map_drawing'] = Variable<String>(bodyMapDrawing.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('emotionLevel1: $emotionLevel1, ')
          ..write('emotionLevel2: $emotionLevel2, ')
          ..write('emotionLevel3: $emotionLevel3, ')
          ..write('entry: $entry, ')
          ..write('bodyMapDrawing: $bodyMapDrawing, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final JournalDao journalDao = JournalDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [journalEntries];
}

typedef $$JournalEntriesTableCreateCompanionBuilder =
    JournalEntriesCompanion Function({
      required String id,
      Value<String?> emotionLevel1,
      Value<String?> emotionLevel2,
      Value<String?> emotionLevel3,
      required String entry,
      Value<String?> bodyMapDrawing,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$JournalEntriesTableUpdateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<String> id,
      Value<String?> emotionLevel1,
      Value<String?> emotionLevel2,
      Value<String?> emotionLevel3,
      Value<String> entry,
      Value<String?> bodyMapDrawing,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotionLevel1 => $composableBuilder(
    column: $table.emotionLevel1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotionLevel2 => $composableBuilder(
    column: $table.emotionLevel2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotionLevel3 => $composableBuilder(
    column: $table.emotionLevel3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entry => $composableBuilder(
    column: $table.entry,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyMapDrawing => $composableBuilder(
    column: $table.bodyMapDrawing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotionLevel1 => $composableBuilder(
    column: $table.emotionLevel1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotionLevel2 => $composableBuilder(
    column: $table.emotionLevel2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotionLevel3 => $composableBuilder(
    column: $table.emotionLevel3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entry => $composableBuilder(
    column: $table.entry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyMapDrawing => $composableBuilder(
    column: $table.bodyMapDrawing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get emotionLevel1 => $composableBuilder(
    column: $table.emotionLevel1,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emotionLevel2 => $composableBuilder(
    column: $table.emotionLevel2,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emotionLevel3 => $composableBuilder(
    column: $table.emotionLevel3,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entry =>
      $composableBuilder(column: $table.entry, builder: (column) => column);

  GeneratedColumn<String> get bodyMapDrawing => $composableBuilder(
    column: $table.bodyMapDrawing,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$JournalEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalEntriesTable,
          JournalEntry,
          $$JournalEntriesTableFilterComposer,
          $$JournalEntriesTableOrderingComposer,
          $$JournalEntriesTableAnnotationComposer,
          $$JournalEntriesTableCreateCompanionBuilder,
          $$JournalEntriesTableUpdateCompanionBuilder,
          (
            JournalEntry,
            BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry>,
          ),
          JournalEntry,
          PrefetchHooks Function()
        > {
  $$JournalEntriesTableTableManager(
    _$AppDatabase db,
    $JournalEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> emotionLevel1 = const Value.absent(),
                Value<String?> emotionLevel2 = const Value.absent(),
                Value<String?> emotionLevel3 = const Value.absent(),
                Value<String> entry = const Value.absent(),
                Value<String?> bodyMapDrawing = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalEntriesCompanion(
                id: id,
                emotionLevel1: emotionLevel1,
                emotionLevel2: emotionLevel2,
                emotionLevel3: emotionLevel3,
                entry: entry,
                bodyMapDrawing: bodyMapDrawing,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> emotionLevel1 = const Value.absent(),
                Value<String?> emotionLevel2 = const Value.absent(),
                Value<String?> emotionLevel3 = const Value.absent(),
                required String entry,
                Value<String?> bodyMapDrawing = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => JournalEntriesCompanion.insert(
                id: id,
                emotionLevel1: emotionLevel1,
                emotionLevel2: emotionLevel2,
                emotionLevel3: emotionLevel3,
                entry: entry,
                bodyMapDrawing: bodyMapDrawing,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JournalEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalEntriesTable,
      JournalEntry,
      $$JournalEntriesTableFilterComposer,
      $$JournalEntriesTableOrderingComposer,
      $$JournalEntriesTableAnnotationComposer,
      $$JournalEntriesTableCreateCompanionBuilder,
      $$JournalEntriesTableUpdateCompanionBuilder,
      (
        JournalEntry,
        BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry>,
      ),
      JournalEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
}
