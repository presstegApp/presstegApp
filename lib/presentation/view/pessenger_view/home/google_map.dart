// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// //   Position position = await Geolocator.getCurrentPosition();
// //   GoogleMapController controller = await mapController.future;
// // controller.moveCamera(CameraUpdate.newLatLng(position.latitude, position.longitude));

// //  Future<void> _getUserLocation() async {
// //     Position position = await Geolocator.getCurrentPosition();

// //     marker = Marker(
// //       position: LatLng(position.latitude, position.longitude),
// //       title: 'My Location',
// //     );

// //     if (mapController != null) {
// //       mapController!.moveCamera(CameraUpdate.newLatLng(position.latitude, position.longitude));
// //     }
// //   }

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GeolocateExample extends StatefulWidget {
//   @override
//   _GeolocateExampleState createState() => _GeolocateExampleState();
// }

// class _GeolocateExampleState extends State<GeolocateExample> {
//   Position? _currentPosition;
//   GoogleMapController? _mapController;

//   Future<void> _getCurrentLocation() async {
//     // Get the user's current location.
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     // Update the state with the new location.
//     setState(() {
//       _currentPosition = position;
//     });

//     // Move the map camera to the user's current location.
//     if (_mapController != null) {
//       _mapController!.animateCamera(CameraUpdate.newCameraPosition(
//           CameraPosition(
//               target: LatLng(
//                   _currentPosition!.latitude, _currentPosition!.longitude),
//               zoom: 15)));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Geolocate Example'),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//                 target: LatLng(37.4220041, -122.0826149), zoom: 14),
//             onMapCreated: (GoogleMapController controller) {
//               _mapController = controller;
//             },
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                     'Your current location: ${_currentPosition?.latitude}, ${_currentPosition?.longitude}'),
//                 SizedBox(height: 10),
                
//       // on pressing floating action button the camera will take to user current location
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async{
//           getUserCurrentLocation().then((value) async {
//             print(value.latitude.toString() +" "+value.longitude.toString());
 
//             // marker added for current users location
//             _markers.add(
//                 Marker(
//                   markerId: MarkerId("2"),
//                   position: LatLng(value.latitude, value.longitude),
//                   infoWindow: InfoWindow(
//                     title: 'My Current Location',
//                   ),
//                 )
//             );
 
//             // specified current users location
//             CameraPosition cameraPosition = new CameraPosition(
//               target: LatLng(value.latitude, value.longitude),
//               zoom: 14,
//             );
 
//             final GoogleMapController controller = await _controller.future;
//             controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//             setState(() {
//             });
//           });
//         },
//         child: Icon(Icons.local_activity),
//       ),,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
