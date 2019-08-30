import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Test(),
    );
  }
}

class MakeButton extends StatelessWidget{
  final String _buttonCaption;

  MakeButton(this._buttonCaption);

  @override 
  Widget build (BuildContext context){
    return Padding(
      padding: EdgeInsets.all(10),
      child: FlatButton(
          onPressed: () {},
          child: Text(
          _buttonCaption
          ),
        ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Row DATA 1"),
            Text("Row DATA 2"),
            Text("Row DATA 3"),
          ],
        ),
        MakeButton("Flat Button 1"),
        MakeButton("Flat Button 2"),
        MakeButton("Flat Button 3"),
      ],
    );
  }
}
