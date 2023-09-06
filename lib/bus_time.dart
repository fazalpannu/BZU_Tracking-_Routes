import 'package:flutter/material.dart';

class BusRoute {
  final String title;
  final List<BusStop> stops;

  BusRoute({required this.title, required this.stops});
}

class BusStop {
  final String name;
  final TimeOfDay time;

  BusStop({required this.name, required this.time});
}

class Busestime extends StatelessWidget {
  final List<BusRoute> busRoutes = [
    BusRoute(
      title: "Mumtazabad Route (161)",
      stops: [
        BusStop(name: 'Campus Area', time: TimeOfDay(hour: 8, minute: 0)),
        BusStop(name: 'Main Gate', time: TimeOfDay(hour: 8, minute: 10)),
        BusStop(name: 'Chungi No. 9', time: TimeOfDay(hour: 8, minute: 20)),
        BusStop(name: 'Qasim Fort', time: TimeOfDay(hour: 8, minute: 30)),
        BusStop(name: 'Fish Market Mor', time: TimeOfDay(hour: 8, minute: 40)),
        BusStop(name: 'Doulat Gate', time: TimeOfDay(hour: 8, minute: 50)),
        // ... Add more stops and times here ...
        BusStop(name: 'BCG Chowk', time: TimeOfDay(hour: 9, minute: 30)),
        BusStop(
            name: 'Back Chungi No.9 Main Gate',
            time: TimeOfDay(hour: 9, minute: 40)),
        BusStop(name: 'Transport Shed', time: TimeOfDay(hour: 9, minute: 50)),
      ],
    ),
    BusRoute(
      title: "Buch Willaz School Duty (986)",
      stops: [
        BusStop(name: 'Shed', time: TimeOfDay(hour: 8, minute: 0)),
        BusStop(name: 'Main Gate', time: TimeOfDay(hour: 8, minute: 10)),
        BusStop(name: 'Buch Willaz', time: TimeOfDay(hour: 8, minute: 20)),
        BusStop(name: 'Manik Wala', time: TimeOfDay(hour: 8, minute: 30)),
        BusStop(
            name: 'Back Buch Willaz Main Gate',
            time: TimeOfDay(hour: 8, minute: 40)),
        BusStop(
            name: 'Campus Model School', time: TimeOfDay(hour: 8, minute: 50)),
        BusStop(name: 'Back Shed', time: TimeOfDay(hour: 9, minute: 0)),
      ],
    ),
    BusRoute(
      title: "Eid Gah Route (106)",
      stops: [
        BusStop(name: 'Shed', time: TimeOfDay(hour: 8, minute: 0)),
        BusStop(name: 'Main Gate', time: TimeOfDay(hour: 8, minute: 10)),
        BusStop(name: 'Chungi No. 9', time: TimeOfDay(hour: 8, minute: 20)),
        BusStop(name: 'Eid Gah', time: TimeOfDay(hour: 8, minute: 30)),
        BusStop(name: 'Sial Hotel', time: TimeOfDay(hour: 8, minute: 40)),
        // ... Add more stops and times here ...
        BusStop(name: 'Agri. Gate', time: TimeOfDay(hour: 9, minute: 40)),
        BusStop(name: 'Campus Area', time: TimeOfDay(hour: 9, minute: 50)),
        BusStop(name: 'Shed', time: TimeOfDay(hour: 10, minute: 0)),
      ],
    ),

    BusRoute(
      title: "19 Kasi Route",
      stops: [
        BusStop(name: 'Shed', time: TimeOfDay(hour: 8, minute: 0)),
        BusStop(name: 'Campus Area', time: TimeOfDay(hour: 8, minute: 10)),
        // ... Add more stops and times here ...
        BusStop(name: 'Makdoom Rashid', time: TimeOfDay(hour: 9, minute: 50)),
        BusStop(name: 'Back Agri Gate', time: TimeOfDay(hour: 10, minute: 0)),
        BusStop(name: 'Shed', time: TimeOfDay(hour: 10, minute: 10)),
      ],
    ),

    BusRoute(
      title: "School Duty 5572",
      stops: [
        BusStop(name: 'Shed', time: TimeOfDay(hour: 8, minute: 0)),
        BusStop(name: 'Campus Area', time: TimeOfDay(hour: 8, minute: 10)),
        // ... Add more stops and times here ...
        BusStop(name: 'Chungi No. 9', time: TimeOfDay(hour: 9, minute: 40)),
        BusStop(
            name: 'Back Shuttle No.2', time: TimeOfDay(hour: 9, minute: 50)),
      ],
    ),

    // Add more bus routes...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Timings')),
      body: ListView.builder(
        itemCount: busRoutes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(busRoutes[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BusDetailScreen(route: busRoutes[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class BusDetailScreen extends StatelessWidget {
  final BusRoute route;

  BusDetailScreen({required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(route.title)),
      body: ListView.builder(
        itemCount: route.stops.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(route.stops[index].name),
              subtitle: Text(
                  'Time: ${route.stops[index].time.hour}:${route.stops[index].time.minute.toString().padLeft(2, '0')}'),
            ),
          );
        },
      ),
    );
  }
}
