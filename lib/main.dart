import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:report_incident/bottomappbar.dart';
import 'package:report_incident/Report/report.dart';
import 'package:report_incident/map.dart' as prefix0;
import 'package:report_incident/topappbar.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

import 'map.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    theme: ThemeData.dark(),
    home: MyAppState(),
  ));
}

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
            // Replace this container with your Map widget
            Container(
              child: Map(_center),
            ),
            Positioned(
              top: 10,
              right: 15,
              left: 15,
              child: Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.black54,
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      splashColor: Colors.grey,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        //TODO: Implement Drawer
                      },
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.white70,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.go,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: "Search...",
                            fillColor: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 15.0,
                        backgroundImage: NetworkImage(
                            "https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
            Icons.add,
            semanticLabel: 'Action',
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
