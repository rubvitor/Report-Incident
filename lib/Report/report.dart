import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReportForm(),
    );
  }
  
}

class ReportForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 24.0),
        const SizedBox(height: 24.0),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Tell us what is wrong and how it can be fixed',
            helperText: 'Keep it short, and to the point.',
            labelText: 'Describe the Problem',
          ),
          maxLines: 3,
        ),
        new DropdownButton<String>(
          items: <String>['A', 'B', 'C', 'D'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        )
      ],
    );
  }
}
