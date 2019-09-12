import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  static const List<String> _drawerContents = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Item 1"),
            leading: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Item 2"),
            leading: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
