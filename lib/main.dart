import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      color: Colors.blue,
      home: new Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 0), () {
      checkFirstSeen();
    });
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MyAppState()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new NewClass()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text('Loading...'),
          ],
        ),
      ),
    );
  }

}

class NewClass extends StatefulWidget {

  @override
  _NewClass createState() => new _NewClass();  
}

class _NewClass extends State<NewClass> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text('Please provide Permissions'),
            new MaterialButton(
              child: new Text('Allow Permissions'),
              onPressed: () {
                _askPermission();
              },
            )
          ],
        ),
      ),
    );
  }

  PermissionStatus _permissionStatus = PermissionStatus.permanentlyDenied;

  void _askPermission() {
    Permission.storage.request().then((value) => _onStatusRequested(PermissionStatus.values));
  }

  void _onStatusRequested(List<PermissionStatus> statuses) {
    final status = statuses.firstWhere((element) => element == PermissionStatus.granted);
    if (status == null || status != PermissionStatus.granted) {
      openAppSettings();
    } else {
      _updateStatus(status?? PermissionStatus.denied);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MyAppState()));
    }
  }

  void _updateStatus(PermissionStatus status) {
    if (status != _permissionStatus) {
      setState(() {
        _permissionStatus = status;
      });
    }
  }

  void initState() {
    super.initState();
    Permission.storage.request().then((x) => {
      if (x.isGranted) {
        _updateStatus(PermissionStatus.granted)
      }
    });
  }
}
