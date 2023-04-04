// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MyMapScreen extends StatefulWidget {
//   @override
//   _MyMapScreenState createState() => _MyMapScreenState();
// }

// class _MyMapScreenState extends State<MyMapScreen> {
//  late GoogleMapController googleMapController;
//   Position _currentPosition;
//   Set<Marker> _markers = {};

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     googleMapController = controller;
//   }

//   void _addMarker() {
//     setState(() {
//       _markers.add(
//         Marker(
//           markerId: MarkerId('current_location'),
//           position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
//         ),
//       );
//     });
//   }

//   void _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         _currentPosition = position;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
//               zoom: 14,
//             ),
//             markers: _markers,
//           ),
//           Positioned(
//             bottom: 16,
//             right: 16,
//             child: FloatingActionButton(
//               onPressed: _addMarker,
//               child: Icon(Icons.add_location),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
