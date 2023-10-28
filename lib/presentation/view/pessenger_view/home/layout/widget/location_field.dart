import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../configuration/frontend_configs.dart';

class LocationField extends StatelessWidget {
  LocationField(
      {Key? key,
      required this.svg,
      required this.lat,
      required this.map_controller,
      required this.hint,
      required this.marker,
      required this.text_controller,
      required this.inputType})
      : super(key: key);
  final String svg;
  final String hint;
  Completer<GoogleMapController> map_controller;
  TextInputType inputType;
  List<Marker> marker;
  LatLng lat;
  TextEditingController text_controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: TextFormField(
        keyboardType: inputType,
        controller: text_controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              color: FrontendConfigs.kIconColor,
              fontSize: 14,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: FrontendConfigs.kAuthColor,
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () async {
                getUserCurrentLocation().then((value) async {
                  print(
                      lat.latitude.toString() + " " + lat.longitude.toString());

                  // marker added for current users location
                  marker.add(Marker(
                    markerId: MarkerId("2"),
                    position: LatLng(lat.latitude, lat.longitude),
                    infoWindow: InfoWindow(
                      title: 'My Current Location',
                    ),
                  ));

                  // specified current users location
                  CameraPosition cameraPosition = new CameraPosition(
                    target: LatLng(lat.latitude, lat.longitude),
                    zoom: 14,
                  );

                  final GoogleMapController controller =
                      await map_controller.future;
                  controller.animateCamera(
                      CameraUpdate.newCameraPosition(cameraPosition));
                  // setState(() {});
                  text_controller.text = "${lat.latitude} " "${lat.longitude}";
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    // var pos = await Geolocator.getCurrentPosition();
    return await Geolocator.getCurrentPosition();
  }
}
