import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({super.key});

  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  final Completer<GoogleMapController>  _controller=Completer();
  static CameraPosition initialPosition=CameraPosition(
    target: LatLng(37.42796133580664,-122.085749655962),zoom: 14.0);
  static CameraPosition targetPostiion=CameraPosition(
    target: LatLng(37.43296265331129,-122.08832357078792),zoom: 14.0,bearing: 192.0,tilt: 60 );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text('button'),
        icon: Icon(Icons.location_on_rounded),
        ),
    );
  }
  Future<void> goToLake()async{
   final GoogleMapController controller=await _controller.future;
   controller.animateCamera(CameraUpdate.newCameraPosition(targetPostiion));
  }
}