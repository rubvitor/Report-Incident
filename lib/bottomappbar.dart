import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  final Color color = Colors.black87;
  final FloatingActionButtonLocation fabLocation = FloatingActionButtonLocation.centerDocked;
  final NotchedShape shape = CircularNotchedRectangle();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: color,
      //shape: shape,
      child: Row(children: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu, semanticLabel: 'Show bottom sheet', color: Colors.white,),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) => const _Drawer(),
            );
          },
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          icon: const Icon(Icons.search, semanticLabel: 'show search action', color: Colors.white),
          onPressed: () {
            Scaffold.of(context).showSnackBar(
              const SnackBar(content: Text('This is a dummy search action.')),
            );
          },
        ),  
      ]),
    );
  }
}

// A drawer that pops up from the bottom of the screen.
class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
      ),
    );
  }
}
