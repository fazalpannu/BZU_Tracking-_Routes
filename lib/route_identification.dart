// Data model for BusRoute
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusRoute {
  final String name;

  final List<String> stops;

  BusRoute({required this.name, required this.stops});
}

// List of bus routes
List<BusRoute> busRoutes = [
  BusRoute(
    name: "Mumtazabad Route (161)",
    stops: [
      "Shed",
      "Campus Area",
      "Main Gate",
      "Chungi No. 9",
      "Qasim Fort",
      "Fish Market Mor",
      "Doulat Gate",
      "Hafiz Jamal",
      "Mair Plaza",
      "Chungi No. 14",
      "Ahmad Abad",
      "Mona Grammar School",
      "Mumtazabad Market",
      "Lateef-u-Allah Chowk",
      "Ganda Nala",
      "BCG Chowk",
      "Back Chungi No.9 Main Gate",
      "Transport Shed"
    ],
  ),
  // Add other routes in the same way
  BusRoute(
    name: "Buch Willaz School Duty (986)",
    stops: [
      "Shed",
      "Main Gate",
      "Buch Willaz",
      "Manik Wala",
      "Back Buch Willaz Main Gate",
      "Campus Model School",
      "Back Shed"
    ],
  ),
  BusRoute(
    name: "Eid Gah Route (106)",
    stops: [
      "Shed",
      "Main Gate",
      "Chungi No. 9",
      "Eid Gah",
      "Sial Hotel",
      "Billal Motors",
      "Rasheedabad",
      "Fly Over Stop",
      "Ali Hospital",
      "Joya Pump",
      "Wapda",
      "Multan Pump",
      "Chowk Kumharan Wala",
      "Qasuri Chowk",
      "Mehr Wala",
      "Basti Shorkot",
      "MDA Colony",
      "Nangana Chowk",
      "Multan Public School",
      "Agri. Gate",
      "Campus Area",
      "Shed"
    ],
  ),
  BusRoute(
    name: "19 Kasi Route",
    stops: [
      "Shed",
      "Campus Area",
      "Agri. Gate",
      "Qasuri Chowk",
      "Vihari Chowk",
      "Wapda Gate",
      "Kawaja Grech Nawaz",
      "Allah Towakal",
      "CNG Pump",
      "Al-Noor Gali",
      "Sultan Ghee Mill",
      "Garden City",
      "17 Kasi",
      "Siyam Officer City",
      "Kot Rab Nawaz",
      "18 Kasi",
      "Motor Way",
      "Gareeb Abad",
      "19 Kasi",
      "Purana Karkhana",
      "Basti Pull Chatha",
      "Pull Sadhu",
      "Hasmi Chowk",
      "Makdoom Rashid",
      "Back Agri Gate",
      "Shed"
    ],
  ),

  BusRoute(
    name: "School Duty 5572",
    stops: [
      "Shed",
      "Campus Area",
      "Bahadur Pur",
      "Markaz Mehmood Kot",
      "Al-Sadiq Mehmood Kot",
      "By Pass",
      "Toyota Show Room",
      "Shalimar",
      "Sabza Zar",
      "Nasheman Colony",
      "Zameer Public School",
      "Chungi No. 6",
      "Comprehensive School",
      "Goal Bag",
      "Khurshid Colony",
      "Chungi No. 9",
      "Back Shuttle No.2"
    ],
  ),
  // ... other routes ...
];

// UI Component for displaying routes
class RoutesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Routes')),
      body: ListView.builder(
        itemCount: busRoutes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(busRoutes[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RouteDetailScreen(route: busRoutes[index]),
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

// Route Detail Screen
class RouteDetailScreen extends StatelessWidget {
  final BusRoute route;

  RouteDetailScreen({required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
                child: Text(
              'Route Name: ${route.name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Card(
                child: Text('Stops: ${route.stops.join(', ')}',
                    style: TextStyle(fontWeight: FontWeight.w500))),
          ],
        ),
      ),
    );
  }
}
