import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class FloatAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return (FloatingSearchBar(
      trailing: CircleAvatar(
        child: Text("RD"),
      ),
      drawer: Drawer(
        child: Container(),
      ),
      onChanged: (String value) {},
      onTap: () {},
      decoration: InputDecoration.collapsed(
        hintText: "Search...",
      ),
      children: <Widget>[
      ],
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
} 
