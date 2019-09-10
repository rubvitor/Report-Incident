import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:report_incident/bottomappbar.dart';
import 'package:report_incident/Report/report.dart';
import 'package:report_incident/map.dart';
import 'package:report_incident/topappbar.dart';

import 'map.dart';

class MyAppState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: MyMap(),
            ),
            FloatAppBar()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "btn2",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Report()),
            );
          },
          child: Icon(
            Icons.report,
            semanticLabel: 'Report',
            color: Colors.white,
          ),
          backgroundColor: Colors.black54,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
