import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class RotatingFileOutput extends LogOutput {
  final int maxFiles;
  final int maxFileSizeBytes;

  IOSink? _sink;
  File? _currentFile;
  int _currentFileSize = 0;

  RotatingFileOutput({
    this.maxFiles = 5,
    this.maxFileSizeBytes = 5 * 1024 * 1024, // 5MB
  });

  @override
  Future<void> init() async {
    final directory = await getApplicationSupportDirectory();
    final logDir = Directory('${directory.path}/logs');

    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }

    await _rotateIfNeeded(logDir);
  }

  Future<void> _rotateIfNeeded(Directory logDir) async {
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    _currentFile = File('${logDir.path}/totem_$timestamp.log');

    final files =
        logDir
            .listSync()
            .whereType<File>()
            .where((f) => f.path.endsWith('.log'))
            .toList()
          ..sort((a, b) => b.path.compareTo(a.path));

    while (files.length >= maxFiles) {
      await files.removeLast().delete();
      files.removeLast();
    }

    _sink = _currentFile!.openWrite(mode: FileMode.append);
    _currentFileSize = await _currentFile!.length();
  }

  @override
  void output(OutputEvent event) {
    if (_sink == null) return;

    for (final line in event.lines) {
      _sink!.writeln(line);
      _currentFileSize += line.length + 1;
    }

    if (_currentFileSize >= maxFileSizeBytes) {
      _sink!.close();
      init(); // Rotate
    }
  }

  @override
  Future<void> destroy() async {
    await _sink?.close();
  }
}
