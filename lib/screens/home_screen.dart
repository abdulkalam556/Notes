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
    myFilters.insert(0, 'All Filters');
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
              
            ],
          ),
        ),
      ),
    );
  }

}