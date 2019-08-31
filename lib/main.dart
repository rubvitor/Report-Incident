import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:report_incident/bottomappbar.dart';
import 'package:report_incident/Report/report.dart';

import 'map.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyAppState(),
  ));
}

class MyAppState extends StatelessWidget{
  final LatLng _center = const LatLng(28.535517, 77.391029);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Map(_center),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Report()),
            );
          },
          child: Icon(Icons.add, semanticLabel: 'Action'),
          backgroundColor: Colors.orange,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
