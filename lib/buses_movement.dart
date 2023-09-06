import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:http/http.dart' as http;

import 'package:bzu_online_route_tracking_app/model/track_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

class PolylineWidget extends StatefulWidget {
  String name;
  PolylineWidget({super.key, required this.name});
  @override
  _PolylineWidgetState createState() => _PolylineWidgetState();
}

class _PolylineWidgetState extends State<PolylineWidget> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _marker = {};
  final Set<Polyline> _poline = {};
  late String speed;
  late String position;
  late String engine;
  late String location;
  void updateMapWithLocation(double lat, double lng) {
    _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(lat, lng)),
      );
    });

    getBytesFromAsset('img/buses.png', 100).then((value) {
      String reg = widget.name;
      _marker.clear();
      _marker.add(Marker(
        icon: BitmapDescriptor.fromBytes(value),
        markerId: MarkerId('11'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "Speed: $speed",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Handle option 1
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Location:        $location",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Handle option 2
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Status:    $position",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Handle option 2
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Engine no:   $engine",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Handle option 2
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          title: 'Current Location $reg',
          snippet: 'Please Tap Onit!',
        ),
      ));

      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: 'basic_channel',
              title: 'Stop Notification',
              body: '$location',
              actionType: ActionType.Default));
    });
    // setState(() {});
  }

  late Stream<bzuapi> _dataStream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataStream = fetchDataStream();
    load();
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

  Stream<bzuapi> fetchDataStream() async* {
    while (true) {
      final response = await http.get(Uri.parse(
          'http://utracking.com.pk/ts_apis/TrackerLastRecord?apiKey=IGQVO-Y4HG-5FBG&loginName=BZU123'));
      var data = json.decode(response.body.toString());
      if (response.statusCode == 200) {
        yield bzuapi.fromJson(data);
      }
      await Future.delayed(
          Duration(seconds: 10)); // Delay before fetching again
    }
  }

  void load() async {
    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Container(
    //       padding: EdgeInsets.all(16),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           ListTile(
    //             title: Text("Speed: $speed"),
    //             onTap: () {
    //               // Handle option 1
    //               Navigator.pop(context); // Close the bottom sheet
    //             },
    //           ),
    //           ListTile(
    //             title: Text("Location $location"),
    //             onTap: () {
    //               // Handle option 2
    //               Navigator.pop(context); // Close the bottom sheet
    //             },
    //           ),
    //           ListTile(
    //             title: Text("Status $position"),
    //             onTap: () {
    //               // Handle option 2
    //               Navigator.pop(context); // Close the bottom sheet
    //             },
    //           ),
    //           ListTile(
    //             title: Text("Engine $engine"),
    //             onTap: () {
    //               // Handle option 2
    //               Navigator.pop(context); // Close the bottom sheet
    //             },
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
    final List<LatLng> _latng = <LatLng>[
      LatLng(30.261476749957936, 71.50695290901895),
      LatLng(30.261992131408448, 71.50703736183044),
      LatLng(30.267848534016345, 71.50400761066551),
      LatLng(30.267701699469413, 71.51005938182965),
      LatLng(30.272908335352035, 71.51065418182986),
      LatLng(30.277496559131485, 71.50850326833752),
      LatLng(30.27444068097505, 71.50983223843077),
      LatLng(30.27474306851874, 71.50654103765065),
      LatLng(30.27474306851874, 71.50654103765065),
    ];
    _poline.add(Polyline(
        polylineId: PolylineId('1'),
        points: _latng,
        color: Colors.cyan,
        startCap: Cap.squareCap,
        endCap: Cap.squareCap));
    setState(() {});
    for (var i = 0; i < _latng.length; i++) {
      final Uint8List makericon = await getBytesFromAsset('img/line.png', 100);
      _marker.add(Marker(
        icon: BitmapDescriptor.fromBytes(makericon),
        markerId: MarkerId('$i'),
        position: _latng[i],
        infoWindow:
            InfoWindow(title: ' Location' '$i', snippet: '5 Star Rating'),
      ));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: _dataStream,
          builder: (context, AsyncSnapshot<bzuapi> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Colors.blue,
                ),
              );
            }
            if (snapshot.hasError) {
              return Text('Some Error !');
            }

            if (snapshot.data!.searchIDs!.isNotEmpty) {
              double latitude = 0.0;
              double longitude = 0.0;
              String re = widget.name;

              for (int i = 0; i < snapshot.data!.searchIDs!.length; i++) {
                if (widget.name ==
                    snapshot.data!.searchIDs![i].regNo.toString()) {
                  latitude = double.parse(
                      snapshot.data!.searchIDs![i].latitude.toString());
                  longitude = double.parse(
                      snapshot.data!.searchIDs![i].longitude.toString());
                  speed = snapshot.data!.searchIDs![i].speed.toString();
                  location = snapshot.data!.searchIDs![i].location.toString();
                  position =
                      snapshot.data!.searchIDs![i].ignitionOnOff.toString();
                  engine = snapshot.data!.searchIDs![i].engineNo.toString();
                }
              }

              getBytesFromAsset('img/buses.png', 100).then((value) {
                _marker.clear();
                _marker.add(Marker(
                  icon: BitmapDescriptor.fromBytes(value),
                  markerId: MarkerId('11'),
                  position: LatLng(latitude, longitude),
                  infoWindow: InfoWindow(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    "Speed:   $speed",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    // Handle option 1
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    "Location:     $location",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    // Handle option 2
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    "Status:   $position",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    // Handle option 2
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    "Engine no:  $engine",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    // Handle option 2
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    title: 'Current Location $re',
                    snippet:
                        'Speed $speed\nStatus $position\nEngine $engine\nLocation $location\n',
                  ),
                ));
              });

              updateMapWithLocation(latitude, longitude);
            } else {
              return GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: LatLng(0, 0), zoom: 14.4746),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set<Marker>.of(_marker),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                compassEnabled: true,
                mapType: MapType.normal,
                polylines: _poline,
              );
            }

            return GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(0, 0), zoom: 14.4746),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set<Marker>.of(_marker),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              mapType: MapType.normal,
              polylines: _poline,
            );
          },
        ),
      ),
    );
  }
}
