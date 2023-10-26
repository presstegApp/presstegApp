import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:geolocator/geolocator.dart';

import 'layout/bottom_sheets/pick_up_sheet.dart';
import 'layout/widget/home_field.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final TextEditingController _pickUpController = TextEditingController();
  final TextEditingController _dropLocationController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  BitmapDescriptor? destinationIcon;
  Position? currentLocation;
      Future<void> getCurrentLocation() async {
  currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  // Set<Marker> markers = {};
   


  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future setSourceAndDestinationIcons() async {
    final Uint8List icon1 =
    await getBytesFromAsset('assets/images/driver_marker.png', 240);

    destinationIcon = await BitmapDescriptor.fromBytes(icon1);
    setState(() {});
    return Future.value(true);
  }
  @override
  void initState() {
    // setSourceAndDestinationIcons().then((value) {
    //   markers.addAll([
    //     Marker(
    //         markerId: const MarkerId('2'),
    //         position: const LatLng(37.42796133580664, -122.085749655962),
    //         icon: destinationIcon!),
    //     // Polyline(polylineId: )
    //   ]);
    //   setState(() {});
    // });
    // Timer(
    //     const Duration(seconds: 3),
    //         () => piUpLocationBottomSheet(context));

    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _currentLocation = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(currentLocation!.latitude, currentLocation!.longitude),
      // tilt: 59.440717697143555,
      // zoom: 19.151926040649414
      );
    // print(markers.length);
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          mapToolbarEnabled: false,
          // markers: markers,
          initialCameraPosition: _currentLocation,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        SlidingUpPanel(
          minHeight:200,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          panel: Padding(
            padding: const EdgeInsets.symmetric(horizontal:18),
            child: Column(
              children: [
                const SizedBox(height:12,),
                Container(
                  alignment: Alignment.center,
                  height: 3,
                  width: 36,
                  decoration: BoxDecoration(
                    color:const Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height:18,),
                HomeField(
                    svg: 'assets/svg/pickup_icon.svg',
                    hint: 'Enter your pickup location',
                    controller: _pickUpController,
                    inputType: TextInputType.text),
                const SizedBox(height:18,),
                HomeField(
                    svg: 'assets/svg/location_icon.svg',
                    hint: 'Where you want to go?',
                    controller: _dropLocationController,
                    inputType: TextInputType.text)
              ],
            ),
          ),
        )
      ]),
    );
  }
}



//////////////////
///**
///
//
// import 'package:geolocator/geolocator.dart';
/*
StreamSubscription<ServiceStatus> serviceStatusStream = Geolocator.getServiceStatusStream().listen(
    (ServiceStatus status) {
        print(status);
    });*/