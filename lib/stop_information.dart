import 'package:flutter/material.dart';

class RouteInfo {
  final String title;
  final List<String> stops;

  RouteInfo(this.title, this.stops);
}

class BusStopList extends StatelessWidget {
  final List<RouteInfo> routes = [
    RouteInfo(
      "Mumtazabad Route (161)",
      [
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
    RouteInfo(
      "Buch Willaz School Duty (986)",
      [
        "Shed",
        "Main Gate",
        "Buch Willaz",
        "Manik Wala",
        "Back Buch Willaz Main Gate",
        "Campus Model School",
        "Back Shed"
      ],
    ),
    RouteInfo(
      "Eid Gah Route (106)",
      [
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
    RouteInfo(
      "19 Kasi Route",
      [
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

    RouteInfo(
      "School Duty 5572",
      [
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

    RouteInfo(
      "Mumtazabad Route (161)",
      [
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
        "Transport Shed",
      ],
    ),
    RouteInfo(
      "7 Up Route 1004",
      [
        "Shed to Main Gate",
        "Northern By Pass",
        "Faiz-e-Aam Chowk",
        "Chungi No.4",
        "Sewra Chowk",
        "Raza Abad",
        "Suraj Miani to Back Pull Wasal",
        "Jameel Abad",
        "Chungi No.1",
        "Nishter Chowk",
        "7up Factory",
        "MDA",
        "Toll Workshop",
        "Peeran Sab",
        "Pull Bararan",
        "Allah Safi Chowk",
        "Rahmat Colony",
        "Lodhy Colony",
        "Nishat School",
        "Nishat College",
        "Chungi No.4",
        "National Bank",
        "Chungi No.5",
        "Khan Street",
        "Nawan Bhutta",
        "Wagey Wala",
        "Nawab Pur By Pass",
        "Schdan Wala By Pass",
        "Main Gate",
        "Campus Area to Shed",
      ],
    ),
    RouteInfo(
      "Qasim Bela 148 (A)",
      [
        "Shed to Main Gate",
        "Chungi No.9",
        "High Court",
        "Cant Area",
        "Qasim Bela",
        "Ali Park to Back Shaheen Chowk",
        "Cant Area",
        "CMII Chowk",
        "High Court",
        "Tariq Road",
        "Nishter Mor",
        "Kachary fly over",
        "Chungi No.9",
        "Main Gate",
        "Campus Arca",
        "Agri. Eng. to Shed",
      ],
    ),
    RouteInfo(
      "Qasim Bela 148 (B)",
      [
        "Shed to Campus Area",
        "Main Gate",
        "Chungi No.9",
        "Tariq Road",
        "High Court",
        "CMH Chowk",
        "Mall Plaza",
        "Bijli Ghar Chowk",
        "sher shah Road",
        "Grass Mandi",
        "MGM Club",
        "4 Ghora Chowk",
        "Jheel",
        "Shaheen Chowk",
        "Dhamaka Chowk",
        "Qasim Bela to Back Shaheen Chowk",
        "Cant Area",
        "CMH Chowk",
        "Kachery Fly over",
        "Chungi No.9",
        "Main Gate to Shed",
      ],
    ),
    RouteInfo(
      "Qasim Bela 149",
      [
        "Shed to Main Gate",
        "Chungi No.9",
        "High Court",
        "Cant Area",
        "Qasim Bela to Back Check Post",
        "Shaheen Chowk",
        "Ghora Chowk",
        "CMH",
        "Baba Gareeb Shah",
        "Account School",
        "Bijli Ghar Chowk",
        "Aziz Hotel Chowk",
        "Cant",
        "SP Chowk",
        "High Court Chowk",
        "Tariq Road",
        "Kachery Fly Over",
        "Chungi No.9",
        "Main Gate to Shed",
      ],
    ),
    // ... (other routes)

    RouteInfo(
      "16. Qasim Bela 148 (C)",
      [
        "Shed to Main Gate",
        "Chungi No.9",
        "High Court",
        "Cant Area",
        "Qasim Bela to Back Check Post",
        "Shaheen Chowk",
        "Ghora Chowk",
        "CMH",
        "Kachary fly over",
        "Nawan Shehr to Back Shaheen Chowk",
        "Allah Safi Chowk",
        "Rahmat Colony",
        "Lodhy Colony",
        "Nishat School",
        "Nishat College",
        "Chungi No.4",
        "National Bank",
        "Chungi No.5",
        "Khan Street",
        "Nawan Bhutta",
        "Wagey Wala",
        "Nawab Pur By Pass",
        "Schdan Wala By Pass",
        "Main Gate",
        "Campus Area",
        "Shed",
      ],
    ),
    RouteInfo(
      "17. Wapda Town Route (149-A)",
      [
        "Shed to Main Gate",
        "Chungi No.9",
        "High Court",
        "Cant Area",
        "Qasim Bela to Back Check Post",
        "Shaheen Chowk",
        "Ghora Chowk",
        "CMH",
        "Baba Gareeb Shah",
        "Account School",
        "Bijli Ghar Chowk",
        "Aziz Hotel Chowk",
        "Cant",
        "SP Chowk",
        "High Court Chowk",
        "Tariq Road",
        "Kachery Fly Over",
        "Chungi No.9",
        "Main Gate",
        "Wapda Town",
        "Shed",
      ],
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Stop Information'),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(routes[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BusStopDetails(busStop: routes[index]),
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

class BusStopDetails extends StatelessWidget {
  final RouteInfo busStop;

  BusStopDetails({required this.busStop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(busStop.title),
      ),
      body: ListView.builder(
        itemCount: busStop.stops.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Column(
                children: [
                  // Text(
                  //   ' Details :',
                  //   textAlign: TextAlign.left,
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  Text(
                    '$index) ' + busStop.stops[index] + '\n',
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
