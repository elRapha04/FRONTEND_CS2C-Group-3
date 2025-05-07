import 'package:flutter/material.dart';

// Import specific location pages
import 'package:frontend_appdev/pages/Rentals/RentalLocations/bulua.dart';
import 'package:frontend_appdev/pages/Rentals/RentalLocations/lapasan.dart';
import 'package:frontend_appdev/pages/Rentals/RentalLocations/carmen.dart';
import 'package:frontend_appdev/pages/Rentals/RentalLocations/kauswagan.dart';

class LocationSearchPage extends StatefulWidget {
  @override
  _LocationSearchPageState createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  final TextEditingController _controller = TextEditingController();
  bool showSuggestions = false;

  final List<String> locations = [
    'Bulua',
    'Lapasan',
    'Carmen',
    'Kauswagan',
  ];

  List<String> filteredLocations = [];

  void _onSearchPressed() {
    FocusScope.of(context).unfocus();
    setState(() {
      showSuggestions = true;
      _filterLocations();
    });
  }

  void _filterLocations() {
    String query = _controller.text.toLowerCase();
    setState(() {
      filteredLocations = locations.where((location) {
        return location.toLowerCase().startsWith(query);
      }).toList();
    });
  }

  void _navigateToLocation(String locationName) {
    Widget destination;

    switch (locationName) {
      case 'Bulua':
        destination = BuluaPage();
        break;
      case 'Lapasan':
        destination = LapasanPage();
        break;
      case 'Carmen':
        destination = CarmenPage();
        break;
      case 'Kauswagan':
        destination = KauswaganPage();
        break;
      default:
        destination = LocationResultPage(location: locationName); // fallback
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (showSuggestions) {
        _filterLocations();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF00B2FF)),
        title: Text("Search Rentals"),
        backgroundColor: Color(0xFF00B2FF),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Real Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Color(0xFF00B2FF)),
                    hintText: 'Search location...',
                    hintStyle: TextStyle(color: Color(0xFF00B2FF)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            // Suggestions list
            if (showSuggestions)
              Expanded(
                child: filteredLocations.isNotEmpty
                    ? ListView.builder(
                  itemCount: filteredLocations.length,
                  itemBuilder: (context, index) {
                    String location = filteredLocations[index];
                    return ListTile(
                      title: Text(
                        location,
                        style: TextStyle(color: Color(0xFF00B2FF)),
                      ),
                      onTap: () => _navigateToLocation(location),
                    );
                  },
                )
                    : Center(
                  child: Text(
                    'No location found',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

            // Search Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSearchPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00B2FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Search for rentals',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Fallback result page
class LocationResultPage extends StatelessWidget {
  final String location;

  LocationResultPage({required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$location Rentals'),
        backgroundColor: Color(0xFF00B2FF),
      ),
      body: Center(
        child: Text(
          'Showing rentals for $location',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
