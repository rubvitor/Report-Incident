/* import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MyMap extends StatefulWidget{
  @override 
  _MyMap createState() =>  _MyMap();
}

class _MyMap extends State<MyMap> {

  LocationData _startLocation;
  LocationData _currentLocation;

  StreamSubscription<LocationData> _locationSubscription;

  Location _locationService  = new Location();
  bool _permission = false;
  String error;

  bool currentWidget = true;

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  LocationData currentLocation;

   GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(
        '[{"elementType":"geometry","stylers":[{"color":"#242f3e"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#746855"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#242f3e"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#263c3f"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#6b9a76"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#38414e"}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#212a37"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#9ca5b3"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#746855"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#1f2835"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#f3d19c"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#2f3948"}]},{"featureType":"transit.station","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#17263c"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#515c6d"}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"color":"#17263c"}]}]');
  }
  Map<String, double> userLocation;
  
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 11.0,
            ));
  }

  initPlatformState() async {
    await _locationService.changeSettings(accuracy: LocationAccuracy.HIGH, interval: 1000);
    
    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();

          _locationSubscription = _locationService.onLocationChanged().listen((LocationData result) async {
            _currentCameraPosition = CameraPosition(
              target: LatLng(result.latitude, result.longitude),
              zoom: 16
            );

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(_currentCameraPosition));            

            if(mounted){
              setState(() {
                _currentLocation = result;
              });
            }
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if(serviceStatusResult){
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }

    setState(() {
        _startLocation = location;
    });}

}
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'config.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMap createState() => new _MyMap();
}

class _MyMap extends State<MyMap> {
  LocationData _startLocation;
  LocationData _currentLocation;

  StreamSubscription<LocationData> _locationSubscription;

  Location _locationService  = new Location();
  bool _permission = false;
  String error;

  bool currentWidget = true;

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(0, 0),
    zoom: 4,
  );

  CameraPosition _currentCameraPosition;

  GoogleMap googleMap; 

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    await _locationService.changeSettings(accuracy: LocationAccuracy.HIGH, interval: 1000);
    
    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();

          _locationSubscription = _locationService.onLocationChanged().listen((LocationData result) async {
            _currentCameraPosition = CameraPosition(
              target: LatLng(result.latitude, result.longitude),
              zoom: 16
            );

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(_currentCameraPosition));            

            if(mounted){
              setState(() {
                _currentLocation = result;
              });
            }
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if(serviceStatusResult){
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }

    setState(() {
        _startLocation = location;
    });

  }

  slowRefresh() async {
    _locationSubscription.cancel();
    await _locationService.changeSettings(accuracy: LocationAccuracy.BALANCED, interval: 10000);
    _locationSubscription = _locationService.onLocationChanged().listen((LocationData result) {
      if(mounted){
        setState(() {
          _currentLocation = result;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;

    googleMap = GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      initialCameraPosition: _initialCamera,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );


    widgets = [
      Center(
          child: SizedBox(
            height: 300.0,
            child: googleMap
          ),
      ),
    ];
    

    widgets.add(new Center(
        child: new Text(_startLocation != null
            ? 'Start location: ${_startLocation.latitude} & ${_startLocation.longitude}\n'
            : 'Error: $error\n')));

    widgets.add(new Center(
        child: new Text(_currentLocation != null
            ? 'Continuous location: \nlat: ${_currentLocation.latitude} & long: ${_currentLocation.longitude} \nalt: ${_currentLocation.altitude}m\n'
            : 'Error: $error\n', textAlign: TextAlign.center)));

    widgets.add(new Center(
      child: new Text(_permission 
            ? 'Has permission : Yes' 
            : "Has permission : No")));

    widgets.add(new Center(
      child: new RaisedButton(
        child: new Text("Slow refresh rate and accuracy"),
        onPressed: () => slowRefresh()
      )
    ));

    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Location plugin example app'),
            ),
            body: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            ),
            floatingActionButton: new FloatingActionButton(
              onPressed: () => _locationSubscription.cancel(),
              tooltip: 'Stop Track Location',
              child: Icon(Icons.stop),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        )
      );
  }
}

