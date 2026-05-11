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

class $JournalReflectionsTable extends JournalReflections
    with TableInfo<$JournalReflectionsTable, JournalReflection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalReflectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guessedEmotionLevel1Meta =
      const VerificationMeta('guessedEmotionLevel1');
  @override
  late final GeneratedColumn<String> guessedEmotionLevel1 =
      GeneratedColumn<String>(
        'guessed_emotion_level1',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _guessedEmotionLevel2Meta =
      const VerificationMeta('guessedEmotionLevel2');
  @override
  late final GeneratedColumn<String> guessedEmotionLevel2 =
      GeneratedColumn<String>(
        'guessed_emotion_level2',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _guessedEmotionLevel3Meta =
      const VerificationMeta('guessedEmotionLevel3');
  @override
  late final GeneratedColumn<String> guessedEmotionLevel3 =
      GeneratedColumn<String>(
        'guessed_emotion_level3',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _currentEmotionLevel1Meta =
      const VerificationMeta('currentEmotionLevel1');
  @override
  late final GeneratedColumn<String> currentEmotionLevel1 =
      GeneratedColumn<String>(
        'current_emotion_level1',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _currentEmotionLevel2Meta =
      const VerificationMeta('currentEmotionLevel2');
  @override
  late final GeneratedColumn<String> currentEmotionLevel2 =
      GeneratedColumn<String>(
        'current_emotion_level2',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _currentEmotionLevel3Meta =
      const VerificationMeta('currentEmotionLevel3');
  @override
  late final GeneratedColumn<String> currentEmotionLevel3 =
      GeneratedColumn<String>(
        'current_emotion_level3',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _reflectionMeta = const VerificationMeta(
    'reflection',
  );
  @override
  late final GeneratedColumn<String> reflection = GeneratedColumn<String>(
    'reflection',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _journalEntryIdMeta = const VerificationMeta(
    'journalEntryId',
  );
  @override
  late final GeneratedColumn<String> journalEntryId = GeneratedColumn<String>(
    'journal_entry_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES journal_entries(id) NOT NULL',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    guessedEmotionLevel1,
    guessedEmotionLevel2,
    guessedEmotionLevel3,
    currentEmotionLevel1,
    currentEmotionLevel2,
    currentEmotionLevel3,
    reflection,
    journalEntryId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_reflections';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalReflection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('guessed_emotion_level1')) {
      context.handle(
        _guessedEmotionLevel1Meta,
        guessedEmotionLevel1.isAcceptableOrUnknown(
          data['guessed_emotion_level1']!,
          _guessedEmotionLevel1Meta,
        ),
      );
    }
    if (data.containsKey('guessed_emotion_level2')) {
      context.handle(
        _guessedEmotionLevel2Meta,
        guessedEmotionLevel2.isAcceptableOrUnknown(
          data['guessed_emotion_level2']!,
          _guessedEmotionLevel2Meta,
        ),
      );
    }
    if (data.containsKey('guessed_emotion_level3')) {
      context.handle(
        _guessedEmotionLevel3Meta,
        guessedEmotionLevel3.isAcceptableOrUnknown(
          data['guessed_emotion_level3']!,
          _guessedEmotionLevel3Meta,
        ),
      );
    }
    if (data.containsKey('current_emotion_level1')) {
      context.handle(
        _currentEmotionLevel1Meta,
        currentEmotionLevel1.isAcceptableOrUnknown(
          data['current_emotion_level1']!,
          _currentEmotionLevel1Meta,
        ),
      );
    }
    if (data.containsKey('current_emotion_level2')) {
      context.handle(
        _currentEmotionLevel2Meta,
        currentEmotionLevel2.isAcceptableOrUnknown(
          data['current_emotion_level2']!,
          _currentEmotionLevel2Meta,
        ),
      );
    }
    if (data.containsKey('current_emotion_level3')) {
      context.handle(
        _currentEmotionLevel3Meta,
        currentEmotionLevel3.isAcceptableOrUnknown(
          data['current_emotion_level3']!,
          _currentEmotionLevel3Meta,
        ),
      );
    }
    if (data.containsKey('reflection')) {
      context.handle(
        _reflectionMeta,
        reflection.isAcceptableOrUnknown(data['reflection']!, _reflectionMeta),
      );
    } else if (isInserting) {
      context.missing(_reflectionMeta);
    }
    if (data.containsKey('journal_entry_id')) {
      context.handle(
        _journalEntryIdMeta,
        journalEntryId.isAcceptableOrUnknown(
          data['journal_entry_id']!,
          _journalEntryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_journalEntryIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalReflection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalReflection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      guessedEmotionLevel1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guessed_emotion_level1'],
      ),
      guessedEmotionLevel2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guessed_emotion_level2'],
      ),
      guessedEmotionLevel3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guessed_emotion_level3'],
      ),
      currentEmotionLevel1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_emotion_level1'],
      ),
      currentEmotionLevel2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_emotion_level2'],
      ),
      currentEmotionLevel3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_emotion_level3'],
      ),
      reflection: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reflection'],
      )!,
      journalEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}journal_entry_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $JournalReflectionsTable createAlias(String alias) {
    return $JournalReflectionsTable(attachedDatabase, alias);
  }
}

class JournalReflection extends DataClass
    implements Insertable<JournalReflection> {
  final String id;
  final String? guessedEmotionLevel1;
  final String? guessedEmotionLevel2;
  final String? guessedEmotionLevel3;
  final String? currentEmotionLevel1;
  final String? currentEmotionLevel2;
  final String? currentEmotionLevel3;
  final String reflection;
  final String journalEntryId;
  final DateTime createdAt;
  const JournalReflection({
    required this.id,
    this.guessedEmotionLevel1,
    this.guessedEmotionLevel2,
    this.guessedEmotionLevel3,
    this.currentEmotionLevel1,
    this.currentEmotionLevel2,
    this.currentEmotionLevel3,
    required this.reflection,
    required this.journalEntryId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || guessedEmotionLevel1 != null) {
      map['guessed_emotion_level1'] = Variable<String>(guessedEmotionLevel1);
    }
    if (!nullToAbsent || guessedEmotionLevel2 != null) {
      map['guessed_emotion_level2'] = Variable<String>(guessedEmotionLevel2);
    }
    if (!nullToAbsent || guessedEmotionLevel3 != null) {
      map['guessed_emotion_level3'] = Variable<String>(guessedEmotionLevel3);
    }
    if (!nullToAbsent || currentEmotionLevel1 != null) {
      map['current_emotion_level1'] = Variable<String>(currentEmotionLevel1);
    }
    if (!nullToAbsent || currentEmotionLevel2 != null) {
      map['current_emotion_level2'] = Variable<String>(currentEmotionLevel2);
    }
    if (!nullToAbsent || currentEmotionLevel3 != null) {
      map['current_emotion_level3'] = Variable<String>(currentEmotionLevel3);
    }
    map['reflection'] = Variable<String>(reflection);
    map['journal_entry_id'] = Variable<String>(journalEntryId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  JournalReflectionsCompanion toCompanion(bool nullToAbsent) {
    return JournalReflectionsCompanion(
      id: Value(id),
      guessedEmotionLevel1: guessedEmotionLevel1 == null && nullToAbsent
          ? const Value.absent()
          : Value(guessedEmotionLevel1),
      guessedEmotionLevel2: guessedEmotionLevel2 == null && nullToAbsent
          ? const Value.absent()
          : Value(guessedEmotionLevel2),
      guessedEmotionLevel3: guessedEmotionLevel3 == null && nullToAbsent
          ? const Value.absent()
          : Value(guessedEmotionLevel3),
      currentEmotionLevel1: currentEmotionLevel1 == null && nullToAbsent
          ? const Value.absent()
          : Value(currentEmotionLevel1),
      currentEmotionLevel2: currentEmotionLevel2 == null && nullToAbsent
          ? const Value.absent()
          : Value(currentEmotionLevel2),
      currentEmotionLevel3: currentEmotionLevel3 == null && nullToAbsent
          ? const Value.absent()
          : Value(currentEmotionLevel3),
      reflection: Value(reflection),
      journalEntryId: Value(journalEntryId),
      createdAt: Value(createdAt),
    );
  }

  factory JournalReflection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalReflection(
      id: serializer.fromJson<String>(json['id']),
      guessedEmotionLevel1: serializer.fromJson<String?>(
        json['guessedEmotionLevel1'],
      ),
      guessedEmotionLevel2: serializer.fromJson<String?>(
        json['guessedEmotionLevel2'],
      ),
      guessedEmotionLevel3: serializer.fromJson<String?>(
        json['guessedEmotionLevel3'],
      ),
      currentEmotionLevel1: serializer.fromJson<String?>(
        json['currentEmotionLevel1'],
      ),
      currentEmotionLevel2: serializer.fromJson<String?>(
        json['currentEmotionLevel2'],
      ),
      currentEmotionLevel3: serializer.fromJson<String?>(
        json['currentEmotionLevel3'],
      ),
      reflection: serializer.fromJson<String>(json['reflection']),
      journalEntryId: serializer.fromJson<String>(json['journalEntryId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'guessedEmotionLevel1': serializer.toJson<String?>(guessedEmotionLevel1),
      'guessedEmotionLevel2': serializer.toJson<String?>(guessedEmotionLevel2),
      'guessedEmotionLevel3': serializer.toJson<String?>(guessedEmotionLevel3),
      'currentEmotionLevel1': serializer.toJson<String?>(currentEmotionLevel1),
      'currentEmotionLevel2': serializer.toJson<String?>(currentEmotionLevel2),
      'currentEmotionLevel3': serializer.toJson<String?>(currentEmotionLevel3),
      'reflection': serializer.toJson<String>(reflection),
      'journalEntryId': serializer.toJson<String>(journalEntryId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  JournalReflection copyWith({
    String? id,
    Value<String?> guessedEmotionLevel1 = const Value.absent(),
    Value<String?> guessedEmotionLevel2 = const Value.absent(),
    Value<String?> guessedEmotionLevel3 = const Value.absent(),
    Value<String?> currentEmotionLevel1 = const Value.absent(),
    Value<String?> currentEmotionLevel2 = const Value.absent(),
    Value<String?> currentEmotionLevel3 = const Value.absent(),
    String? reflection,
    String? journalEntryId,
    DateTime? createdAt,
  }) => JournalReflection(
    id: id ?? this.id,
    guessedEmotionLevel1: guessedEmotionLevel1.present
        ? guessedEmotionLevel1.value
        : this.guessedEmotionLevel1,
    guessedEmotionLevel2: guessedEmotionLevel2.present
        ? guessedEmotionLevel2.value
        : this.guessedEmotionLevel2,
    guessedEmotionLevel3: guessedEmotionLevel3.present
        ? guessedEmotionLevel3.value
        : this.guessedEmotionLevel3,
    currentEmotionLevel1: currentEmotionLevel1.present
        ? currentEmotionLevel1.value
        : this.currentEmotionLevel1,
    currentEmotionLevel2: currentEmotionLevel2.present
        ? currentEmotionLevel2.value
        : this.currentEmotionLevel2,
    currentEmotionLevel3: currentEmotionLevel3.present
        ? currentEmotionLevel3.value
        : this.currentEmotionLevel3,
    reflection: reflection ?? this.reflection,
    journalEntryId: journalEntryId ?? this.journalEntryId,
    createdAt: createdAt ?? this.createdAt,
  );
  JournalReflection copyWithCompanion(JournalReflectionsCompanion data) {
    return JournalReflection(
      id: data.id.present ? data.id.value : this.id,
      guessedEmotionLevel1: data.guessedEmotionLevel1.present
          ? data.guessedEmotionLevel1.value
          : this.guessedEmotionLevel1,
      guessedEmotionLevel2: data.guessedEmotionLevel2.present
          ? data.guessedEmotionLevel2.value
          : this.guessedEmotionLevel2,
      guessedEmotionLevel3: data.guessedEmotionLevel3.present
          ? data.guessedEmotionLevel3.value
          : this.guessedEmotionLevel3,
      currentEmotionLevel1: data.currentEmotionLevel1.present
          ? data.currentEmotionLevel1.value
          : this.currentEmotionLevel1,
      currentEmotionLevel2: data.currentEmotionLevel2.present
          ? data.currentEmotionLevel2.value
          : this.currentEmotionLevel2,
      currentEmotionLevel3: data.currentEmotionLevel3.present
          ? data.currentEmotionLevel3.value
          : this.currentEmotionLevel3,
      reflection: data.reflection.present
          ? data.reflection.value
          : this.reflection,
      journalEntryId: data.journalEntryId.present
          ? data.journalEntryId.value
          : this.journalEntryId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalReflection(')
          ..write('id: $id, ')
          ..write('guessedEmotionLevel1: $guessedEmotionLevel1, ')
          ..write('guessedEmotionLevel2: $guessedEmotionLevel2, ')
          ..write('guessedEmotionLevel3: $guessedEmotionLevel3, ')
          ..write('currentEmotionLevel1: $currentEmotionLevel1, ')
          ..write('currentEmotionLevel2: $currentEmotionLevel2, ')
          ..write('currentEmotionLevel3: $currentEmotionLevel3, ')
          ..write('reflection: $reflection, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    guessedEmotionLevel1,
    guessedEmotionLevel2,
    guessedEmotionLevel3,
    currentEmotionLevel1,
    currentEmotionLevel2,
    currentEmotionLevel3,
    reflection,
    journalEntryId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalReflection &&
          other.id == this.id &&
          other.guessedEmotionLevel1 == this.guessedEmotionLevel1 &&
          other.guessedEmotionLevel2 == this.guessedEmotionLevel2 &&
          other.guessedEmotionLevel3 == this.guessedEmotionLevel3 &&
          other.currentEmotionLevel1 == this.currentEmotionLevel1 &&
          other.currentEmotionLevel2 == this.currentEmotionLevel2 &&
          other.currentEmotionLevel3 == this.currentEmotionLevel3 &&
          other.reflection == this.reflection &&
          other.journalEntryId == this.journalEntryId &&
          other.createdAt == this.createdAt);
}

class JournalReflectionsCompanion extends UpdateCompanion<JournalReflection> {
  final Value<String> id;
  final Value<String?> guessedEmotionLevel1;
  final Value<String?> guessedEmotionLevel2;
  final Value<String?> guessedEmotionLevel3;
  final Value<String?> currentEmotionLevel1;
  final Value<String?> currentEmotionLevel2;
  final Value<String?> currentEmotionLevel3;
  final Value<String> reflection;
  final Value<String> journalEntryId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const JournalReflectionsCompanion({
    this.id = const Value.absent(),
    this.guessedEmotionLevel1 = const Value.absent(),
    this.guessedEmotionLevel2 = const Value.absent(),
    this.guessedEmotionLevel3 = const Value.absent(),
    this.currentEmotionLevel1 = const Value.absent(),
    this.currentEmotionLevel2 = const Value.absent(),
    this.currentEmotionLevel3 = const Value.absent(),
    this.reflection = const Value.absent(),
    this.journalEntryId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalReflectionsCompanion.insert({
    required String id,
    this.guessedEmotionLevel1 = const Value.absent(),
    this.guessedEmotionLevel2 = const Value.absent(),
    this.guessedEmotionLevel3 = const Value.absent(),
    this.currentEmotionLevel1 = const Value.absent(),
    this.currentEmotionLevel2 = const Value.absent(),
    this.currentEmotionLevel3 = const Value.absent(),
    required String reflection,
    required String journalEntryId,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       reflection = Value(reflection),
       journalEntryId = Value(journalEntryId),
       createdAt = Value(createdAt);
  static Insertable<JournalReflection> custom({
    Expression<String>? id,
    Expression<String>? guessedEmotionLevel1,
    Expression<String>? guessedEmotionLevel2,
    Expression<String>? guessedEmotionLevel3,
    Expression<String>? currentEmotionLevel1,
    Expression<String>? currentEmotionLevel2,
    Expression<String>? currentEmotionLevel3,
    Expression<String>? reflection,
    Expression<String>? journalEntryId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (guessedEmotionLevel1 != null)
        'guessed_emotion_level1': guessedEmotionLevel1,
      if (guessedEmotionLevel2 != null)
        'guessed_emotion_level2': guessedEmotionLevel2,
      if (guessedEmotionLevel3 != null)
        'guessed_emotion_level3': guessedEmotionLevel3,
      if (currentEmotionLevel1 != null)
        'current_emotion_level1': currentEmotionLevel1,
      if (currentEmotionLevel2 != null)
        'current_emotion_level2': currentEmotionLevel2,
      if (currentEmotionLevel3 != null)
        'current_emotion_level3': currentEmotionLevel3,
      if (reflection != null) 'reflection': reflection,
      if (journalEntryId != null) 'journal_entry_id': journalEntryId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalReflectionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? guessedEmotionLevel1,
    Value<String?>? guessedEmotionLevel2,
    Value<String?>? guessedEmotionLevel3,
    Value<String?>? currentEmotionLevel1,
    Value<String?>? currentEmotionLevel2,
    Value<String?>? currentEmotionLevel3,
    Value<String>? reflection,
    Value<String>? journalEntryId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return JournalReflectionsCompanion(
      id: id ?? this.id,
      guessedEmotionLevel1: guessedEmotionLevel1 ?? this.guessedEmotionLevel1,
      guessedEmotionLevel2: guessedEmotionLevel2 ?? this.guessedEmotionLevel2,
      guessedEmotionLevel3: guessedEmotionLevel3 ?? this.guessedEmotionLevel3,
      currentEmotionLevel1: currentEmotionLevel1 ?? this.currentEmotionLevel1,
      currentEmotionLevel2: currentEmotionLevel2 ?? this.currentEmotionLevel2,
      currentEmotionLevel3: currentEmotionLevel3 ?? this.currentEmotionLevel3,
      reflection: reflection ?? this.reflection,
      journalEntryId: journalEntryId ?? this.journalEntryId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (guessedEmotionLevel1.present) {
      map['guessed_emotion_level1'] = Variable<String>(
        guessedEmotionLevel1.value,
      );
    }
    if (guessedEmotionLevel2.present) {
      map['guessed_emotion_level2'] = Variable<String>(
        guessedEmotionLevel2.value,
      );
    }
    if (guessedEmotionLevel3.present) {
      map['guessed_emotion_level3'] = Variable<String>(
        guessedEmotionLevel3.value,
      );
    }
    if (currentEmotionLevel1.present) {
      map['current_emotion_level1'] = Variable<String>(
        currentEmotionLevel1.value,
      );
    }
    if (currentEmotionLevel2.present) {
      map['current_emotion_level2'] = Variable<String>(
        currentEmotionLevel2.value,
      );
    }
    if (currentEmotionLevel3.present) {
      map['current_emotion_level3'] = Variable<String>(
        currentEmotionLevel3.value,
      );
    }
    if (reflection.present) {
      map['reflection'] = Variable<String>(reflection.value);
    }
    if (journalEntryId.present) {
      map['journal_entry_id'] = Variable<String>(journalEntryId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalReflectionsCompanion(')
          ..write('id: $id, ')
          ..write('guessedEmotionLevel1: $guessedEmotionLevel1, ')
          ..write('guessedEmotionLevel2: $guessedEmotionLevel2, ')
          ..write('guessedEmotionLevel3: $guessedEmotionLevel3, ')
          ..write('currentEmotionLevel1: $currentEmotionLevel1, ')
          ..write('currentEmotionLevel2: $currentEmotionLevel2, ')
          ..write('currentEmotionLevel3: $currentEmotionLevel3, ')
          ..write('reflection: $reflection, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CommsCheckEntriesTable extends CommsCheckEntries
    with TableInfo<$CommsCheckEntriesTable, CommsCheckEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommsCheckEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetInfosMeta = const VerificationMeta(
    'targetInfos',
  );
  @override
  late final GeneratedColumn<String> targetInfos = GeneratedColumn<String>(
    'target_infos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feelingLevel1IdMeta = const VerificationMeta(
    'feelingLevel1Id',
  );
  @override
  late final GeneratedColumn<String> feelingLevel1Id = GeneratedColumn<String>(
    'feeling_level1_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _feelingLevel2IdMeta = const VerificationMeta(
    'feelingLevel2Id',
  );
  @override
  late final GeneratedColumn<String> feelingLevel2Id = GeneratedColumn<String>(
    'feeling_level2_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _feelingLevel3IdMeta = const VerificationMeta(
    'feelingLevel3Id',
  );
  @override
  late final GeneratedColumn<String> feelingLevel3Id = GeneratedColumn<String>(
    'feeling_level3_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expectedReactionMeta = const VerificationMeta(
    'expectedReaction',
  );
  @override
  late final GeneratedColumn<String> expectedReaction = GeneratedColumn<String>(
    'expected_reaction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wantedReactionMeta = const VerificationMeta(
    'wantedReaction',
  );
  @override
  late final GeneratedColumn<String> wantedReaction = GeneratedColumn<String>(
    'wanted_reaction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responseAfterReactionMeta =
      const VerificationMeta('responseAfterReaction');
  @override
  late final GeneratedColumn<String> responseAfterReaction =
      GeneratedColumn<String>(
        'response_after_reaction',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _reflectionMeta = const VerificationMeta(
    'reflection',
  );
  @override
  late final GeneratedColumn<String> reflection = GeneratedColumn<String>(
    'reflection',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    targetInfos,
    message,
    feelingLevel1Id,
    feelingLevel2Id,
    feelingLevel3Id,
    expectedReaction,
    wantedReaction,
    responseAfterReaction,
    reflection,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comms_check_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommsCheckEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('target_infos')) {
      context.handle(
        _targetInfosMeta,
        targetInfos.isAcceptableOrUnknown(
          data['target_infos']!,
          _targetInfosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetInfosMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('feeling_level1_id')) {
      context.handle(
        _feelingLevel1IdMeta,
        feelingLevel1Id.isAcceptableOrUnknown(
          data['feeling_level1_id']!,
          _feelingLevel1IdMeta,
        ),
      );
    }
    if (data.containsKey('feeling_level2_id')) {
      context.handle(
        _feelingLevel2IdMeta,
        feelingLevel2Id.isAcceptableOrUnknown(
          data['feeling_level2_id']!,
          _feelingLevel2IdMeta,
        ),
      );
    }
    if (data.containsKey('feeling_level3_id')) {
      context.handle(
        _feelingLevel3IdMeta,
        feelingLevel3Id.isAcceptableOrUnknown(
          data['feeling_level3_id']!,
          _feelingLevel3IdMeta,
        ),
      );
    }
    if (data.containsKey('expected_reaction')) {
      context.handle(
        _expectedReactionMeta,
        expectedReaction.isAcceptableOrUnknown(
          data['expected_reaction']!,
          _expectedReactionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expectedReactionMeta);
    }
    if (data.containsKey('wanted_reaction')) {
      context.handle(
        _wantedReactionMeta,
        wantedReaction.isAcceptableOrUnknown(
          data['wanted_reaction']!,
          _wantedReactionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wantedReactionMeta);
    }
    if (data.containsKey('response_after_reaction')) {
      context.handle(
        _responseAfterReactionMeta,
        responseAfterReaction.isAcceptableOrUnknown(
          data['response_after_reaction']!,
          _responseAfterReactionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responseAfterReactionMeta);
    }
    if (data.containsKey('reflection')) {
      context.handle(
        _reflectionMeta,
        reflection.isAcceptableOrUnknown(data['reflection']!, _reflectionMeta),
      );
    } else if (isInserting) {
      context.missing(_reflectionMeta);
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
  CommsCheckEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommsCheckEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      targetInfos: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_infos'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      feelingLevel1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feeling_level1_id'],
      ),
      feelingLevel2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feeling_level2_id'],
      ),
      feelingLevel3Id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feeling_level3_id'],
      ),
      expectedReaction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expected_reaction'],
      )!,
      wantedReaction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wanted_reaction'],
      )!,
      responseAfterReaction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}response_after_reaction'],
      )!,
      reflection: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reflection'],
      )!,
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
  $CommsCheckEntriesTable createAlias(String alias) {
    return $CommsCheckEntriesTable(attachedDatabase, alias);
  }
}

class CommsCheckEntry extends DataClass implements Insertable<CommsCheckEntry> {
  final String id;
  final String targetInfos;
  final String message;
  final String? feelingLevel1Id;
  final String? feelingLevel2Id;
  final String? feelingLevel3Id;
  final String expectedReaction;
  final String wantedReaction;
  final String responseAfterReaction;
  final String reflection;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CommsCheckEntry({
    required this.id,
    required this.targetInfos,
    required this.message,
    this.feelingLevel1Id,
    this.feelingLevel2Id,
    this.feelingLevel3Id,
    required this.expectedReaction,
    required this.wantedReaction,
    required this.responseAfterReaction,
    required this.reflection,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['target_infos'] = Variable<String>(targetInfos);
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || feelingLevel1Id != null) {
      map['feeling_level1_id'] = Variable<String>(feelingLevel1Id);
    }
    if (!nullToAbsent || feelingLevel2Id != null) {
      map['feeling_level2_id'] = Variable<String>(feelingLevel2Id);
    }
    if (!nullToAbsent || feelingLevel3Id != null) {
      map['feeling_level3_id'] = Variable<String>(feelingLevel3Id);
    }
    map['expected_reaction'] = Variable<String>(expectedReaction);
    map['wanted_reaction'] = Variable<String>(wantedReaction);
    map['response_after_reaction'] = Variable<String>(responseAfterReaction);
    map['reflection'] = Variable<String>(reflection);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CommsCheckEntriesCompanion toCompanion(bool nullToAbsent) {
    return CommsCheckEntriesCompanion(
      id: Value(id),
      targetInfos: Value(targetInfos),
      message: Value(message),
      feelingLevel1Id: feelingLevel1Id == null && nullToAbsent
          ? const Value.absent()
          : Value(feelingLevel1Id),
      feelingLevel2Id: feelingLevel2Id == null && nullToAbsent
          ? const Value.absent()
          : Value(feelingLevel2Id),
      feelingLevel3Id: feelingLevel3Id == null && nullToAbsent
          ? const Value.absent()
          : Value(feelingLevel3Id),
      expectedReaction: Value(expectedReaction),
      wantedReaction: Value(wantedReaction),
      responseAfterReaction: Value(responseAfterReaction),
      reflection: Value(reflection),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CommsCheckEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommsCheckEntry(
      id: serializer.fromJson<String>(json['id']),
      targetInfos: serializer.fromJson<String>(json['targetInfos']),
      message: serializer.fromJson<String>(json['message']),
      feelingLevel1Id: serializer.fromJson<String?>(json['feelingLevel1Id']),
      feelingLevel2Id: serializer.fromJson<String?>(json['feelingLevel2Id']),
      feelingLevel3Id: serializer.fromJson<String?>(json['feelingLevel3Id']),
      expectedReaction: serializer.fromJson<String>(json['expectedReaction']),
      wantedReaction: serializer.fromJson<String>(json['wantedReaction']),
      responseAfterReaction: serializer.fromJson<String>(
        json['responseAfterReaction'],
      ),
      reflection: serializer.fromJson<String>(json['reflection']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'targetInfos': serializer.toJson<String>(targetInfos),
      'message': serializer.toJson<String>(message),
      'feelingLevel1Id': serializer.toJson<String?>(feelingLevel1Id),
      'feelingLevel2Id': serializer.toJson<String?>(feelingLevel2Id),
      'feelingLevel3Id': serializer.toJson<String?>(feelingLevel3Id),
      'expectedReaction': serializer.toJson<String>(expectedReaction),
      'wantedReaction': serializer.toJson<String>(wantedReaction),
      'responseAfterReaction': serializer.toJson<String>(responseAfterReaction),
      'reflection': serializer.toJson<String>(reflection),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CommsCheckEntry copyWith({
    String? id,
    String? targetInfos,
    String? message,
    Value<String?> feelingLevel1Id = const Value.absent(),
    Value<String?> feelingLevel2Id = const Value.absent(),
    Value<String?> feelingLevel3Id = const Value.absent(),
    String? expectedReaction,
    String? wantedReaction,
    String? responseAfterReaction,
    String? reflection,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CommsCheckEntry(
    id: id ?? this.id,
    targetInfos: targetInfos ?? this.targetInfos,
    message: message ?? this.message,
    feelingLevel1Id: feelingLevel1Id.present
        ? feelingLevel1Id.value
        : this.feelingLevel1Id,
    feelingLevel2Id: feelingLevel2Id.present
        ? feelingLevel2Id.value
        : this.feelingLevel2Id,
    feelingLevel3Id: feelingLevel3Id.present
        ? feelingLevel3Id.value
        : this.feelingLevel3Id,
    expectedReaction: expectedReaction ?? this.expectedReaction,
    wantedReaction: wantedReaction ?? this.wantedReaction,
    responseAfterReaction: responseAfterReaction ?? this.responseAfterReaction,
    reflection: reflection ?? this.reflection,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CommsCheckEntry copyWithCompanion(CommsCheckEntriesCompanion data) {
    return CommsCheckEntry(
      id: data.id.present ? data.id.value : this.id,
      targetInfos: data.targetInfos.present
          ? data.targetInfos.value
          : this.targetInfos,
      message: data.message.present ? data.message.value : this.message,
      feelingLevel1Id: data.feelingLevel1Id.present
          ? data.feelingLevel1Id.value
          : this.feelingLevel1Id,
      feelingLevel2Id: data.feelingLevel2Id.present
          ? data.feelingLevel2Id.value
          : this.feelingLevel2Id,
      feelingLevel3Id: data.feelingLevel3Id.present
          ? data.feelingLevel3Id.value
          : this.feelingLevel3Id,
      expectedReaction: data.expectedReaction.present
          ? data.expectedReaction.value
          : this.expectedReaction,
      wantedReaction: data.wantedReaction.present
          ? data.wantedReaction.value
          : this.wantedReaction,
      responseAfterReaction: data.responseAfterReaction.present
          ? data.responseAfterReaction.value
          : this.responseAfterReaction,
      reflection: data.reflection.present
          ? data.reflection.value
          : this.reflection,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommsCheckEntry(')
          ..write('id: $id, ')
          ..write('targetInfos: $targetInfos, ')
          ..write('message: $message, ')
          ..write('feelingLevel1Id: $feelingLevel1Id, ')
          ..write('feelingLevel2Id: $feelingLevel2Id, ')
          ..write('feelingLevel3Id: $feelingLevel3Id, ')
          ..write('expectedReaction: $expectedReaction, ')
          ..write('wantedReaction: $wantedReaction, ')
          ..write('responseAfterReaction: $responseAfterReaction, ')
          ..write('reflection: $reflection, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    targetInfos,
    message,
    feelingLevel1Id,
    feelingLevel2Id,
    feelingLevel3Id,
    expectedReaction,
    wantedReaction,
    responseAfterReaction,
    reflection,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommsCheckEntry &&
          other.id == this.id &&
          other.targetInfos == this.targetInfos &&
          other.message == this.message &&
          other.feelingLevel1Id == this.feelingLevel1Id &&
          other.feelingLevel2Id == this.feelingLevel2Id &&
          other.feelingLevel3Id == this.feelingLevel3Id &&
          other.expectedReaction == this.expectedReaction &&
          other.wantedReaction == this.wantedReaction &&
          other.responseAfterReaction == this.responseAfterReaction &&
          other.reflection == this.reflection &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CommsCheckEntriesCompanion extends UpdateCompanion<CommsCheckEntry> {
  final Value<String> id;
  final Value<String> targetInfos;
  final Value<String> message;
  final Value<String?> feelingLevel1Id;
  final Value<String?> feelingLevel2Id;
  final Value<String?> feelingLevel3Id;
  final Value<String> expectedReaction;
  final Value<String> wantedReaction;
  final Value<String> responseAfterReaction;
  final Value<String> reflection;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CommsCheckEntriesCompanion({
    this.id = const Value.absent(),
    this.targetInfos = const Value.absent(),
    this.message = const Value.absent(),
    this.feelingLevel1Id = const Value.absent(),
    this.feelingLevel2Id = const Value.absent(),
    this.feelingLevel3Id = const Value.absent(),
    this.expectedReaction = const Value.absent(),
    this.wantedReaction = const Value.absent(),
    this.responseAfterReaction = const Value.absent(),
    this.reflection = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CommsCheckEntriesCompanion.insert({
    required String id,
    required String targetInfos,
    required String message,
    this.feelingLevel1Id = const Value.absent(),
    this.feelingLevel2Id = const Value.absent(),
    this.feelingLevel3Id = const Value.absent(),
    required String expectedReaction,
    required String wantedReaction,
    required String responseAfterReaction,
    required String reflection,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       targetInfos = Value(targetInfos),
       message = Value(message),
       expectedReaction = Value(expectedReaction),
       wantedReaction = Value(wantedReaction),
       responseAfterReaction = Value(responseAfterReaction),
       reflection = Value(reflection),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CommsCheckEntry> custom({
    Expression<String>? id,
    Expression<String>? targetInfos,
    Expression<String>? message,
    Expression<String>? feelingLevel1Id,
    Expression<String>? feelingLevel2Id,
    Expression<String>? feelingLevel3Id,
    Expression<String>? expectedReaction,
    Expression<String>? wantedReaction,
    Expression<String>? responseAfterReaction,
    Expression<String>? reflection,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (targetInfos != null) 'target_infos': targetInfos,
      if (message != null) 'message': message,
      if (feelingLevel1Id != null) 'feeling_level1_id': feelingLevel1Id,
      if (feelingLevel2Id != null) 'feeling_level2_id': feelingLevel2Id,
      if (feelingLevel3Id != null) 'feeling_level3_id': feelingLevel3Id,
      if (expectedReaction != null) 'expected_reaction': expectedReaction,
      if (wantedReaction != null) 'wanted_reaction': wantedReaction,
      if (responseAfterReaction != null)
        'response_after_reaction': responseAfterReaction,
      if (reflection != null) 'reflection': reflection,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CommsCheckEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? targetInfos,
    Value<String>? message,
    Value<String?>? feelingLevel1Id,
    Value<String?>? feelingLevel2Id,
    Value<String?>? feelingLevel3Id,
    Value<String>? expectedReaction,
    Value<String>? wantedReaction,
    Value<String>? responseAfterReaction,
    Value<String>? reflection,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CommsCheckEntriesCompanion(
      id: id ?? this.id,
      targetInfos: targetInfos ?? this.targetInfos,
      message: message ?? this.message,
      feelingLevel1Id: feelingLevel1Id ?? this.feelingLevel1Id,
      feelingLevel2Id: feelingLevel2Id ?? this.feelingLevel2Id,
      feelingLevel3Id: feelingLevel3Id ?? this.feelingLevel3Id,
      expectedReaction: expectedReaction ?? this.expectedReaction,
      wantedReaction: wantedReaction ?? this.wantedReaction,
      responseAfterReaction:
          responseAfterReaction ?? this.responseAfterReaction,
      reflection: reflection ?? this.reflection,
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
    if (targetInfos.present) {
      map['target_infos'] = Variable<String>(targetInfos.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (feelingLevel1Id.present) {
      map['feeling_level1_id'] = Variable<String>(feelingLevel1Id.value);
    }
    if (feelingLevel2Id.present) {
      map['feeling_level2_id'] = Variable<String>(feelingLevel2Id.value);
    }
    if (feelingLevel3Id.present) {
      map['feeling_level3_id'] = Variable<String>(feelingLevel3Id.value);
    }
    if (expectedReaction.present) {
      map['expected_reaction'] = Variable<String>(expectedReaction.value);
    }
    if (wantedReaction.present) {
      map['wanted_reaction'] = Variable<String>(wantedReaction.value);
    }
    if (responseAfterReaction.present) {
      map['response_after_reaction'] = Variable<String>(
        responseAfterReaction.value,
      );
    }
    if (reflection.present) {
      map['reflection'] = Variable<String>(reflection.value);
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
    return (StringBuffer('CommsCheckEntriesCompanion(')
          ..write('id: $id, ')
          ..write('targetInfos: $targetInfos, ')
          ..write('message: $message, ')
          ..write('feelingLevel1Id: $feelingLevel1Id, ')
          ..write('feelingLevel2Id: $feelingLevel2Id, ')
          ..write('feelingLevel3Id: $feelingLevel3Id, ')
          ..write('expectedReaction: $expectedReaction, ')
          ..write('wantedReaction: $wantedReaction, ')
          ..write('responseAfterReaction: $responseAfterReaction, ')
          ..write('reflection: $reflection, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EmotionExplorerMapsTable extends EmotionExplorerMaps
    with TableInfo<$EmotionExplorerMapsTable, EmotionExplorerMap> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmotionExplorerMapsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, data];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emotion_explorer_maps';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmotionExplorerMap> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmotionExplorerMap map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmotionExplorerMap(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
    );
  }

  @override
  $EmotionExplorerMapsTable createAlias(String alias) {
    return $EmotionExplorerMapsTable(attachedDatabase, alias);
  }
}

class EmotionExplorerMap extends DataClass
    implements Insertable<EmotionExplorerMap> {
  final int id;
  final String data;
  const EmotionExplorerMap({required this.id, required this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['data'] = Variable<String>(data);
    return map;
  }

  EmotionExplorerMapsCompanion toCompanion(bool nullToAbsent) {
    return EmotionExplorerMapsCompanion(id: Value(id), data: Value(data));
  }

  factory EmotionExplorerMap.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmotionExplorerMap(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String>(data),
    };
  }

  EmotionExplorerMap copyWith({int? id, String? data}) =>
      EmotionExplorerMap(id: id ?? this.id, data: data ?? this.data);
  EmotionExplorerMap copyWithCompanion(EmotionExplorerMapsCompanion data) {
    return EmotionExplorerMap(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmotionExplorerMap(')
          ..write('id: $id, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmotionExplorerMap &&
          other.id == this.id &&
          other.data == this.data);
}

class EmotionExplorerMapsCompanion extends UpdateCompanion<EmotionExplorerMap> {
  final Value<int> id;
  final Value<String> data;
  const EmotionExplorerMapsCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
  });
  EmotionExplorerMapsCompanion.insert({
    this.id = const Value.absent(),
    required String data,
  }) : data = Value(data);
  static Insertable<EmotionExplorerMap> custom({
    Expression<int>? id,
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
    });
  }

  EmotionExplorerMapsCompanion copyWith({Value<int>? id, Value<String>? data}) {
    return EmotionExplorerMapsCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmotionExplorerMapsCompanion(')
          ..write('id: $id, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $MeditationsTable extends Meditations
    with TableInfo<$MeditationsTable, Meditation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeditationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _favoriteMeta = const VerificationMeta(
    'favorite',
  );
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
    'favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favorite" IN (0, 1))',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chakraTypeMeta = const VerificationMeta(
    'chakraType',
  );
  @override
  late final GeneratedColumn<String> chakraType = GeneratedColumn<String>(
    'chakra_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cognitiveTypeMeta = const VerificationMeta(
    'cognitiveType',
  );
  @override
  late final GeneratedColumn<String> cognitiveType = GeneratedColumn<String>(
    'cognitive_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioSectionsMeta = const VerificationMeta(
    'audioSections',
  );
  @override
  late final GeneratedColumn<String> audioSections = GeneratedColumn<String>(
    'audio_sections',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tutorialVideoPathMeta = const VerificationMeta(
    'tutorialVideoPath',
  );
  @override
  late final GeneratedColumn<String> tutorialVideoPath =
      GeneratedColumn<String>(
        'tutorial_video_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    favorite,
    title,
    description,
    type,
    chakraType,
    cognitiveType,
    level,
    audioSections,
    tutorialVideoPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meditations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Meditation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(
        _favoriteMeta,
        favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta),
      );
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('chakra_type')) {
      context.handle(
        _chakraTypeMeta,
        chakraType.isAcceptableOrUnknown(data['chakra_type']!, _chakraTypeMeta),
      );
    }
    if (data.containsKey('cognitive_type')) {
      context.handle(
        _cognitiveTypeMeta,
        cognitiveType.isAcceptableOrUnknown(
          data['cognitive_type']!,
          _cognitiveTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cognitiveTypeMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('audio_sections')) {
      context.handle(
        _audioSectionsMeta,
        audioSections.isAcceptableOrUnknown(
          data['audio_sections']!,
          _audioSectionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_audioSectionsMeta);
    }
    if (data.containsKey('tutorial_video_path')) {
      context.handle(
        _tutorialVideoPathMeta,
        tutorialVideoPath.isAcceptableOrUnknown(
          data['tutorial_video_path']!,
          _tutorialVideoPathMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meditation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meditation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      favorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favorite'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      chakraType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chakra_type'],
      ),
      cognitiveType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cognitive_type'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}level'],
      )!,
      audioSections: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_sections'],
      )!,
      tutorialVideoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tutorial_video_path'],
      ),
    );
  }

  @override
  $MeditationsTable createAlias(String alias) {
    return $MeditationsTable(attachedDatabase, alias);
  }
}

class Meditation extends DataClass implements Insertable<Meditation> {
  final String id;
  final bool favorite;
  final String title;
  final String description;
  final String type;
  final String? chakraType;
  final String cognitiveType;
  final String level;
  final String audioSections;
  final String? tutorialVideoPath;
  const Meditation({
    required this.id,
    required this.favorite,
    required this.title,
    required this.description,
    required this.type,
    this.chakraType,
    required this.cognitiveType,
    required this.level,
    required this.audioSections,
    this.tutorialVideoPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['favorite'] = Variable<bool>(favorite);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || chakraType != null) {
      map['chakra_type'] = Variable<String>(chakraType);
    }
    map['cognitive_type'] = Variable<String>(cognitiveType);
    map['level'] = Variable<String>(level);
    map['audio_sections'] = Variable<String>(audioSections);
    if (!nullToAbsent || tutorialVideoPath != null) {
      map['tutorial_video_path'] = Variable<String>(tutorialVideoPath);
    }
    return map;
  }

  MeditationsCompanion toCompanion(bool nullToAbsent) {
    return MeditationsCompanion(
      id: Value(id),
      favorite: Value(favorite),
      title: Value(title),
      description: Value(description),
      type: Value(type),
      chakraType: chakraType == null && nullToAbsent
          ? const Value.absent()
          : Value(chakraType),
      cognitiveType: Value(cognitiveType),
      level: Value(level),
      audioSections: Value(audioSections),
      tutorialVideoPath: tutorialVideoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(tutorialVideoPath),
    );
  }

  factory Meditation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meditation(
      id: serializer.fromJson<String>(json['id']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      type: serializer.fromJson<String>(json['type']),
      chakraType: serializer.fromJson<String?>(json['chakraType']),
      cognitiveType: serializer.fromJson<String>(json['cognitiveType']),
      level: serializer.fromJson<String>(json['level']),
      audioSections: serializer.fromJson<String>(json['audioSections']),
      tutorialVideoPath: serializer.fromJson<String?>(
        json['tutorialVideoPath'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'favorite': serializer.toJson<bool>(favorite),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'type': serializer.toJson<String>(type),
      'chakraType': serializer.toJson<String?>(chakraType),
      'cognitiveType': serializer.toJson<String>(cognitiveType),
      'level': serializer.toJson<String>(level),
      'audioSections': serializer.toJson<String>(audioSections),
      'tutorialVideoPath': serializer.toJson<String?>(tutorialVideoPath),
    };
  }

  Meditation copyWith({
    String? id,
    bool? favorite,
    String? title,
    String? description,
    String? type,
    Value<String?> chakraType = const Value.absent(),
    String? cognitiveType,
    String? level,
    String? audioSections,
    Value<String?> tutorialVideoPath = const Value.absent(),
  }) => Meditation(
    id: id ?? this.id,
    favorite: favorite ?? this.favorite,
    title: title ?? this.title,
    description: description ?? this.description,
    type: type ?? this.type,
    chakraType: chakraType.present ? chakraType.value : this.chakraType,
    cognitiveType: cognitiveType ?? this.cognitiveType,
    level: level ?? this.level,
    audioSections: audioSections ?? this.audioSections,
    tutorialVideoPath: tutorialVideoPath.present
        ? tutorialVideoPath.value
        : this.tutorialVideoPath,
  );
  Meditation copyWithCompanion(MeditationsCompanion data) {
    return Meditation(
      id: data.id.present ? data.id.value : this.id,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      type: data.type.present ? data.type.value : this.type,
      chakraType: data.chakraType.present
          ? data.chakraType.value
          : this.chakraType,
      cognitiveType: data.cognitiveType.present
          ? data.cognitiveType.value
          : this.cognitiveType,
      level: data.level.present ? data.level.value : this.level,
      audioSections: data.audioSections.present
          ? data.audioSections.value
          : this.audioSections,
      tutorialVideoPath: data.tutorialVideoPath.present
          ? data.tutorialVideoPath.value
          : this.tutorialVideoPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Meditation(')
          ..write('id: $id, ')
          ..write('favorite: $favorite, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('chakraType: $chakraType, ')
          ..write('cognitiveType: $cognitiveType, ')
          ..write('level: $level, ')
          ..write('audioSections: $audioSections, ')
          ..write('tutorialVideoPath: $tutorialVideoPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    favorite,
    title,
    description,
    type,
    chakraType,
    cognitiveType,
    level,
    audioSections,
    tutorialVideoPath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meditation &&
          other.id == this.id &&
          other.favorite == this.favorite &&
          other.title == this.title &&
          other.description == this.description &&
          other.type == this.type &&
          other.chakraType == this.chakraType &&
          other.cognitiveType == this.cognitiveType &&
          other.level == this.level &&
          other.audioSections == this.audioSections &&
          other.tutorialVideoPath == this.tutorialVideoPath);
}

class MeditationsCompanion extends UpdateCompanion<Meditation> {
  final Value<String> id;
  final Value<bool> favorite;
  final Value<String> title;
  final Value<String> description;
  final Value<String> type;
  final Value<String?> chakraType;
  final Value<String> cognitiveType;
  final Value<String> level;
  final Value<String> audioSections;
  final Value<String?> tutorialVideoPath;
  final Value<int> rowid;
  const MeditationsCompanion({
    this.id = const Value.absent(),
    this.favorite = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.chakraType = const Value.absent(),
    this.cognitiveType = const Value.absent(),
    this.level = const Value.absent(),
    this.audioSections = const Value.absent(),
    this.tutorialVideoPath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MeditationsCompanion.insert({
    required String id,
    required bool favorite,
    required String title,
    required String description,
    required String type,
    this.chakraType = const Value.absent(),
    required String cognitiveType,
    required String level,
    required String audioSections,
    this.tutorialVideoPath = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       favorite = Value(favorite),
       title = Value(title),
       description = Value(description),
       type = Value(type),
       cognitiveType = Value(cognitiveType),
       level = Value(level),
       audioSections = Value(audioSections);
  static Insertable<Meditation> custom({
    Expression<String>? id,
    Expression<bool>? favorite,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? chakraType,
    Expression<String>? cognitiveType,
    Expression<String>? level,
    Expression<String>? audioSections,
    Expression<String>? tutorialVideoPath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (favorite != null) 'favorite': favorite,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (chakraType != null) 'chakra_type': chakraType,
      if (cognitiveType != null) 'cognitive_type': cognitiveType,
      if (level != null) 'level': level,
      if (audioSections != null) 'audio_sections': audioSections,
      if (tutorialVideoPath != null) 'tutorial_video_path': tutorialVideoPath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MeditationsCompanion copyWith({
    Value<String>? id,
    Value<bool>? favorite,
    Value<String>? title,
    Value<String>? description,
    Value<String>? type,
    Value<String?>? chakraType,
    Value<String>? cognitiveType,
    Value<String>? level,
    Value<String>? audioSections,
    Value<String?>? tutorialVideoPath,
    Value<int>? rowid,
  }) {
    return MeditationsCompanion(
      id: id ?? this.id,
      favorite: favorite ?? this.favorite,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      chakraType: chakraType ?? this.chakraType,
      cognitiveType: cognitiveType ?? this.cognitiveType,
      level: level ?? this.level,
      audioSections: audioSections ?? this.audioSections,
      tutorialVideoPath: tutorialVideoPath ?? this.tutorialVideoPath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (chakraType.present) {
      map['chakra_type'] = Variable<String>(chakraType.value);
    }
    if (cognitiveType.present) {
      map['cognitive_type'] = Variable<String>(cognitiveType.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (audioSections.present) {
      map['audio_sections'] = Variable<String>(audioSections.value);
    }
    if (tutorialVideoPath.present) {
      map['tutorial_video_path'] = Variable<String>(tutorialVideoPath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeditationsCompanion(')
          ..write('id: $id, ')
          ..write('favorite: $favorite, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('chakraType: $chakraType, ')
          ..write('cognitiveType: $cognitiveType, ')
          ..write('level: $level, ')
          ..write('audioSections: $audioSections, ')
          ..write('tutorialVideoPath: $tutorialVideoPath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutineMeditationsTable extends RoutineMeditations
    with TableInfo<$RoutineMeditationsTable, RoutineMeditation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineMeditationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _routineIdMeta = const VerificationMeta(
    'routineId',
  );
  @override
  late final GeneratedColumn<String> routineId = GeneratedColumn<String>(
    'routine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _meditationIdMeta = const VerificationMeta(
    'meditationId',
  );
  @override
  late final GeneratedColumn<String> meditationId = GeneratedColumn<String>(
    'meditation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    routineId,
    meditationId,
    orderIndex,
    repetitions,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_meditations';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineMeditation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('routine_id')) {
      context.handle(
        _routineIdMeta,
        routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    if (data.containsKey('meditation_id')) {
      context.handle(
        _meditationIdMeta,
        meditationId.isAcceptableOrUnknown(
          data['meditation_id']!,
          _meditationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_meditationIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routineId, meditationId};
  @override
  RoutineMeditation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineMeditation(
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_id'],
      )!,
      meditationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meditation_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      )!,
    );
  }

  @override
  $RoutineMeditationsTable createAlias(String alias) {
    return $RoutineMeditationsTable(attachedDatabase, alias);
  }
}

class RoutineMeditation extends DataClass
    implements Insertable<RoutineMeditation> {
  final String routineId;
  final String meditationId;
  final int orderIndex;
  final int repetitions;
  const RoutineMeditation({
    required this.routineId,
    required this.meditationId,
    required this.orderIndex,
    required this.repetitions,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['routine_id'] = Variable<String>(routineId);
    map['meditation_id'] = Variable<String>(meditationId);
    map['order_index'] = Variable<int>(orderIndex);
    map['repetitions'] = Variable<int>(repetitions);
    return map;
  }

  RoutineMeditationsCompanion toCompanion(bool nullToAbsent) {
    return RoutineMeditationsCompanion(
      routineId: Value(routineId),
      meditationId: Value(meditationId),
      orderIndex: Value(orderIndex),
      repetitions: Value(repetitions),
    );
  }

  factory RoutineMeditation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineMeditation(
      routineId: serializer.fromJson<String>(json['routineId']),
      meditationId: serializer.fromJson<String>(json['meditationId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routineId': serializer.toJson<String>(routineId),
      'meditationId': serializer.toJson<String>(meditationId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'repetitions': serializer.toJson<int>(repetitions),
    };
  }

  RoutineMeditation copyWith({
    String? routineId,
    String? meditationId,
    int? orderIndex,
    int? repetitions,
  }) => RoutineMeditation(
    routineId: routineId ?? this.routineId,
    meditationId: meditationId ?? this.meditationId,
    orderIndex: orderIndex ?? this.orderIndex,
    repetitions: repetitions ?? this.repetitions,
  );
  RoutineMeditation copyWithCompanion(RoutineMeditationsCompanion data) {
    return RoutineMeditation(
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
      meditationId: data.meditationId.present
          ? data.meditationId.value
          : this.meditationId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      repetitions: data.repetitions.present
          ? data.repetitions.value
          : this.repetitions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineMeditation(')
          ..write('routineId: $routineId, ')
          ..write('meditationId: $meditationId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('repetitions: $repetitions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(routineId, meditationId, orderIndex, repetitions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineMeditation &&
          other.routineId == this.routineId &&
          other.meditationId == this.meditationId &&
          other.orderIndex == this.orderIndex &&
          other.repetitions == this.repetitions);
}

class RoutineMeditationsCompanion extends UpdateCompanion<RoutineMeditation> {
  final Value<String> routineId;
  final Value<String> meditationId;
  final Value<int> orderIndex;
  final Value<int> repetitions;
  final Value<int> rowid;
  const RoutineMeditationsCompanion({
    this.routineId = const Value.absent(),
    this.meditationId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutineMeditationsCompanion.insert({
    required String routineId,
    required String meditationId,
    required int orderIndex,
    this.repetitions = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : routineId = Value(routineId),
       meditationId = Value(meditationId),
       orderIndex = Value(orderIndex);
  static Insertable<RoutineMeditation> custom({
    Expression<String>? routineId,
    Expression<String>? meditationId,
    Expression<int>? orderIndex,
    Expression<int>? repetitions,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (routineId != null) 'routine_id': routineId,
      if (meditationId != null) 'meditation_id': meditationId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (repetitions != null) 'repetitions': repetitions,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutineMeditationsCompanion copyWith({
    Value<String>? routineId,
    Value<String>? meditationId,
    Value<int>? orderIndex,
    Value<int>? repetitions,
    Value<int>? rowid,
  }) {
    return RoutineMeditationsCompanion(
      routineId: routineId ?? this.routineId,
      meditationId: meditationId ?? this.meditationId,
      orderIndex: orderIndex ?? this.orderIndex,
      repetitions: repetitions ?? this.repetitions,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routineId.present) {
      map['routine_id'] = Variable<String>(routineId.value);
    }
    if (meditationId.present) {
      map['meditation_id'] = Variable<String>(meditationId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineMeditationsCompanion(')
          ..write('routineId: $routineId, ')
          ..write('meditationId: $meditationId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('repetitions: $repetitions, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutinesTable extends Routines with TableInfo<$RoutinesTable, Routine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _visibleMeta = const VerificationMeta(
    'visible',
  );
  @override
  late final GeneratedColumn<bool> visible = GeneratedColumn<bool>(
    'visible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("visible" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, visible];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routines';
  @override
  VerificationContext validateIntegrity(
    Insertable<Routine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('visible')) {
      context.handle(
        _visibleMeta,
        visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Routine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Routine(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      visible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}visible'],
      )!,
    );
  }

  @override
  $RoutinesTable createAlias(String alias) {
    return $RoutinesTable(attachedDatabase, alias);
  }
}

class Routine extends DataClass implements Insertable<Routine> {
  final String id;
  final String name;
  final String? description;
  final bool visible;
  const Routine({
    required this.id,
    required this.name,
    this.description,
    required this.visible,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['visible'] = Variable<bool>(visible);
    return map;
  }

  RoutinesCompanion toCompanion(bool nullToAbsent) {
    return RoutinesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      visible: Value(visible),
    );
  }

  factory Routine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Routine(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      visible: serializer.fromJson<bool>(json['visible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'visible': serializer.toJson<bool>(visible),
    };
  }

  Routine copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? visible,
  }) => Routine(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    visible: visible ?? this.visible,
  );
  Routine copyWithCompanion(RoutinesCompanion data) {
    return Routine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      visible: data.visible.present ? data.visible.value : this.visible,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Routine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('visible: $visible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, visible);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Routine &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.visible == this.visible);
}

class RoutinesCompanion extends UpdateCompanion<Routine> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> visible;
  final Value<int> rowid;
  const RoutinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.visible = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutinesCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.visible = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Routine> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? visible,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (visible != null) 'visible': visible,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutinesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? visible,
    Value<int>? rowid,
  }) {
    return RoutinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      visible: visible ?? this.visible,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('visible: $visible, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servingsMeta = const VerificationMeta(
    'servings',
  );
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
    'servings',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ingredientsJsonMeta = const VerificationMeta(
    'ingredientsJson',
  );
  @override
  late final GeneratedColumn<String> ingredientsJson = GeneratedColumn<String>(
    'ingredients_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepsJsonMeta = const VerificationMeta(
    'stepsJson',
  );
  @override
  late final GeneratedColumn<String> stepsJson = GeneratedColumn<String>(
    'steps_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nutritionJsonMeta = const VerificationMeta(
    'nutritionJson',
  );
  @override
  late final GeneratedColumn<String> nutritionJson = GeneratedColumn<String>(
    'nutrition_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationJsonMeta = const VerificationMeta(
    'durationJson',
  );
  @override
  late final GeneratedColumn<String> durationJson = GeneratedColumn<String>(
    'duration_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    imagePath,
    servings,
    ingredientsJson,
    stepsJson,
    nutritionJson,
    durationJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Recipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('servings')) {
      context.handle(
        _servingsMeta,
        servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta),
      );
    } else if (isInserting) {
      context.missing(_servingsMeta);
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
        _ingredientsJsonMeta,
        ingredientsJson.isAcceptableOrUnknown(
          data['ingredients_json']!,
          _ingredientsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientsJsonMeta);
    }
    if (data.containsKey('steps_json')) {
      context.handle(
        _stepsJsonMeta,
        stepsJson.isAcceptableOrUnknown(data['steps_json']!, _stepsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_stepsJsonMeta);
    }
    if (data.containsKey('nutrition_json')) {
      context.handle(
        _nutritionJsonMeta,
        nutritionJson.isAcceptableOrUnknown(
          data['nutrition_json']!,
          _nutritionJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nutritionJsonMeta);
    }
    if (data.containsKey('duration_json')) {
      context.handle(
        _durationJsonMeta,
        durationJson.isAcceptableOrUnknown(
          data['duration_json']!,
          _durationJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      servings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}servings'],
      )!,
      ingredientsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients_json'],
      )!,
      stepsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}steps_json'],
      )!,
      nutritionJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nutrition_json'],
      )!,
      durationJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}duration_json'],
      )!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final int servings;
  final String ingredientsJson;
  final String stepsJson;
  final String nutritionJson;
  final String durationJson;
  const Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.servings,
    required this.ingredientsJson,
    required this.stepsJson,
    required this.nutritionJson,
    required this.durationJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['image_path'] = Variable<String>(imagePath);
    map['servings'] = Variable<int>(servings);
    map['ingredients_json'] = Variable<String>(ingredientsJson);
    map['steps_json'] = Variable<String>(stepsJson);
    map['nutrition_json'] = Variable<String>(nutritionJson);
    map['duration_json'] = Variable<String>(durationJson);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      imagePath: Value(imagePath),
      servings: Value(servings),
      ingredientsJson: Value(ingredientsJson),
      stepsJson: Value(stepsJson),
      nutritionJson: Value(nutritionJson),
      durationJson: Value(durationJson),
    );
  }

  factory Recipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      servings: serializer.fromJson<int>(json['servings']),
      ingredientsJson: serializer.fromJson<String>(json['ingredientsJson']),
      stepsJson: serializer.fromJson<String>(json['stepsJson']),
      nutritionJson: serializer.fromJson<String>(json['nutritionJson']),
      durationJson: serializer.fromJson<String>(json['durationJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'imagePath': serializer.toJson<String>(imagePath),
      'servings': serializer.toJson<int>(servings),
      'ingredientsJson': serializer.toJson<String>(ingredientsJson),
      'stepsJson': serializer.toJson<String>(stepsJson),
      'nutritionJson': serializer.toJson<String>(nutritionJson),
      'durationJson': serializer.toJson<String>(durationJson),
    };
  }

  Recipe copyWith({
    String? id,
    String? name,
    String? description,
    String? imagePath,
    int? servings,
    String? ingredientsJson,
    String? stepsJson,
    String? nutritionJson,
    String? durationJson,
  }) => Recipe(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    imagePath: imagePath ?? this.imagePath,
    servings: servings ?? this.servings,
    ingredientsJson: ingredientsJson ?? this.ingredientsJson,
    stepsJson: stepsJson ?? this.stepsJson,
    nutritionJson: nutritionJson ?? this.nutritionJson,
    durationJson: durationJson ?? this.durationJson,
  );
  Recipe copyWithCompanion(RecipesCompanion data) {
    return Recipe(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      servings: data.servings.present ? data.servings.value : this.servings,
      ingredientsJson: data.ingredientsJson.present
          ? data.ingredientsJson.value
          : this.ingredientsJson,
      stepsJson: data.stepsJson.present ? data.stepsJson.value : this.stepsJson,
      nutritionJson: data.nutritionJson.present
          ? data.nutritionJson.value
          : this.nutritionJson,
      durationJson: data.durationJson.present
          ? data.durationJson.value
          : this.durationJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('servings: $servings, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('stepsJson: $stepsJson, ')
          ..write('nutritionJson: $nutritionJson, ')
          ..write('durationJson: $durationJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    imagePath,
    servings,
    ingredientsJson,
    stepsJson,
    nutritionJson,
    durationJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imagePath == this.imagePath &&
          other.servings == this.servings &&
          other.ingredientsJson == this.ingredientsJson &&
          other.stepsJson == this.stepsJson &&
          other.nutritionJson == this.nutritionJson &&
          other.durationJson == this.durationJson);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> imagePath;
  final Value<int> servings;
  final Value<String> ingredientsJson;
  final Value<String> stepsJson;
  final Value<String> nutritionJson;
  final Value<String> durationJson;
  final Value<int> rowid;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.servings = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.stepsJson = const Value.absent(),
    this.nutritionJson = const Value.absent(),
    this.durationJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipesCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String imagePath,
    required int servings,
    required String ingredientsJson,
    required String stepsJson,
    required String nutritionJson,
    required String durationJson,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       imagePath = Value(imagePath),
       servings = Value(servings),
       ingredientsJson = Value(ingredientsJson),
       stepsJson = Value(stepsJson),
       nutritionJson = Value(nutritionJson),
       durationJson = Value(durationJson);
  static Insertable<Recipe> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? imagePath,
    Expression<int>? servings,
    Expression<String>? ingredientsJson,
    Expression<String>? stepsJson,
    Expression<String>? nutritionJson,
    Expression<String>? durationJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imagePath != null) 'image_path': imagePath,
      if (servings != null) 'servings': servings,
      if (ingredientsJson != null) 'ingredients_json': ingredientsJson,
      if (stepsJson != null) 'steps_json': stepsJson,
      if (nutritionJson != null) 'nutrition_json': nutritionJson,
      if (durationJson != null) 'duration_json': durationJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? imagePath,
    Value<int>? servings,
    Value<String>? ingredientsJson,
    Value<String>? stepsJson,
    Value<String>? nutritionJson,
    Value<String>? durationJson,
    Value<int>? rowid,
  }) {
    return RecipesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      servings: servings ?? this.servings,
      ingredientsJson: ingredientsJson ?? this.ingredientsJson,
      stepsJson: stepsJson ?? this.stepsJson,
      nutritionJson: nutritionJson ?? this.nutritionJson,
      durationJson: durationJson ?? this.durationJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (ingredientsJson.present) {
      map['ingredients_json'] = Variable<String>(ingredientsJson.value);
    }
    if (stepsJson.present) {
      map['steps_json'] = Variable<String>(stepsJson.value);
    }
    if (nutritionJson.present) {
      map['nutrition_json'] = Variable<String>(nutritionJson.value);
    }
    if (durationJson.present) {
      map['duration_json'] = Variable<String>(durationJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('servings: $servings, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('stepsJson: $stepsJson, ')
          ..write('nutritionJson: $nutritionJson, ')
          ..write('durationJson: $durationJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tag};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String tag;
  const Tag({required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tag'] = Variable<String>(tag);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(tag: Value(tag));
  }

  factory Tag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(tag: serializer.fromJson<String>(json['tag']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'tag': serializer.toJson<String>(tag)};
  }

  Tag copyWith({String? tag}) => Tag(tag: tag ?? this.tag);
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(tag: data.tag.present ? data.tag.value : this.tag);
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => tag.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Tag && other.tag == this.tag);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> tag;
  final Value<int> rowid;
  const TagsCompanion({
    this.tag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({required String tag, this.rowid = const Value.absent()})
    : tag = Value(tag);
  static Insertable<Tag> custom({
    Expression<String>? tag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tag != null) 'tag': tag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith({Value<String>? tag, Value<int>? rowid}) {
    return TagsCompanion(tag: tag ?? this.tag, rowid: rowid ?? this.rowid);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('tag: $tag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeTagsTable extends RecipeTags
    with TableInfo<$RecipeTagsTable, RecipeTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [recipeId, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeId, tag};
  @override
  RecipeTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeTag(
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
    );
  }

  @override
  $RecipeTagsTable createAlias(String alias) {
    return $RecipeTagsTable(attachedDatabase, alias);
  }
}

class RecipeTag extends DataClass implements Insertable<RecipeTag> {
  final String recipeId;
  final String tag;
  const RecipeTag({required this.recipeId, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_id'] = Variable<String>(recipeId);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  RecipeTagsCompanion toCompanion(bool nullToAbsent) {
    return RecipeTagsCompanion(recipeId: Value(recipeId), tag: Value(tag));
  }

  factory RecipeTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeTag(
      recipeId: serializer.fromJson<String>(json['recipeId']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeId': serializer.toJson<String>(recipeId),
      'tag': serializer.toJson<String>(tag),
    };
  }

  RecipeTag copyWith({String? recipeId, String? tag}) =>
      RecipeTag(recipeId: recipeId ?? this.recipeId, tag: tag ?? this.tag);
  RecipeTag copyWithCompanion(RecipeTagsCompanion data) {
    return RecipeTag(
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTag(')
          ..write('recipeId: $recipeId, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeId, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTag &&
          other.recipeId == this.recipeId &&
          other.tag == this.tag);
}

class RecipeTagsCompanion extends UpdateCompanion<RecipeTag> {
  final Value<String> recipeId;
  final Value<String> tag;
  final Value<int> rowid;
  const RecipeTagsCompanion({
    this.recipeId = const Value.absent(),
    this.tag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeTagsCompanion.insert({
    required String recipeId,
    required String tag,
    this.rowid = const Value.absent(),
  }) : recipeId = Value(recipeId),
       tag = Value(tag);
  static Insertable<RecipeTag> custom({
    Expression<String>? recipeId,
    Expression<String>? tag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeId != null) 'recipe_id': recipeId,
      if (tag != null) 'tag': tag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeTagsCompanion copyWith({
    Value<String>? recipeId,
    Value<String>? tag,
    Value<int>? rowid,
  }) {
    return RecipeTagsCompanion(
      recipeId: recipeId ?? this.recipeId,
      tag: tag ?? this.tag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTagsCompanion(')
          ..write('recipeId: $recipeId, ')
          ..write('tag: $tag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FoodTrackingsTable extends FoodTrackings
    with TableInfo<$FoodTrackingsTable, FoodTracking> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodTrackingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nutritionJsonMeta = const VerificationMeta(
    'nutritionJson',
  );
  @override
  late final GeneratedColumn<String> nutritionJson = GeneratedColumn<String>(
    'nutrition_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<int> source = GeneratedColumn<int>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceIdMeta = const VerificationMeta(
    'referenceId',
  );
  @override
  late final GeneratedColumn<String> referenceId = GeneratedColumn<String>(
    'reference_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trackedAtMeta = const VerificationMeta(
    'trackedAt',
  );
  @override
  late final GeneratedColumn<DateTime> trackedAt = GeneratedColumn<DateTime>(
    'tracked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    nutritionJson,
    quantity,
    source,
    referenceId,
    trackedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_trackings';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoodTracking> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nutrition_json')) {
      context.handle(
        _nutritionJsonMeta,
        nutritionJson.isAcceptableOrUnknown(
          data['nutrition_json']!,
          _nutritionJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nutritionJsonMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('reference_id')) {
      context.handle(
        _referenceIdMeta,
        referenceId.isAcceptableOrUnknown(
          data['reference_id']!,
          _referenceIdMeta,
        ),
      );
    }
    if (data.containsKey('tracked_at')) {
      context.handle(
        _trackedAtMeta,
        trackedAt.isAcceptableOrUnknown(data['tracked_at']!, _trackedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_trackedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodTracking map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodTracking(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nutritionJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nutrition_json'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source'],
      )!,
      referenceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_id'],
      ),
      trackedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tracked_at'],
      )!,
    );
  }

  @override
  $FoodTrackingsTable createAlias(String alias) {
    return $FoodTrackingsTable(attachedDatabase, alias);
  }
}

class FoodTracking extends DataClass implements Insertable<FoodTracking> {
  /// Unique ID for this food tracking entry.
  final String id;

  /// The display name of the tracked food.
  final String name;

  /// Nutrition info is stored as a JSON string, matching NutritionEntity spec. Use mappers for (de)serialization.
  final String nutritionJson;

  /// The amount in the unit below (see documentation of NutritionEntity's base quantity unit).
  final double quantity;

  /// The source: 0=recipe, 1=manual, 2=product, 3=generic
  final int source;

  /// The reference id (recipe/product/generic id). Allow null for manual entries. Uuid or server id.
  final String? referenceId;

  /// The timestamp when this food was tracked.
  final DateTime trackedAt;
  const FoodTracking({
    required this.id,
    required this.name,
    required this.nutritionJson,
    required this.quantity,
    required this.source,
    this.referenceId,
    required this.trackedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['nutrition_json'] = Variable<String>(nutritionJson);
    map['quantity'] = Variable<double>(quantity);
    map['source'] = Variable<int>(source);
    if (!nullToAbsent || referenceId != null) {
      map['reference_id'] = Variable<String>(referenceId);
    }
    map['tracked_at'] = Variable<DateTime>(trackedAt);
    return map;
  }

  FoodTrackingsCompanion toCompanion(bool nullToAbsent) {
    return FoodTrackingsCompanion(
      id: Value(id),
      name: Value(name),
      nutritionJson: Value(nutritionJson),
      quantity: Value(quantity),
      source: Value(source),
      referenceId: referenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceId),
      trackedAt: Value(trackedAt),
    );
  }

  factory FoodTracking.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodTracking(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nutritionJson: serializer.fromJson<String>(json['nutritionJson']),
      quantity: serializer.fromJson<double>(json['quantity']),
      source: serializer.fromJson<int>(json['source']),
      referenceId: serializer.fromJson<String?>(json['referenceId']),
      trackedAt: serializer.fromJson<DateTime>(json['trackedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nutritionJson': serializer.toJson<String>(nutritionJson),
      'quantity': serializer.toJson<double>(quantity),
      'source': serializer.toJson<int>(source),
      'referenceId': serializer.toJson<String?>(referenceId),
      'trackedAt': serializer.toJson<DateTime>(trackedAt),
    };
  }

  FoodTracking copyWith({
    String? id,
    String? name,
    String? nutritionJson,
    double? quantity,
    int? source,
    Value<String?> referenceId = const Value.absent(),
    DateTime? trackedAt,
  }) => FoodTracking(
    id: id ?? this.id,
    name: name ?? this.name,
    nutritionJson: nutritionJson ?? this.nutritionJson,
    quantity: quantity ?? this.quantity,
    source: source ?? this.source,
    referenceId: referenceId.present ? referenceId.value : this.referenceId,
    trackedAt: trackedAt ?? this.trackedAt,
  );
  FoodTracking copyWithCompanion(FoodTrackingsCompanion data) {
    return FoodTracking(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nutritionJson: data.nutritionJson.present
          ? data.nutritionJson.value
          : this.nutritionJson,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      source: data.source.present ? data.source.value : this.source,
      referenceId: data.referenceId.present
          ? data.referenceId.value
          : this.referenceId,
      trackedAt: data.trackedAt.present ? data.trackedAt.value : this.trackedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodTracking(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nutritionJson: $nutritionJson, ')
          ..write('quantity: $quantity, ')
          ..write('source: $source, ')
          ..write('referenceId: $referenceId, ')
          ..write('trackedAt: $trackedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    nutritionJson,
    quantity,
    source,
    referenceId,
    trackedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodTracking &&
          other.id == this.id &&
          other.name == this.name &&
          other.nutritionJson == this.nutritionJson &&
          other.quantity == this.quantity &&
          other.source == this.source &&
          other.referenceId == this.referenceId &&
          other.trackedAt == this.trackedAt);
}

class FoodTrackingsCompanion extends UpdateCompanion<FoodTracking> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nutritionJson;
  final Value<double> quantity;
  final Value<int> source;
  final Value<String?> referenceId;
  final Value<DateTime> trackedAt;
  final Value<int> rowid;
  const FoodTrackingsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nutritionJson = const Value.absent(),
    this.quantity = const Value.absent(),
    this.source = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.trackedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoodTrackingsCompanion.insert({
    required String id,
    required String name,
    required String nutritionJson,
    required double quantity,
    required int source,
    this.referenceId = const Value.absent(),
    required DateTime trackedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       nutritionJson = Value(nutritionJson),
       quantity = Value(quantity),
       source = Value(source),
       trackedAt = Value(trackedAt);
  static Insertable<FoodTracking> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nutritionJson,
    Expression<double>? quantity,
    Expression<int>? source,
    Expression<String>? referenceId,
    Expression<DateTime>? trackedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nutritionJson != null) 'nutrition_json': nutritionJson,
      if (quantity != null) 'quantity': quantity,
      if (source != null) 'source': source,
      if (referenceId != null) 'reference_id': referenceId,
      if (trackedAt != null) 'tracked_at': trackedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoodTrackingsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? nutritionJson,
    Value<double>? quantity,
    Value<int>? source,
    Value<String?>? referenceId,
    Value<DateTime>? trackedAt,
    Value<int>? rowid,
  }) {
    return FoodTrackingsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nutritionJson: nutritionJson ?? this.nutritionJson,
      quantity: quantity ?? this.quantity,
      source: source ?? this.source,
      referenceId: referenceId ?? this.referenceId,
      trackedAt: trackedAt ?? this.trackedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nutritionJson.present) {
      map['nutrition_json'] = Variable<String>(nutritionJson.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(source.value);
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<String>(referenceId.value);
    }
    if (trackedAt.present) {
      map['tracked_at'] = Variable<DateTime>(trackedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodTrackingsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nutritionJson: $nutritionJson, ')
          ..write('quantity: $quantity, ')
          ..write('source: $source, ')
          ..write('referenceId: $referenceId, ')
          ..write('trackedAt: $trackedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $JournalReflectionsTable journalReflections =
      $JournalReflectionsTable(this);
  late final $CommsCheckEntriesTable commsCheckEntries =
      $CommsCheckEntriesTable(this);
  late final $EmotionExplorerMapsTable emotionExplorerMaps =
      $EmotionExplorerMapsTable(this);
  late final $MeditationsTable meditations = $MeditationsTable(this);
  late final $RoutineMeditationsTable routineMeditations =
      $RoutineMeditationsTable(this);
  late final $RoutinesTable routines = $RoutinesTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $RecipeTagsTable recipeTags = $RecipeTagsTable(this);
  late final $FoodTrackingsTable foodTrackings = $FoodTrackingsTable(this);
  late final JournalDao journalDao = JournalDao(this as AppDatabase);
  late final JournalReflectionDao journalReflectionDao = JournalReflectionDao(
    this as AppDatabase,
  );
  late final CommsCheckDao commsCheckDao = CommsCheckDao(this as AppDatabase);
  late final EmotionExplorerMapDao emotionExplorerMapDao =
      EmotionExplorerMapDao(this as AppDatabase);
  late final MeditationDao meditationDao = MeditationDao(this as AppDatabase);
  late final RoutineDao routineDao = RoutineDao(this as AppDatabase);
  late final FoodTrackingDao foodTrackingDao = FoodTrackingDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    journalEntries,
    journalReflections,
    commsCheckEntries,
    emotionExplorerMaps,
    meditations,
    routineMeditations,
    routines,
    recipes,
    tags,
    recipeTags,
    foodTrackings,
  ];
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

final class $$JournalEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry> {
  $$JournalEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$JournalReflectionsTable, List<JournalReflection>>
  _journalReflectionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.journalReflections,
        aliasName: $_aliasNameGenerator(
          db.journalEntries.id,
          db.journalReflections.journalEntryId,
        ),
      );

  $$JournalReflectionsTableProcessedTableManager get journalReflectionsRefs {
    final manager = $$JournalReflectionsTableTableManager(
      $_db,
      $_db.journalReflections,
    ).filter((f) => f.journalEntryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _journalReflectionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> journalReflectionsRefs(
    Expression<bool> Function($$JournalReflectionsTableFilterComposer f) f,
  ) {
    final $$JournalReflectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalReflections,
      getReferencedColumn: (t) => t.journalEntryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalReflectionsTableFilterComposer(
            $db: $db,
            $table: $db.journalReflections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> journalReflectionsRefs<T extends Object>(
    Expression<T> Function($$JournalReflectionsTableAnnotationComposer a) f,
  ) {
    final $$JournalReflectionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.journalReflections,
          getReferencedColumn: (t) => t.journalEntryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$JournalReflectionsTableAnnotationComposer(
                $db: $db,
                $table: $db.journalReflections,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
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
          (JournalEntry, $$JournalEntriesTableReferences),
          JournalEntry,
          PrefetchHooks Function({bool journalReflectionsRefs})
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
              .map(
                (e) => (
                  e.readTable(table),
                  $$JournalEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({journalReflectionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (journalReflectionsRefs) db.journalReflections,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (journalReflectionsRefs)
                    await $_getPrefetchedData<
                      JournalEntry,
                      $JournalEntriesTable,
                      JournalReflection
                    >(
                      currentTable: table,
                      referencedTable: $$JournalEntriesTableReferences
                          ._journalReflectionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$JournalEntriesTableReferences(
                            db,
                            table,
                            p0,
                          ).journalReflectionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.journalEntryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (JournalEntry, $$JournalEntriesTableReferences),
      JournalEntry,
      PrefetchHooks Function({bool journalReflectionsRefs})
    >;
typedef $$JournalReflectionsTableCreateCompanionBuilder =
    JournalReflectionsCompanion Function({
      required String id,
      Value<String?> guessedEmotionLevel1,
      Value<String?> guessedEmotionLevel2,
      Value<String?> guessedEmotionLevel3,
      Value<String?> currentEmotionLevel1,
      Value<String?> currentEmotionLevel2,
      Value<String?> currentEmotionLevel3,
      required String reflection,
      required String journalEntryId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$JournalReflectionsTableUpdateCompanionBuilder =
    JournalReflectionsCompanion Function({
      Value<String> id,
      Value<String?> guessedEmotionLevel1,
      Value<String?> guessedEmotionLevel2,
      Value<String?> guessedEmotionLevel3,
      Value<String?> currentEmotionLevel1,
      Value<String?> currentEmotionLevel2,
      Value<String?> currentEmotionLevel3,
      Value<String> reflection,
      Value<String> journalEntryId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$JournalReflectionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $JournalReflectionsTable,
          JournalReflection
        > {
  $$JournalReflectionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $JournalEntriesTable _journalEntryIdTable(_$AppDatabase db) =>
      db.journalEntries.createAlias(
        $_aliasNameGenerator(
          db.journalReflections.journalEntryId,
          db.journalEntries.id,
        ),
      );

  $$JournalEntriesTableProcessedTableManager get journalEntryId {
    final $_column = $_itemColumn<String>('journal_entry_id')!;

    final manager = $$JournalEntriesTableTableManager(
      $_db,
      $_db.journalEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_journalEntryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$JournalReflectionsTableFilterComposer
    extends Composer<_$AppDatabase, $JournalReflectionsTable> {
  $$JournalReflectionsTableFilterComposer({
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

  ColumnFilters<String> get guessedEmotionLevel1 => $composableBuilder(
    column: $table.guessedEmotionLevel1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guessedEmotionLevel2 => $composableBuilder(
    column: $table.guessedEmotionLevel2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guessedEmotionLevel3 => $composableBuilder(
    column: $table.guessedEmotionLevel3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentEmotionLevel1 => $composableBuilder(
    column: $table.currentEmotionLevel1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentEmotionLevel2 => $composableBuilder(
    column: $table.currentEmotionLevel2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentEmotionLevel3 => $composableBuilder(
    column: $table.currentEmotionLevel3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reflection => $composableBuilder(
    column: $table.reflection,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$JournalEntriesTableFilterComposer get journalEntryId {
    final $$JournalEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalEntryId,
      referencedTable: $db.journalEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalEntriesTableFilterComposer(
            $db: $db,
            $table: $db.journalEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalReflectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalReflectionsTable> {
  $$JournalReflectionsTableOrderingComposer({
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

  ColumnOrderings<String> get guessedEmotionLevel1 => $composableBuilder(
    column: $table.guessedEmotionLevel1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guessedEmotionLevel2 => $composableBuilder(
    column: $table.guessedEmotionLevel2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guessedEmotionLevel3 => $composableBuilder(
    column: $table.guessedEmotionLevel3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentEmotionLevel1 => $composableBuilder(
    column: $table.currentEmotionLevel1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentEmotionLevel2 => $composableBuilder(
    column: $table.currentEmotionLevel2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentEmotionLevel3 => $composableBuilder(
    column: $table.currentEmotionLevel3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reflection => $composableBuilder(
    column: $table.reflection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$JournalEntriesTableOrderingComposer get journalEntryId {
    final $$JournalEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalEntryId,
      referencedTable: $db.journalEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.journalEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalReflectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalReflectionsTable> {
  $$JournalReflectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get guessedEmotionLevel1 => $composableBuilder(
    column: $table.guessedEmotionLevel1,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guessedEmotionLevel2 => $composableBuilder(
    column: $table.guessedEmotionLevel2,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guessedEmotionLevel3 => $composableBuilder(
    column: $table.guessedEmotionLevel3,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentEmotionLevel1 => $composableBuilder(
    column: $table.currentEmotionLevel1,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentEmotionLevel2 => $composableBuilder(
    column: $table.currentEmotionLevel2,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentEmotionLevel3 => $composableBuilder(
    column: $table.currentEmotionLevel3,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reflection => $composableBuilder(
    column: $table.reflection,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$JournalEntriesTableAnnotationComposer get journalEntryId {
    final $$JournalEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.journalEntryId,
      referencedTable: $db.journalEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.journalEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalReflectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalReflectionsTable,
          JournalReflection,
          $$JournalReflectionsTableFilterComposer,
          $$JournalReflectionsTableOrderingComposer,
          $$JournalReflectionsTableAnnotationComposer,
          $$JournalReflectionsTableCreateCompanionBuilder,
          $$JournalReflectionsTableUpdateCompanionBuilder,
          (JournalReflection, $$JournalReflectionsTableReferences),
          JournalReflection,
          PrefetchHooks Function({bool journalEntryId})
        > {
  $$JournalReflectionsTableTableManager(
    _$AppDatabase db,
    $JournalReflectionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalReflectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalReflectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalReflectionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> guessedEmotionLevel1 = const Value.absent(),
                Value<String?> guessedEmotionLevel2 = const Value.absent(),
                Value<String?> guessedEmotionLevel3 = const Value.absent(),
                Value<String?> currentEmotionLevel1 = const Value.absent(),
                Value<String?> currentEmotionLevel2 = const Value.absent(),
                Value<String?> currentEmotionLevel3 = const Value.absent(),
                Value<String> reflection = const Value.absent(),
                Value<String> journalEntryId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalReflectionsCompanion(
                id: id,
                guessedEmotionLevel1: guessedEmotionLevel1,
                guessedEmotionLevel2: guessedEmotionLevel2,
                guessedEmotionLevel3: guessedEmotionLevel3,
                currentEmotionLevel1: currentEmotionLevel1,
                currentEmotionLevel2: currentEmotionLevel2,
                currentEmotionLevel3: currentEmotionLevel3,
                reflection: reflection,
                journalEntryId: journalEntryId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> guessedEmotionLevel1 = const Value.absent(),
                Value<String?> guessedEmotionLevel2 = const Value.absent(),
                Value<String?> guessedEmotionLevel3 = const Value.absent(),
                Value<String?> currentEmotionLevel1 = const Value.absent(),
                Value<String?> currentEmotionLevel2 = const Value.absent(),
                Value<String?> currentEmotionLevel3 = const Value.absent(),
                required String reflection,
                required String journalEntryId,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => JournalReflectionsCompanion.insert(
                id: id,
                guessedEmotionLevel1: guessedEmotionLevel1,
                guessedEmotionLevel2: guessedEmotionLevel2,
                guessedEmotionLevel3: guessedEmotionLevel3,
                currentEmotionLevel1: currentEmotionLevel1,
                currentEmotionLevel2: currentEmotionLevel2,
                currentEmotionLevel3: currentEmotionLevel3,
                reflection: reflection,
                journalEntryId: journalEntryId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$JournalReflectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({journalEntryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (journalEntryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.journalEntryId,
                                referencedTable:
                                    $$JournalReflectionsTableReferences
                                        ._journalEntryIdTable(db),
                                referencedColumn:
                                    $$JournalReflectionsTableReferences
                                        ._journalEntryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$JournalReflectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalReflectionsTable,
      JournalReflection,
      $$JournalReflectionsTableFilterComposer,
      $$JournalReflectionsTableOrderingComposer,
      $$JournalReflectionsTableAnnotationComposer,
      $$JournalReflectionsTableCreateCompanionBuilder,
      $$JournalReflectionsTableUpdateCompanionBuilder,
      (JournalReflection, $$JournalReflectionsTableReferences),
      JournalReflection,
      PrefetchHooks Function({bool journalEntryId})
    >;
typedef $$CommsCheckEntriesTableCreateCompanionBuilder =
    CommsCheckEntriesCompanion Function({
      required String id,
      required String targetInfos,
      required String message,
      Value<String?> feelingLevel1Id,
      Value<String?> feelingLevel2Id,
      Value<String?> feelingLevel3Id,
      required String expectedReaction,
      required String wantedReaction,
      required String responseAfterReaction,
      required String reflection,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CommsCheckEntriesTableUpdateCompanionBuilder =
    CommsCheckEntriesCompanion Function({
      Value<String> id,
      Value<String> targetInfos,
      Value<String> message,
      Value<String?> feelingLevel1Id,
      Value<String?> feelingLevel2Id,
      Value<String?> feelingLevel3Id,
      Value<String> expectedReaction,
      Value<String> wantedReaction,
      Value<String> responseAfterReaction,
      Value<String> reflection,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CommsCheckEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CommsCheckEntriesTable> {
  $$CommsCheckEntriesTableFilterComposer({
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

  ColumnFilters<String> get targetInfos => $composableBuilder(
    column: $table.targetInfos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feelingLevel1Id => $composableBuilder(
    column: $table.feelingLevel1Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feelingLevel2Id => $composableBuilder(
    column: $table.feelingLevel2Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feelingLevel3Id => $composableBuilder(
    column: $table.feelingLevel3Id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expectedReaction => $composableBuilder(
    column: $table.expectedReaction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wantedReaction => $composableBuilder(
    column: $table.wantedReaction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseAfterReaction => $composableBuilder(
    column: $table.responseAfterReaction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reflection => $composableBuilder(
    column: $table.reflection,
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

class $$CommsCheckEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CommsCheckEntriesTable> {
  $$CommsCheckEntriesTableOrderingComposer({
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

  ColumnOrderings<String> get targetInfos => $composableBuilder(
    column: $table.targetInfos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feelingLevel1Id => $composableBuilder(
    column: $table.feelingLevel1Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feelingLevel2Id => $composableBuilder(
    column: $table.feelingLevel2Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feelingLevel3Id => $composableBuilder(
    column: $table.feelingLevel3Id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expectedReaction => $composableBuilder(
    column: $table.expectedReaction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wantedReaction => $composableBuilder(
    column: $table.wantedReaction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseAfterReaction => $composableBuilder(
    column: $table.responseAfterReaction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reflection => $composableBuilder(
    column: $table.reflection,
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

class $$CommsCheckEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommsCheckEntriesTable> {
  $$CommsCheckEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get targetInfos => $composableBuilder(
    column: $table.targetInfos,
    builder: (column) => column,
  );

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get feelingLevel1Id => $composableBuilder(
    column: $table.feelingLevel1Id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get feelingLevel2Id => $composableBuilder(
    column: $table.feelingLevel2Id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get feelingLevel3Id => $composableBuilder(
    column: $table.feelingLevel3Id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expectedReaction => $composableBuilder(
    column: $table.expectedReaction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wantedReaction => $composableBuilder(
    column: $table.wantedReaction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get responseAfterReaction => $composableBuilder(
    column: $table.responseAfterReaction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reflection => $composableBuilder(
    column: $table.reflection,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CommsCheckEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommsCheckEntriesTable,
          CommsCheckEntry,
          $$CommsCheckEntriesTableFilterComposer,
          $$CommsCheckEntriesTableOrderingComposer,
          $$CommsCheckEntriesTableAnnotationComposer,
          $$CommsCheckEntriesTableCreateCompanionBuilder,
          $$CommsCheckEntriesTableUpdateCompanionBuilder,
          (
            CommsCheckEntry,
            BaseReferences<
              _$AppDatabase,
              $CommsCheckEntriesTable,
              CommsCheckEntry
            >,
          ),
          CommsCheckEntry,
          PrefetchHooks Function()
        > {
  $$CommsCheckEntriesTableTableManager(
    _$AppDatabase db,
    $CommsCheckEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommsCheckEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommsCheckEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommsCheckEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> targetInfos = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String?> feelingLevel1Id = const Value.absent(),
                Value<String?> feelingLevel2Id = const Value.absent(),
                Value<String?> feelingLevel3Id = const Value.absent(),
                Value<String> expectedReaction = const Value.absent(),
                Value<String> wantedReaction = const Value.absent(),
                Value<String> responseAfterReaction = const Value.absent(),
                Value<String> reflection = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CommsCheckEntriesCompanion(
                id: id,
                targetInfos: targetInfos,
                message: message,
                feelingLevel1Id: feelingLevel1Id,
                feelingLevel2Id: feelingLevel2Id,
                feelingLevel3Id: feelingLevel3Id,
                expectedReaction: expectedReaction,
                wantedReaction: wantedReaction,
                responseAfterReaction: responseAfterReaction,
                reflection: reflection,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String targetInfos,
                required String message,
                Value<String?> feelingLevel1Id = const Value.absent(),
                Value<String?> feelingLevel2Id = const Value.absent(),
                Value<String?> feelingLevel3Id = const Value.absent(),
                required String expectedReaction,
                required String wantedReaction,
                required String responseAfterReaction,
                required String reflection,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CommsCheckEntriesCompanion.insert(
                id: id,
                targetInfos: targetInfos,
                message: message,
                feelingLevel1Id: feelingLevel1Id,
                feelingLevel2Id: feelingLevel2Id,
                feelingLevel3Id: feelingLevel3Id,
                expectedReaction: expectedReaction,
                wantedReaction: wantedReaction,
                responseAfterReaction: responseAfterReaction,
                reflection: reflection,
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

typedef $$CommsCheckEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommsCheckEntriesTable,
      CommsCheckEntry,
      $$CommsCheckEntriesTableFilterComposer,
      $$CommsCheckEntriesTableOrderingComposer,
      $$CommsCheckEntriesTableAnnotationComposer,
      $$CommsCheckEntriesTableCreateCompanionBuilder,
      $$CommsCheckEntriesTableUpdateCompanionBuilder,
      (
        CommsCheckEntry,
        BaseReferences<_$AppDatabase, $CommsCheckEntriesTable, CommsCheckEntry>,
      ),
      CommsCheckEntry,
      PrefetchHooks Function()
    >;
typedef $$EmotionExplorerMapsTableCreateCompanionBuilder =
    EmotionExplorerMapsCompanion Function({
      Value<int> id,
      required String data,
    });
typedef $$EmotionExplorerMapsTableUpdateCompanionBuilder =
    EmotionExplorerMapsCompanion Function({Value<int> id, Value<String> data});

class $$EmotionExplorerMapsTableFilterComposer
    extends Composer<_$AppDatabase, $EmotionExplorerMapsTable> {
  $$EmotionExplorerMapsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EmotionExplorerMapsTableOrderingComposer
    extends Composer<_$AppDatabase, $EmotionExplorerMapsTable> {
  $$EmotionExplorerMapsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmotionExplorerMapsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmotionExplorerMapsTable> {
  $$EmotionExplorerMapsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);
}

class $$EmotionExplorerMapsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmotionExplorerMapsTable,
          EmotionExplorerMap,
          $$EmotionExplorerMapsTableFilterComposer,
          $$EmotionExplorerMapsTableOrderingComposer,
          $$EmotionExplorerMapsTableAnnotationComposer,
          $$EmotionExplorerMapsTableCreateCompanionBuilder,
          $$EmotionExplorerMapsTableUpdateCompanionBuilder,
          (
            EmotionExplorerMap,
            BaseReferences<
              _$AppDatabase,
              $EmotionExplorerMapsTable,
              EmotionExplorerMap
            >,
          ),
          EmotionExplorerMap,
          PrefetchHooks Function()
        > {
  $$EmotionExplorerMapsTableTableManager(
    _$AppDatabase db,
    $EmotionExplorerMapsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmotionExplorerMapsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmotionExplorerMapsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EmotionExplorerMapsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> data = const Value.absent(),
              }) => EmotionExplorerMapsCompanion(id: id, data: data),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String data}) =>
                  EmotionExplorerMapsCompanion.insert(id: id, data: data),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EmotionExplorerMapsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmotionExplorerMapsTable,
      EmotionExplorerMap,
      $$EmotionExplorerMapsTableFilterComposer,
      $$EmotionExplorerMapsTableOrderingComposer,
      $$EmotionExplorerMapsTableAnnotationComposer,
      $$EmotionExplorerMapsTableCreateCompanionBuilder,
      $$EmotionExplorerMapsTableUpdateCompanionBuilder,
      (
        EmotionExplorerMap,
        BaseReferences<
          _$AppDatabase,
          $EmotionExplorerMapsTable,
          EmotionExplorerMap
        >,
      ),
      EmotionExplorerMap,
      PrefetchHooks Function()
    >;
typedef $$MeditationsTableCreateCompanionBuilder =
    MeditationsCompanion Function({
      required String id,
      required bool favorite,
      required String title,
      required String description,
      required String type,
      Value<String?> chakraType,
      required String cognitiveType,
      required String level,
      required String audioSections,
      Value<String?> tutorialVideoPath,
      Value<int> rowid,
    });
typedef $$MeditationsTableUpdateCompanionBuilder =
    MeditationsCompanion Function({
      Value<String> id,
      Value<bool> favorite,
      Value<String> title,
      Value<String> description,
      Value<String> type,
      Value<String?> chakraType,
      Value<String> cognitiveType,
      Value<String> level,
      Value<String> audioSections,
      Value<String?> tutorialVideoPath,
      Value<int> rowid,
    });

class $$MeditationsTableFilterComposer
    extends Composer<_$AppDatabase, $MeditationsTable> {
  $$MeditationsTableFilterComposer({
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

  ColumnFilters<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chakraType => $composableBuilder(
    column: $table.chakraType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cognitiveType => $composableBuilder(
    column: $table.cognitiveType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioSections => $composableBuilder(
    column: $table.audioSections,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tutorialVideoPath => $composableBuilder(
    column: $table.tutorialVideoPath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MeditationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MeditationsTable> {
  $$MeditationsTableOrderingComposer({
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

  ColumnOrderings<bool> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chakraType => $composableBuilder(
    column: $table.chakraType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cognitiveType => $composableBuilder(
    column: $table.cognitiveType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioSections => $composableBuilder(
    column: $table.audioSections,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tutorialVideoPath => $composableBuilder(
    column: $table.tutorialVideoPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MeditationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeditationsTable> {
  $$MeditationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get chakraType => $composableBuilder(
    column: $table.chakraType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cognitiveType => $composableBuilder(
    column: $table.cognitiveType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get audioSections => $composableBuilder(
    column: $table.audioSections,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tutorialVideoPath => $composableBuilder(
    column: $table.tutorialVideoPath,
    builder: (column) => column,
  );
}

class $$MeditationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MeditationsTable,
          Meditation,
          $$MeditationsTableFilterComposer,
          $$MeditationsTableOrderingComposer,
          $$MeditationsTableAnnotationComposer,
          $$MeditationsTableCreateCompanionBuilder,
          $$MeditationsTableUpdateCompanionBuilder,
          (
            Meditation,
            BaseReferences<_$AppDatabase, $MeditationsTable, Meditation>,
          ),
          Meditation,
          PrefetchHooks Function()
        > {
  $$MeditationsTableTableManager(_$AppDatabase db, $MeditationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeditationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeditationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeditationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<bool> favorite = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> chakraType = const Value.absent(),
                Value<String> cognitiveType = const Value.absent(),
                Value<String> level = const Value.absent(),
                Value<String> audioSections = const Value.absent(),
                Value<String?> tutorialVideoPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MeditationsCompanion(
                id: id,
                favorite: favorite,
                title: title,
                description: description,
                type: type,
                chakraType: chakraType,
                cognitiveType: cognitiveType,
                level: level,
                audioSections: audioSections,
                tutorialVideoPath: tutorialVideoPath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required bool favorite,
                required String title,
                required String description,
                required String type,
                Value<String?> chakraType = const Value.absent(),
                required String cognitiveType,
                required String level,
                required String audioSections,
                Value<String?> tutorialVideoPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MeditationsCompanion.insert(
                id: id,
                favorite: favorite,
                title: title,
                description: description,
                type: type,
                chakraType: chakraType,
                cognitiveType: cognitiveType,
                level: level,
                audioSections: audioSections,
                tutorialVideoPath: tutorialVideoPath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MeditationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MeditationsTable,
      Meditation,
      $$MeditationsTableFilterComposer,
      $$MeditationsTableOrderingComposer,
      $$MeditationsTableAnnotationComposer,
      $$MeditationsTableCreateCompanionBuilder,
      $$MeditationsTableUpdateCompanionBuilder,
      (
        Meditation,
        BaseReferences<_$AppDatabase, $MeditationsTable, Meditation>,
      ),
      Meditation,
      PrefetchHooks Function()
    >;
typedef $$RoutineMeditationsTableCreateCompanionBuilder =
    RoutineMeditationsCompanion Function({
      required String routineId,
      required String meditationId,
      required int orderIndex,
      Value<int> repetitions,
      Value<int> rowid,
    });
typedef $$RoutineMeditationsTableUpdateCompanionBuilder =
    RoutineMeditationsCompanion Function({
      Value<String> routineId,
      Value<String> meditationId,
      Value<int> orderIndex,
      Value<int> repetitions,
      Value<int> rowid,
    });

class $$RoutineMeditationsTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineMeditationsTable> {
  $$RoutineMeditationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get routineId => $composableBuilder(
    column: $table.routineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meditationId => $composableBuilder(
    column: $table.meditationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutineMeditationsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineMeditationsTable> {
  $$RoutineMeditationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get routineId => $composableBuilder(
    column: $table.routineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meditationId => $composableBuilder(
    column: $table.meditationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutineMeditationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineMeditationsTable> {
  $$RoutineMeditationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get routineId =>
      $composableBuilder(column: $table.routineId, builder: (column) => column);

  GeneratedColumn<String> get meditationId => $composableBuilder(
    column: $table.meditationId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );
}

class $$RoutineMeditationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineMeditationsTable,
          RoutineMeditation,
          $$RoutineMeditationsTableFilterComposer,
          $$RoutineMeditationsTableOrderingComposer,
          $$RoutineMeditationsTableAnnotationComposer,
          $$RoutineMeditationsTableCreateCompanionBuilder,
          $$RoutineMeditationsTableUpdateCompanionBuilder,
          (
            RoutineMeditation,
            BaseReferences<
              _$AppDatabase,
              $RoutineMeditationsTable,
              RoutineMeditation
            >,
          ),
          RoutineMeditation,
          PrefetchHooks Function()
        > {
  $$RoutineMeditationsTableTableManager(
    _$AppDatabase db,
    $RoutineMeditationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineMeditationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineMeditationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineMeditationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> routineId = const Value.absent(),
                Value<String> meditationId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineMeditationsCompanion(
                routineId: routineId,
                meditationId: meditationId,
                orderIndex: orderIndex,
                repetitions: repetitions,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String routineId,
                required String meditationId,
                required int orderIndex,
                Value<int> repetitions = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutineMeditationsCompanion.insert(
                routineId: routineId,
                meditationId: meditationId,
                orderIndex: orderIndex,
                repetitions: repetitions,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutineMeditationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineMeditationsTable,
      RoutineMeditation,
      $$RoutineMeditationsTableFilterComposer,
      $$RoutineMeditationsTableOrderingComposer,
      $$RoutineMeditationsTableAnnotationComposer,
      $$RoutineMeditationsTableCreateCompanionBuilder,
      $$RoutineMeditationsTableUpdateCompanionBuilder,
      (
        RoutineMeditation,
        BaseReferences<
          _$AppDatabase,
          $RoutineMeditationsTable,
          RoutineMeditation
        >,
      ),
      RoutineMeditation,
      PrefetchHooks Function()
    >;
typedef $$RoutinesTableCreateCompanionBuilder =
    RoutinesCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<bool> visible,
      Value<int> rowid,
    });
typedef $$RoutinesTableUpdateCompanionBuilder =
    RoutinesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<bool> visible,
      Value<int> rowid,
    });

class $$RoutinesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get visible => $composableBuilder(
    column: $table.visible,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutinesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get visible => $composableBuilder(
    column: $table.visible,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get visible =>
      $composableBuilder(column: $table.visible, builder: (column) => column);
}

class $$RoutinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutinesTable,
          Routine,
          $$RoutinesTableFilterComposer,
          $$RoutinesTableOrderingComposer,
          $$RoutinesTableAnnotationComposer,
          $$RoutinesTableCreateCompanionBuilder,
          $$RoutinesTableUpdateCompanionBuilder,
          (Routine, BaseReferences<_$AppDatabase, $RoutinesTable, Routine>),
          Routine,
          PrefetchHooks Function()
        > {
  $$RoutinesTableTableManager(_$AppDatabase db, $RoutinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> visible = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutinesCompanion(
                id: id,
                name: name,
                description: description,
                visible: visible,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> visible = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutinesCompanion.insert(
                id: id,
                name: name,
                description: description,
                visible: visible,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutinesTable,
      Routine,
      $$RoutinesTableFilterComposer,
      $$RoutinesTableOrderingComposer,
      $$RoutinesTableAnnotationComposer,
      $$RoutinesTableCreateCompanionBuilder,
      $$RoutinesTableUpdateCompanionBuilder,
      (Routine, BaseReferences<_$AppDatabase, $RoutinesTable, Routine>),
      Routine,
      PrefetchHooks Function()
    >;
typedef $$RecipesTableCreateCompanionBuilder =
    RecipesCompanion Function({
      required String id,
      required String name,
      required String description,
      required String imagePath,
      required int servings,
      required String ingredientsJson,
      required String stepsJson,
      required String nutritionJson,
      required String durationJson,
      Value<int> rowid,
    });
typedef $$RecipesTableUpdateCompanionBuilder =
    RecipesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<String> imagePath,
      Value<int> servings,
      Value<String> ingredientsJson,
      Value<String> stepsJson,
      Value<String> nutritionJson,
      Value<String> durationJson,
      Value<int> rowid,
    });

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepsJson => $composableBuilder(
    column: $table.stepsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nutritionJson => $composableBuilder(
    column: $table.nutritionJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get durationJson => $composableBuilder(
    column: $table.durationJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepsJson => $composableBuilder(
    column: $table.stepsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nutritionJson => $composableBuilder(
    column: $table.nutritionJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get durationJson => $composableBuilder(
    column: $table.durationJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stepsJson =>
      $composableBuilder(column: $table.stepsJson, builder: (column) => column);

  GeneratedColumn<String> get nutritionJson => $composableBuilder(
    column: $table.nutritionJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get durationJson => $composableBuilder(
    column: $table.durationJson,
    builder: (column) => column,
  );
}

class $$RecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipesTable,
          Recipe,
          $$RecipesTableFilterComposer,
          $$RecipesTableOrderingComposer,
          $$RecipesTableAnnotationComposer,
          $$RecipesTableCreateCompanionBuilder,
          $$RecipesTableUpdateCompanionBuilder,
          (Recipe, BaseReferences<_$AppDatabase, $RecipesTable, Recipe>),
          Recipe,
          PrefetchHooks Function()
        > {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<int> servings = const Value.absent(),
                Value<String> ingredientsJson = const Value.absent(),
                Value<String> stepsJson = const Value.absent(),
                Value<String> nutritionJson = const Value.absent(),
                Value<String> durationJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipesCompanion(
                id: id,
                name: name,
                description: description,
                imagePath: imagePath,
                servings: servings,
                ingredientsJson: ingredientsJson,
                stepsJson: stepsJson,
                nutritionJson: nutritionJson,
                durationJson: durationJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                required String imagePath,
                required int servings,
                required String ingredientsJson,
                required String stepsJson,
                required String nutritionJson,
                required String durationJson,
                Value<int> rowid = const Value.absent(),
              }) => RecipesCompanion.insert(
                id: id,
                name: name,
                description: description,
                imagePath: imagePath,
                servings: servings,
                ingredientsJson: ingredientsJson,
                stepsJson: stepsJson,
                nutritionJson: nutritionJson,
                durationJson: durationJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipesTable,
      Recipe,
      $$RecipesTableFilterComposer,
      $$RecipesTableOrderingComposer,
      $$RecipesTableAnnotationComposer,
      $$RecipesTableCreateCompanionBuilder,
      $$RecipesTableUpdateCompanionBuilder,
      (Recipe, BaseReferences<_$AppDatabase, $RecipesTable, Recipe>),
      Recipe,
      PrefetchHooks Function()
    >;
typedef $$TagsTableCreateCompanionBuilder =
    TagsCompanion Function({required String tag, Value<int> rowid});
typedef $$TagsTableUpdateCompanionBuilder =
    TagsCompanion Function({Value<String> tag, Value<int> rowid});

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          Tag,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (Tag, BaseReferences<_$AppDatabase, $TagsTable, Tag>),
          Tag,
          PrefetchHooks Function()
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> tag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion(tag: tag, rowid: rowid),
          createCompanionCallback:
              ({
                required String tag,
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion.insert(tag: tag, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      Tag,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (Tag, BaseReferences<_$AppDatabase, $TagsTable, Tag>),
      Tag,
      PrefetchHooks Function()
    >;
typedef $$RecipeTagsTableCreateCompanionBuilder =
    RecipeTagsCompanion Function({
      required String recipeId,
      required String tag,
      Value<int> rowid,
    });
typedef $$RecipeTagsTableUpdateCompanionBuilder =
    RecipeTagsCompanion Function({
      Value<String> recipeId,
      Value<String> tag,
      Value<int> rowid,
    });

class $$RecipeTagsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeTagsTable> {
  $$RecipeTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get recipeId => $composableBuilder(
    column: $table.recipeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecipeTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeTagsTable> {
  $$RecipeTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get recipeId => $composableBuilder(
    column: $table.recipeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipeTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeTagsTable> {
  $$RecipeTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);
}

class $$RecipeTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeTagsTable,
          RecipeTag,
          $$RecipeTagsTableFilterComposer,
          $$RecipeTagsTableOrderingComposer,
          $$RecipeTagsTableAnnotationComposer,
          $$RecipeTagsTableCreateCompanionBuilder,
          $$RecipeTagsTableUpdateCompanionBuilder,
          (
            RecipeTag,
            BaseReferences<_$AppDatabase, $RecipeTagsTable, RecipeTag>,
          ),
          RecipeTag,
          PrefetchHooks Function()
        > {
  $$RecipeTagsTableTableManager(_$AppDatabase db, $RecipeTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> recipeId = const Value.absent(),
                Value<String> tag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeTagsCompanion(
                recipeId: recipeId,
                tag: tag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String recipeId,
                required String tag,
                Value<int> rowid = const Value.absent(),
              }) => RecipeTagsCompanion.insert(
                recipeId: recipeId,
                tag: tag,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecipeTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeTagsTable,
      RecipeTag,
      $$RecipeTagsTableFilterComposer,
      $$RecipeTagsTableOrderingComposer,
      $$RecipeTagsTableAnnotationComposer,
      $$RecipeTagsTableCreateCompanionBuilder,
      $$RecipeTagsTableUpdateCompanionBuilder,
      (RecipeTag, BaseReferences<_$AppDatabase, $RecipeTagsTable, RecipeTag>),
      RecipeTag,
      PrefetchHooks Function()
    >;
typedef $$FoodTrackingsTableCreateCompanionBuilder =
    FoodTrackingsCompanion Function({
      required String id,
      required String name,
      required String nutritionJson,
      required double quantity,
      required int source,
      Value<String?> referenceId,
      required DateTime trackedAt,
      Value<int> rowid,
    });
typedef $$FoodTrackingsTableUpdateCompanionBuilder =
    FoodTrackingsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> nutritionJson,
      Value<double> quantity,
      Value<int> source,
      Value<String?> referenceId,
      Value<DateTime> trackedAt,
      Value<int> rowid,
    });

class $$FoodTrackingsTableFilterComposer
    extends Composer<_$AppDatabase, $FoodTrackingsTable> {
  $$FoodTrackingsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nutritionJson => $composableBuilder(
    column: $table.nutritionJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get trackedAt => $composableBuilder(
    column: $table.trackedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FoodTrackingsTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodTrackingsTable> {
  $$FoodTrackingsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nutritionJson => $composableBuilder(
    column: $table.nutritionJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get trackedAt => $composableBuilder(
    column: $table.trackedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FoodTrackingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodTrackingsTable> {
  $$FoodTrackingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nutritionJson => $composableBuilder(
    column: $table.nutritionJson,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get trackedAt =>
      $composableBuilder(column: $table.trackedAt, builder: (column) => column);
}

class $$FoodTrackingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodTrackingsTable,
          FoodTracking,
          $$FoodTrackingsTableFilterComposer,
          $$FoodTrackingsTableOrderingComposer,
          $$FoodTrackingsTableAnnotationComposer,
          $$FoodTrackingsTableCreateCompanionBuilder,
          $$FoodTrackingsTableUpdateCompanionBuilder,
          (
            FoodTracking,
            BaseReferences<_$AppDatabase, $FoodTrackingsTable, FoodTracking>,
          ),
          FoodTracking,
          PrefetchHooks Function()
        > {
  $$FoodTrackingsTableTableManager(_$AppDatabase db, $FoodTrackingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodTrackingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodTrackingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodTrackingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nutritionJson = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<int> source = const Value.absent(),
                Value<String?> referenceId = const Value.absent(),
                Value<DateTime> trackedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FoodTrackingsCompanion(
                id: id,
                name: name,
                nutritionJson: nutritionJson,
                quantity: quantity,
                source: source,
                referenceId: referenceId,
                trackedAt: trackedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String nutritionJson,
                required double quantity,
                required int source,
                Value<String?> referenceId = const Value.absent(),
                required DateTime trackedAt,
                Value<int> rowid = const Value.absent(),
              }) => FoodTrackingsCompanion.insert(
                id: id,
                name: name,
                nutritionJson: nutritionJson,
                quantity: quantity,
                source: source,
                referenceId: referenceId,
                trackedAt: trackedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FoodTrackingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodTrackingsTable,
      FoodTracking,
      $$FoodTrackingsTableFilterComposer,
      $$FoodTrackingsTableOrderingComposer,
      $$FoodTrackingsTableAnnotationComposer,
      $$FoodTrackingsTableCreateCompanionBuilder,
      $$FoodTrackingsTableUpdateCompanionBuilder,
      (
        FoodTracking,
        BaseReferences<_$AppDatabase, $FoodTrackingsTable, FoodTracking>,
      ),
      FoodTracking,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$JournalReflectionsTableTableManager get journalReflections =>
      $$JournalReflectionsTableTableManager(_db, _db.journalReflections);
  $$CommsCheckEntriesTableTableManager get commsCheckEntries =>
      $$CommsCheckEntriesTableTableManager(_db, _db.commsCheckEntries);
  $$EmotionExplorerMapsTableTableManager get emotionExplorerMaps =>
      $$EmotionExplorerMapsTableTableManager(_db, _db.emotionExplorerMaps);
  $$MeditationsTableTableManager get meditations =>
      $$MeditationsTableTableManager(_db, _db.meditations);
  $$RoutineMeditationsTableTableManager get routineMeditations =>
      $$RoutineMeditationsTableTableManager(_db, _db.routineMeditations);
  $$RoutinesTableTableManager get routines =>
      $$RoutinesTableTableManager(_db, _db.routines);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$RecipeTagsTableTableManager get recipeTags =>
      $$RecipeTagsTableTableManager(_db, _db.recipeTags);
  $$FoodTrackingsTableTableManager get foodTrackings =>
      $$FoodTrackingsTableTableManager(_db, _db.foodTrackings);
}
