import 'package:flutter/material.dart';
import 'package:note/models/note.dart';
import 'package:intl/intl.dart';

import '../themes/theme.dart';
import '../models/notes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> myFilters = myFinalNotes.filters;
  List<Note> myNotes = myFinalNotes.notes;
  Map<int, String> myDates = myFinalNotes.notesRequiredDates();
  int activatedfilter;

  void setNotesAndDates() {
    myNotes = myFinalNotes.getNotes(myFilters[activatedfilter]);
    myDates =
        myFinalNotes.notesRequiredDates(filter: myFilters[activatedfilter]);
  }

  @override
  void initState() {
    super.initState();
    myFilters.insert(0, 'All Notes');
    myFilters.insert(1, 'pinned');
    activatedfilter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Notes', style: appheadingNotes),
                      Text(
                        '${myFinalNotes.myNotes.length}  notes',
                        style: appSubheadingNotes,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                      top: 4.0,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ...myFilters.map(
                      (filter) => filterChip(myFilters.indexOf(filter)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      myDates.containsKey(index)
                          ? dateCard(myDates[index])
                          : Container(),
                  itemCount: myNotes.length + 1,
                  itemBuilder: (context, index) =>
                      index == 0 ? Container() : noteCard(index - 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget filterChip(int index) {
    bool isSelected = index == activatedfilter ? true : false;
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              activatedfilter = index;
              setNotesAndDates();
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                myFilters[index],
                style: isSelected ? myChoiceChipStyleOn : myChoiceChipStyleOff,
              ),
              if (isSelected)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    '_____' *
                        (myFilters[index].length > 5
                            ? myFilters[index].length ~/ 5
                            : 1),
                    style: myChipUnderline,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(width: 15.0),
      ],
    );
  }

  Widget noteCard(int index) {
    return Stack(
      key: Key(myNotes[index].title),
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(right: 16.0, top: 16.0, bottom: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          shadowColor: Colors.yellowAccent,
          elevation: 4.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (myFilters[activatedfilter] == 'All Notes' ||
                      myFilters[activatedfilter] == 'pinned')
                    ...myNotes[index].tags.map(
                      (e) {
                        return Container(
                          margin: EdgeInsets.all(4.0),
                          child: Chip(
                            label: Text('#$e'),
                          ),
                        );
                      },
                    ),
                  if (myNotes[index].tags.isEmpty)
                    SizedBox(
                      height: 25,
                    ),
                ],
              ),
              if (myFilters[activatedfilter] != 'All Notes' &&
                  myFilters[activatedfilter] != 'pinned')
                SizedBox(
                  height: 30,
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '${myNotes[index].title}',
                      style: notestitle,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Icon(
                      Icons.date_range,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      bottom: 16.0,
                      right: 16.0,
                    ),
                    child: Text(
                      ' ${DateFormat('d MMM').format(myNotes[index].dateCreated)}',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 16.0,
                  right: 8.0,
                ),
                child: Text(
                  '${myNotes[index].content}',
                  maxLines: 1,
                  style: notescontent,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              myNotes[index].pinToggle();
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 32.0),
            child: Align(
              child: Icon(
                myNotes[index].ispinned ? Icons.turned_in : Icons.turned_in_not,
              ),
              alignment: Alignment.topRight,
            ),
          ),
        ),
      ],
    );
  }

  Widget dateCard(String dateString) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: Colors.yellowAccent[700], shape: BoxShape.circle),
          ),
          Text(
            dateString,
            style: dateStringStyle,
          ),
        ],
      ),
    );
  }
}
