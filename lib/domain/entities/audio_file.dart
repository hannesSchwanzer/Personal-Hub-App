class AudioFile {
  final String path;
  final Duration duration;
  final FileType type;
  const AudioFile({
    required this.path,
    required this.duration,
    this.type = FileType.asset,
  });
}

enum FileType { asset, network, file }
