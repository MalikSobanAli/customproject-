import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;
   static CameraPosition initialCameraPosition=CameraPosition(
    target: LatLng(33.5651,73.0169),zoom: 14.0);
    Set<Marker> markers={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Location"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType:MapType.normal,
        onMapCreated: (GoogleMapController controller) {
           googleMapController=controller;
        },
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: ()async{
          Position position= await _determinePostion();
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude,position.longitude),
                zoom: 14.0),));
         
          setState(() {
             markers.clear();
          markers.add(Marker(markerId: MarkerId('Current Location'),position: LatLng(position.latitude,position.longitude),
             icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange,
                ),
          ));  
          });
        }, 
        label: Text('Current Location'),
        icon: Icon(Icons.location_history),
        ),
    );
  }
  Future<Position> _determinePostion()async{
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled= await Geolocator.isLocationServiceEnabled();
  if(!serviceEnabled){
    return Future.error('Location is not Enabled');
  }
   permission= await Geolocator.checkPermission();
   if(permission==LocationPermission.denied){
    permission= await Geolocator.requestPermission();
    if(permission==LocationPermission.denied){
      return Future.error('Location Permission Denied');
    }
   }
   if(permission==LocationPermission.deniedForever){
    return Future.error('Location Permission Denied Forever');
   }
   Position position=await Geolocator.getCurrentPosition();
   return position;
  }
}