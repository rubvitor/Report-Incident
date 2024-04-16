import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReportForm(),
    );
  }
}

class ReportForm extends StatefulWidget{
  @override 
  _ReportForm createState() => new _ReportForm();
}

class _ReportForm extends State<ReportForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          
          children: <Widget>[
            const SizedBox(height: 24.0),
            const SizedBox(height: 24.0),
            TextFormField(
              scrollPadding: EdgeInsets.all(10.0),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tell us what is wrong and how it can be fixed',
                helperText: 'Keep it short, and to the point.',
                labelText: 'Describe the Problem',
              ),
              maxLines: 3,
            ),
            DropDownButtonPage(),
            
          ],
        ));
  }
}

class DropDownButtonPage extends StatefulWidget {
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonPage> {
  String _value = "";


  DropdownButton _itemDown() => DropdownButton<String>(
        hint: Text(
          "Please select the type of problem!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        items: [
          DropdownMenuItem(
            value: "1",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.build),
                SizedBox(width: 10),
                Text(
                  "Problem Type 1",
                ),
              ],
            ),
          ),
          DropdownMenuItem(
            value: "2",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.settings),
                SizedBox(width: 10),
                Text(
                  "Problem Type 2",
                ),
              ],
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _value = value?? "";
          });
        },
        value: _value,
        isExpanded: true,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        child: Column(
          children: <Widget>[
            _itemDown(),
          ],
        ),
      );
  }
}

