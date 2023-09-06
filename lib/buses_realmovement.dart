import 'dart:async';
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bzu_online_route_tracking_app/buses_movement.dart';
import 'package:bzu_online_route_tracking_app/driver/enter_location.dart';
import 'package:bzu_online_route_tracking_app/model/track_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class BusStop {
  final String title;
  final List<String> details;

  BusStop({required this.title, required this.details});
}

class Busesmovement extends StatefulWidget {
  @override
  _BusesmovementState createState() => _BusesmovementState();
}

class _BusesmovementState extends State<Busesmovement>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  late Stream<bzuapi> _dataStream; // Declare the stream variable
  bool _isVisible = true;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isVisible = false;
      });
    });
    _dataStream = fetchDataStream(); // Initialize the stream
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

  final List<BusStop> busStops = [
    BusStop(
      title: 'Mumtazabad Route (161)',
      details: [
        'Shed to Campus Area, Main Gate, Chungi No. 9...',
        // Add other details for this route
      ],
    ),
    BusStop(
      title: 'Buch Willaz School Duty (986)',
      details: [
        'Shed to Campus Area, Main Gate, Chungi No. 9...',
        // Add other details for this route
      ],
    ),
    BusStop(
      title: 'Eid Gah Route (106)',
      details: [
        'Shed to Campus Area, Main Gate, Chungi No. 9...',
        // Add other details for this route
      ],
    ),
    BusStop(
      title: '19 Kasi Route',
      details: [
        'Shed to Campus Area, Main Gate, Chungi No. 9...',
        // Add other details for this route
      ],
    ),
    BusStop(
      title: 'School Duty 5572',
      details: [
        'Shed to Campus Area, Main Gate, Chungi No. 9...',
        // Add other details for this route
      ],
    ),
    // Add other BusStop objects for other routes
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 127, 92, 216),
        title: Text(
          'Buses RealTime Movements',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: _dataStream,
                  builder: (context, AsyncSnapshot<bzuapi> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.black,
                          size: 50.0,
                          controller: _controller,
                        ),
                      );
                    } else {
                      // snapshot.data!.searchIDs!.length
                      return ListView.builder(
                        itemCount: snapshot.data!.searchIDs!.length,
                        itemBuilder: (context, index) {
                          double latitude = double.parse(snapshot
                              .data!.searchIDs![index].latitude
                              .toString());
                          double longitude = double.parse(snapshot
                              .data!.searchIDs![index].longitude
                              .toString());
                          String reg =
                              snapshot.data!.searchIDs![index].regNo.toString();
                          String location = snapshot
                              .data!.searchIDs![index].location
                              .toString();
                          return Card(
                              // color: Color.fromARGB(255, 193, 169, 250),
                              color: Colors.white,
                              child: AnimatedOpacity(
                                opacity: _isVisible ? 0.3 : 1.0,
                                duration: Duration(milliseconds: 500),
                                child: ListTile(
                                  // trailing: Text( snapshot.data!.searchIDs![index].location
                                  //       .toString()),
                                  leading: Image.asset('img/bus.png'),
                                  title: Text(
                                    'Route reg# ' + reg,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data!.searchIDs![index].location
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onTap: () {
                                    // AwesomeNotifications().createNotification(
                                    //     content: NotificationContent(
                                    //         id: 10,
                                    //         channelKey: 'basic_channel',
                                    //         title: 'Stop Notification',
                                    //         body: '$location',
                                    //         actionType: ActionType.Default));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PolylineWidget(name: reg),
                                      ),
                                    );
                                  },
                                ),
                              ));
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
