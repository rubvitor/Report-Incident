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
  

  final LatLng _center = const LatLng(28.535517, 77.391029);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: Map(_center),
            ),
            FloatAppBar()
          ],
        ),
        floatingActionButton: FloatingActionButton(
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