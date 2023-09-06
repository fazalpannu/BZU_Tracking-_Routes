// import 'package:bzu_online_route_tracking_app/buses_movement.dart';
// import 'package:bzu_online_route_tracking_app/driver/enter_location.dart';
// import 'package:flutter/material.dart';

// class BusStop {
//   final String title;
//   final List<String> details;

//   BusStop({required this.title, required this.details});
// }

// class drivermovement extends StatelessWidget {
//   final List<BusStop> busStops = [
//     BusStop(
//       title: 'Mumtazabad Route (161)',
//       details: [
//         'Shed to Campus Area, Main Gate, Chungi No. 9...',
//         // Add other details for this route
//       ],
//     ),
//     BusStop(
//       title: 'Buch Willaz School Duty (986)',
//       details: [
//         'Shed to Campus Area, Main Gate, Chungi No. 9...',
//         // Add other details for this route
//       ],
//     ),
//     BusStop(
//       title: 'Eid Gah Route (106)',
//       details: [
//         'Shed to Campus Area, Main Gate, Chungi No. 9...',
//         // Add other details for this route
//       ],
//     ),
//     BusStop(
//       title: '19 Kasi Route',
//       details: [
//         'Shed to Campus Area, Main Gate, Chungi No. 9...',
//         // Add other details for this route
//       ],
//     ),
//     BusStop(
//       title: 'School Duty 5572',
//       details: [
//         'Shed to Campus Area, Main Gate, Chungi No. 9...',
//         // Add other details for this route
//       ],
//     ),
//     // Add other BusStop objects for other routes
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Buses  Movements'),
//       ),
//       body: ListView.builder(
//         itemCount: busStops.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text(busStops[index].title),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         getcurrentlocation(name: busStops[index].title),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
