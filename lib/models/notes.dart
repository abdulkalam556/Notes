import 'package:note/models/note.dart';

class Notes {
  final List<Note> myNotes;
  Notes(this.myNotes);
  List<String> get filters {
    Set<String> allFilters = {};
    myNotes.forEach((note) {
      if (note.hashtags.isNotEmpty) {
        note.hashtags.forEach((e) => allFilters.add(e));
      }
    });
    return allFilters.toList();
  }
  List<Note> get notes => myNotes;
}

final myFinalNotes = Notes(myData);
final List<Note> myData = [
  Note(
    id: 0,
    title: 'Notes',
    content: 'u can use it in the manner u want',
    hashtags: Set(),
    ispinned: true,
    isarchived: false,
  ),
  Note(
    id: 1,
    title: 'Assignment',
    content:
        'green technology assignment deadline is on may 15th complete it early',
    hashtags: {'work', 'assignment'},
    ispinned: false,
    isarchived: false,
  ),
  Note(
    id: 2,
    title: 'Notes App',
    content:
        'all the work and project details regarding my notes app is written here. its private and funky . haha... ',
    hashtags: {'work', 'project'},
    ispinned: false,
    isarchived: false,
  ),
  Note(
    id: 3,
    title: 'Zoom Meet',
    content:
        'JPMorgan important meet is on may 21st at 3Pm. its important dont miss it',
    hashtags: {'work', 'intern'},
    ispinned: false,
    isarchived: false,
  ),
  Note(
    id: 4,
    title: 'Tap',
    content: 'need to fix the broken tap',
    hashtags: {'home'},
    ispinned: false,
    isarchived: false,
  ),
  Note(
    id: 5,
    title: 'Silk',
    content: 'Need to bring a chacolate for my sis',
    hashtags: {'home'},
    ispinned: false,
    isarchived: false,
  ),
];
