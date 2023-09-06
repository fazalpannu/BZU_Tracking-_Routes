import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

class getcurrentlocation extends StatefulWidget {
  double ltg, lng;
  getcurrentlocation({super.key, required this.ltg, required this.lng});

  @override
  State<getcurrentlocation> createState() => _getcurrentlocationState();
}

class _getcurrentlocationState extends State<getcurrentlocation> {
  Completer<GoogleMapController> _controller = Completer();

  void getcurrentlocation1() async {
    getBytesFromAsset('img/buses.png', 100).then((value) {
      _marker.clear();
      _marker.add(Marker(
        icon: BitmapDescriptor.fromBytes(value),
        markerId: MarkerId('11'),
        position: LatLng(widget.ltg, widget.lng),
        infoWindow: InfoWindow(
          title: 'Current Location BZU Route',
          snippet: '5 Star Rating',
        ),
      ));
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentlocation1();
  }

  final Set<Marker> _marker = {};
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.ltg, widget.lng), zoom: 17.4746),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_marker),
          myLocationEnabled: true,
          compassEnabled: true,
          mapType: MapType.normal,
        ),
      ),
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(
      format: ui.ImageByteFormat.png,
    ))!
        .buffer
        .asUint8List();
  }
}
