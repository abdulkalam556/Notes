import 'package:flutter/foundation.dart';

class Note {
  final int id;
  final String title;
  final String content;
  final DateTime dateCreated;
  Set<String> tags;
  bool ispinned;
  bool isarchived;

  Note({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.dateCreated,
    @required this.tags,
    @required this.ispinned,
    @required this.isarchived,
  });
  

  void pinToggle() => ispinned = !ispinned ;

}

