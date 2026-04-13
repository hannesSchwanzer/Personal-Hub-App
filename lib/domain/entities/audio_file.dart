import 'dart:convert';

class AudioFile {
  final String path;
  final Duration duration;
  final FileType type;
  const AudioFile({
    required this.path,
    required this.duration,
    this.type = FileType.asset,
  });

  String toJsonString() {
    return jsonEncode({
      'path': path,
      'duration': duration.inMilliseconds,
      'type': type.name,
    });
  }

  factory AudioFile.fromJsonString(String jsonString) {
    final Map<String, dynamic> map = jsonDecode(jsonString);
    return AudioFile(
      path: map['path'] as String,
      duration: Duration(milliseconds: map['duration'] as int),
      type: FileType.values.byName(map['type'] as String),
    );
  }
}

enum FileType { asset, network, file }
