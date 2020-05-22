import 'package:flutter/material.dart';

import '../themes/theme.dart';
import '../models/notes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> myFilters = myFinalNotes.filters;
  int activatedfilter;
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
                Text(
                  '_____' *
                      (myFilters[index].length > 4
                          ? myFilters[index].length ~/ 4
                          : 1),
                  style: TextStyle(
                      color: Colors.yellowAccent[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
        SizedBox(width: 15.0),
      ],
    );
  }
}
