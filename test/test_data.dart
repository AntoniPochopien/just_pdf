import 'dart:math' as math;

import 'package:just_pdf/dashboard/domain/file_metadata.dart';

String _generateRandomPath(int index) {
  final random = math.Random(index);
  String randomLetters(int length) => String.fromCharCodes(
      List.generate(length, (_) => random.nextInt(26) + 97));
  return '${randomLetters(10)}/${randomLetters(10)}';
}

final mockedFiles = List<FileMetadata>.generate(100, (index) {
  final lastViewed = DateTime.now().subtract(Duration(days: index));
  return FileMetadata(
    id: index.toString(),
    filePath: _generateRandomPath(index),
    lastViewed: lastViewed,
    sizeInBytes: index + 1,
    favorite: index % 2 == 0,
  );
})
  ..shuffle();
