import 'dart:ui';

import 'package:flutter/material.dart';

const list = [10.0, 15.0, 15.0, null, 0.0];

class FloatAppBar extends StatefulWidget {
  @override
  State<FloatAppBar> createState() => _FloatAppBar();
}

class _FloatAppBar extends State<FloatAppBar> {
  double top = 10;
  double bottom;
  double right = 15;
  double left = 15;

  void expandBoxSize() {
    setState(() {
      top = list[4];
      bottom = list[4];
      right = list[4];
      left = list[4];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PositionedBox(
          top: top,
          right: right,
          bottom: bottom,
          left: left,
        ),
      ],
    );
  }
}

class PositionedBox extends StatelessWidget {
  final double top;
  final double bottom;
  final double right;
  final double left;
  PositionedBox({Key key, this.top, this.bottom, this.left, this.right})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        right: right,
        left: left,
        bottom: bottom,
        child: BlurredBox());
  }
}

class BlurredBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ClipRect(
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
            decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.black54.withOpacity(0.5)),
            child: NavBarElements()),
      ),
    );
  }
}

class NavBarElements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          splashColor: Colors.grey,
          icon: Icon(
            Icons.menu,
            color: Colors.white70,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.white70,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            style: TextStyle(color: Colors.white),
            onTap: () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: "Search",
                fillColor: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 4.0, 8.0, 4.0),
          child: Row(children: <Widget>[
            IconButton(
              splashColor: Colors.grey,
              icon: Icon(
                Icons.mic,
                color: Colors.white70,
              ),
              onPressed: () {
                //TODO: Add Voice Search
              },
            ),
            CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage(
                  "https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png"),
              backgroundColor: Colors.transparent,
            ),
          ]),
        )
      ],
    );
  }
}



class CustomSearchDelegate extends SearchDelegate {
    @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
    
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes. 
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
