import 'package:intl/intl.dart';

import 'package:note/models/note.dart';

class Notes {
  final List<Note> myNotes;

  Notes(this.myNotes);

  List<String> get filters {
    Set<String> allFilters = {};
    myNotes.forEach((note) {
      if (note.tags.isNotEmpty) {
        note.tags.forEach((e) => allFilters.add(e));
      }
    });
    return allFilters.toList();
  }

  List<Note> get notes =>
      myNotes..sort((b, a) => a.dateCreated.compareTo(b.dateCreated));

  Map<int, String> notesRequiredDates({String filter = 'All Notes'}) {
    Map<int, String> dateSet = {};
    var tempNotes = this.getNotes(filter);
    String tempDate = DateFormat('MMM yyyy').format(tempNotes[0].dateCreated);
    dateSet[0] = tempDate;
    String tempDate2;
    for (var i = 1; i < tempNotes.length; i++) {
      tempDate2 = DateFormat('MMM yyyy').format(tempNotes[i].dateCreated);
      if (tempDate != tempDate2) {
        dateSet[i] = tempDate2;
        tempDate = tempDate2;
      }
    }

    return dateSet;
  }

  List<Note> getNotes(String filter) {
    if (filter == 'All Notes') {
      return this.notes;
    } else if (filter == 'pinned') {
      List<Note> pinnedNotes = [];
      this.notes.forEach((e) {
        if (e.ispinned) {
          pinnedNotes.add(e);
        }
      });
      return pinnedNotes;
    } else {
      List<Note> filteredNotes = [];
      this.notes.forEach((e) {
        if (e.tags.contains(filter)) {
          filteredNotes.add(e);
        }
      });
      return filteredNotes;
    }
  }
}

final myFinalNotes = Notes(myData);
final List<Note> myData = [
  Note(
    id: 0,
    title: 'Notes',
    content: 'u can use it in the manner u want',
    dateCreated: DateTime.now(),
    tags: Set(),
    ispinned: true,
    isarchived: false,
  ),
  Note(
    id: 1,
    title: 'Assignment',
    content:
        'green technology assignment deadline is on may 15th complete it early',
    dateCreated: DateTime.now(),
    tags: {'work', 'assignment'},
    ispinned: false,
    isarchived: false,
  ),
  Note(
    id: 2,
    title: 'Notes App',
    content:
        'all the work and project details regarding my notes app is written here. its private and funky . haha... ',
    dateCreated: DateTime.now(),
    tags: {'work', 'project'},
    ispinned: false,
    isarchived: false,
  ),
  Note(
    id: 3,
    title: 'Zoom Meet',
    content:
        'JPMorgan important meet is on may 21st at 3Pm. its important dont miss it',
    dateCreated: DateTime.now().add(
      Duration(
        days: 23,
        hours: 3,
        minutes: 30,
      ),
    ),
    tags: {'work', 'intern'},
    ispinned: true,
    isarchived: false,
  ),
  Note(
    id: 4,
    title: 'Tap',
    content: 'need to fix the broken tap',
    dateCreated: DateTime.now().add(
      Duration(
        days: 15,
        hours: 3,
        minutes: 30,
      ),
    ),
    tags: {},
    ispinned: false,
    isarchived: false,
  ),
  Note(
    id: 5,
    title: 'Silk',
    content: 'Need to bring a chacolate for my sis',
    dateCreated: DateTime.now(),
    tags: {'home'},
    ispinned: false,
    isarchived: false,
  ),
];
