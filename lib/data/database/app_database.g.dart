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
  static const VerificationMeta _audioCompletePathMeta = const VerificationMeta(
    'audioCompletePath',
  );
  @override
  late final GeneratedColumn<String> audioCompletePath =
      GeneratedColumn<String>(
        'audio_complete_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _audioBeginningPathMeta =
      const VerificationMeta('audioBeginningPath');
  @override
  late final GeneratedColumn<String> audioBeginningPath =
      GeneratedColumn<String>(
        'audio_beginning_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _audioRepeatingPathMeta =
      const VerificationMeta('audioRepeatingPath');
  @override
  late final GeneratedColumn<String> audioRepeatingPath =
      GeneratedColumn<String>(
        'audio_repeating_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _audioEndPathMeta = const VerificationMeta(
    'audioEndPath',
  );
  @override
  late final GeneratedColumn<String> audioEndPath = GeneratedColumn<String>(
    'audio_end_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    audioCompletePath,
    audioBeginningPath,
    audioRepeatingPath,
    audioEndPath,
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
    if (data.containsKey('audio_complete_path')) {
      context.handle(
        _audioCompletePathMeta,
        audioCompletePath.isAcceptableOrUnknown(
          data['audio_complete_path']!,
          _audioCompletePathMeta,
        ),
      );
    }
    if (data.containsKey('audio_beginning_path')) {
      context.handle(
        _audioBeginningPathMeta,
        audioBeginningPath.isAcceptableOrUnknown(
          data['audio_beginning_path']!,
          _audioBeginningPathMeta,
        ),
      );
    }
    if (data.containsKey('audio_repeating_path')) {
      context.handle(
        _audioRepeatingPathMeta,
        audioRepeatingPath.isAcceptableOrUnknown(
          data['audio_repeating_path']!,
          _audioRepeatingPathMeta,
        ),
      );
    }
    if (data.containsKey('audio_end_path')) {
      context.handle(
        _audioEndPathMeta,
        audioEndPath.isAcceptableOrUnknown(
          data['audio_end_path']!,
          _audioEndPathMeta,
        ),
      );
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
      audioCompletePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_complete_path'],
      ),
      audioBeginningPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_beginning_path'],
      ),
      audioRepeatingPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_repeating_path'],
      ),
      audioEndPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_end_path'],
      ),
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
  final String? audioCompletePath;
  final String? audioBeginningPath;
  final String? audioRepeatingPath;
  final String? audioEndPath;
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
    this.audioCompletePath,
    this.audioBeginningPath,
    this.audioRepeatingPath,
    this.audioEndPath,
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
    if (!nullToAbsent || audioCompletePath != null) {
      map['audio_complete_path'] = Variable<String>(audioCompletePath);
    }
    if (!nullToAbsent || audioBeginningPath != null) {
      map['audio_beginning_path'] = Variable<String>(audioBeginningPath);
    }
    if (!nullToAbsent || audioRepeatingPath != null) {
      map['audio_repeating_path'] = Variable<String>(audioRepeatingPath);
    }
    if (!nullToAbsent || audioEndPath != null) {
      map['audio_end_path'] = Variable<String>(audioEndPath);
    }
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
      audioCompletePath: audioCompletePath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioCompletePath),
      audioBeginningPath: audioBeginningPath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioBeginningPath),
      audioRepeatingPath: audioRepeatingPath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioRepeatingPath),
      audioEndPath: audioEndPath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioEndPath),
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
      audioCompletePath: serializer.fromJson<String?>(
        json['audioCompletePath'],
      ),
      audioBeginningPath: serializer.fromJson<String?>(
        json['audioBeginningPath'],
      ),
      audioRepeatingPath: serializer.fromJson<String?>(
        json['audioRepeatingPath'],
      ),
      audioEndPath: serializer.fromJson<String?>(json['audioEndPath']),
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
      'audioCompletePath': serializer.toJson<String?>(audioCompletePath),
      'audioBeginningPath': serializer.toJson<String?>(audioBeginningPath),
      'audioRepeatingPath': serializer.toJson<String?>(audioRepeatingPath),
      'audioEndPath': serializer.toJson<String?>(audioEndPath),
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
    Value<String?> audioCompletePath = const Value.absent(),
    Value<String?> audioBeginningPath = const Value.absent(),
    Value<String?> audioRepeatingPath = const Value.absent(),
    Value<String?> audioEndPath = const Value.absent(),
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
    audioCompletePath: audioCompletePath.present
        ? audioCompletePath.value
        : this.audioCompletePath,
    audioBeginningPath: audioBeginningPath.present
        ? audioBeginningPath.value
        : this.audioBeginningPath,
    audioRepeatingPath: audioRepeatingPath.present
        ? audioRepeatingPath.value
        : this.audioRepeatingPath,
    audioEndPath: audioEndPath.present ? audioEndPath.value : this.audioEndPath,
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
      audioCompletePath: data.audioCompletePath.present
          ? data.audioCompletePath.value
          : this.audioCompletePath,
      audioBeginningPath: data.audioBeginningPath.present
          ? data.audioBeginningPath.value
          : this.audioBeginningPath,
      audioRepeatingPath: data.audioRepeatingPath.present
          ? data.audioRepeatingPath.value
          : this.audioRepeatingPath,
      audioEndPath: data.audioEndPath.present
          ? data.audioEndPath.value
          : this.audioEndPath,
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
          ..write('audioCompletePath: $audioCompletePath, ')
          ..write('audioBeginningPath: $audioBeginningPath, ')
          ..write('audioRepeatingPath: $audioRepeatingPath, ')
          ..write('audioEndPath: $audioEndPath, ')
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
    audioCompletePath,
    audioBeginningPath,
    audioRepeatingPath,
    audioEndPath,
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
          other.audioCompletePath == this.audioCompletePath &&
          other.audioBeginningPath == this.audioBeginningPath &&
          other.audioRepeatingPath == this.audioRepeatingPath &&
          other.audioEndPath == this.audioEndPath &&
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
  final Value<String?> audioCompletePath;
  final Value<String?> audioBeginningPath;
  final Value<String?> audioRepeatingPath;
  final Value<String?> audioEndPath;
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
    this.audioCompletePath = const Value.absent(),
    this.audioBeginningPath = const Value.absent(),
    this.audioRepeatingPath = const Value.absent(),
    this.audioEndPath = const Value.absent(),
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
    this.audioCompletePath = const Value.absent(),
    this.audioBeginningPath = const Value.absent(),
    this.audioRepeatingPath = const Value.absent(),
    this.audioEndPath = const Value.absent(),
    this.tutorialVideoPath = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       favorite = Value(favorite),
       title = Value(title),
       description = Value(description),
       type = Value(type),
       cognitiveType = Value(cognitiveType),
       level = Value(level);
  static Insertable<Meditation> custom({
    Expression<String>? id,
    Expression<bool>? favorite,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? chakraType,
    Expression<String>? cognitiveType,
    Expression<String>? level,
    Expression<String>? audioCompletePath,
    Expression<String>? audioBeginningPath,
    Expression<String>? audioRepeatingPath,
    Expression<String>? audioEndPath,
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
      if (audioCompletePath != null) 'audio_complete_path': audioCompletePath,
      if (audioBeginningPath != null)
        'audio_beginning_path': audioBeginningPath,
      if (audioRepeatingPath != null)
        'audio_repeating_path': audioRepeatingPath,
      if (audioEndPath != null) 'audio_end_path': audioEndPath,
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
    Value<String?>? audioCompletePath,
    Value<String?>? audioBeginningPath,
    Value<String?>? audioRepeatingPath,
    Value<String?>? audioEndPath,
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
      audioCompletePath: audioCompletePath ?? this.audioCompletePath,
      audioBeginningPath: audioBeginningPath ?? this.audioBeginningPath,
      audioRepeatingPath: audioRepeatingPath ?? this.audioRepeatingPath,
      audioEndPath: audioEndPath ?? this.audioEndPath,
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
    if (audioCompletePath.present) {
      map['audio_complete_path'] = Variable<String>(audioCompletePath.value);
    }
    if (audioBeginningPath.present) {
      map['audio_beginning_path'] = Variable<String>(audioBeginningPath.value);
    }
    if (audioRepeatingPath.present) {
      map['audio_repeating_path'] = Variable<String>(audioRepeatingPath.value);
    }
    if (audioEndPath.present) {
      map['audio_end_path'] = Variable<String>(audioEndPath.value);
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
          ..write('audioCompletePath: $audioCompletePath, ')
          ..write('audioBeginningPath: $audioBeginningPath, ')
          ..write('audioRepeatingPath: $audioRepeatingPath, ')
          ..write('audioEndPath: $audioEndPath, ')
          ..write('tutorialVideoPath: $tutorialVideoPath, ')
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
  late final JournalDao journalDao = JournalDao(this as AppDatabase);
  late final JournalReflectionDao journalReflectionDao = JournalReflectionDao(
    this as AppDatabase,
  );
  late final CommsCheckDao commsCheckDao = CommsCheckDao(this as AppDatabase);
  late final EmotionExplorerMapDao emotionExplorerMapDao =
      EmotionExplorerMapDao(this as AppDatabase);
  late final MeditationDao meditationDao = MeditationDao(this as AppDatabase);
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
      Value<String?> audioCompletePath,
      Value<String?> audioBeginningPath,
      Value<String?> audioRepeatingPath,
      Value<String?> audioEndPath,
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
      Value<String?> audioCompletePath,
      Value<String?> audioBeginningPath,
      Value<String?> audioRepeatingPath,
      Value<String?> audioEndPath,
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

  ColumnFilters<String> get audioCompletePath => $composableBuilder(
    column: $table.audioCompletePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioBeginningPath => $composableBuilder(
    column: $table.audioBeginningPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioRepeatingPath => $composableBuilder(
    column: $table.audioRepeatingPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioEndPath => $composableBuilder(
    column: $table.audioEndPath,
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

  ColumnOrderings<String> get audioCompletePath => $composableBuilder(
    column: $table.audioCompletePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioBeginningPath => $composableBuilder(
    column: $table.audioBeginningPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioRepeatingPath => $composableBuilder(
    column: $table.audioRepeatingPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioEndPath => $composableBuilder(
    column: $table.audioEndPath,
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

  GeneratedColumn<String> get audioCompletePath => $composableBuilder(
    column: $table.audioCompletePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioBeginningPath => $composableBuilder(
    column: $table.audioBeginningPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioRepeatingPath => $composableBuilder(
    column: $table.audioRepeatingPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioEndPath => $composableBuilder(
    column: $table.audioEndPath,
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
                Value<String?> audioCompletePath = const Value.absent(),
                Value<String?> audioBeginningPath = const Value.absent(),
                Value<String?> audioRepeatingPath = const Value.absent(),
                Value<String?> audioEndPath = const Value.absent(),
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
                audioCompletePath: audioCompletePath,
                audioBeginningPath: audioBeginningPath,
                audioRepeatingPath: audioRepeatingPath,
                audioEndPath: audioEndPath,
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
                Value<String?> audioCompletePath = const Value.absent(),
                Value<String?> audioBeginningPath = const Value.absent(),
                Value<String?> audioRepeatingPath = const Value.absent(),
                Value<String?> audioEndPath = const Value.absent(),
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
                audioCompletePath: audioCompletePath,
                audioBeginningPath: audioBeginningPath,
                audioRepeatingPath: audioRepeatingPath,
                audioEndPath: audioEndPath,
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
}
