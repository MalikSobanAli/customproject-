// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class SearchPlacesScreen extends StatefulWidget {
//   const SearchPlacesScreen({super.key});

//   @override
//   State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
// }
// const kGoogleApiKey='';
// class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
//   static CameraPosition initialCameraPosition=CameraPosition(target:LatLng(34.1688,73.2215));
//   Set<Marker> markersList={};
//   final Mode _mode=Mode.overlay;
//   late GoogleMapController googleMapController;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google search places'),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: initialCameraPosition,
//             markers:markersList,
//             mapType: MapType.hybrid,
//             onMapCreated: (GoogleMapController controller) {
//               googleMapController=controller;
//             },
//           ),
//           ElevatedButton(onPressed: _handlePressButton, child: Text(''))
//         ],
//       ),
//     );
//   }
//   Future<void> _handlePressButton()async{
//    Prediction? p= await PlacesAutocomplete.show(context: context, apiKey: kGoogleApiKey,onError:onError,mode: _mode);
//   }
// }