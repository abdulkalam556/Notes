import 'package:flutter/foundation.dart';

class Note {
  final int id;
  final String title;
  final String content;
  Set<String> hashtags;
  bool ispinned;
  bool isarchived;
  Note({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.hashtags,
    @required this.ispinned,
    @required this.isarchived,
  });
}

