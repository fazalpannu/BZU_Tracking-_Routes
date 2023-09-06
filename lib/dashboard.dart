import 'package:bzu_online_route_tracking_app/bus_time.dart';
import 'package:bzu_online_route_tracking_app/buses_movement.dart';
import 'package:bzu_online_route_tracking_app/buses_realmovement.dart';
import 'package:bzu_online_route_tracking_app/detail_route.dart';
import 'package:bzu_online_route_tracking_app/main.dart';
import 'package:bzu_online_route_tracking_app/route_identification.dart';
import 'package:bzu_online_route_tracking_app/stop_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('Good Morning',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: CircleAvatar(
                    radius: 50,
                    child: Image.asset('img/buses.png'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                    'Detailed Route Information',
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BusRouteScreen()));
                    },
                    CupertinoIcons.list_bullet,
                    Colors.teal,
                  ),
                  itemDashboard('Stop Information', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BusStopList()));
                  }, CupertinoIcons.location_circle_fill, Colors.green),
                  itemDashboard('Timings of Each Bus', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Busestime()));
                  }, CupertinoIcons.time, Colors.purple),
                  // itemDashboard('Route Identification', () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => RoutesListScreen()));
                  // }, CupertinoIcons.bus, Colors.brown),
                  itemDashboard('Real-time Bus Movement', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Busesmovement()));
                  }, CupertinoIcons.map_pin_ellipse, Colors.indigo),
                  itemDashboard('Arrival Notifications', () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PolylineWidget()));
                  }, CupertinoIcons.bell, Colors.deepOrange),
                  itemDashboard('Stop Notifications', () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PolylineWidget()));
                  }, CupertinoIcons.bell_fill, Colors.red),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(
    String title,
    VoidCallback ontap,
    IconData iconData,
    Color background,
  ) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: ontap,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: Colors.white)),
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
      );
}
