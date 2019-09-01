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
      children: <Widget>[null],
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

/* class FloatAppBar2 extends StatelessWidget {

  final double topPadding = MediaQuery.of(context).padding.top;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width -
            20, // or use fixed size like 200
        height: collapsedHeight ?? (topPadding + kToolbarHeight);,
        child: TextField(
          
                  decoration: 
                      InputDecoration.collapsed(
                        hintText: "Search...",
                        fillColor: Colors.white
                      ),
                  autofocus: false,
                  //onChanged:  ,
                  onTap: () {},
                ),);
  }
} */
