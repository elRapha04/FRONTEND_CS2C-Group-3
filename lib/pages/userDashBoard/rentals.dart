import 'package:flutter/material.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';
import 'package:frontend_appdev/pages/Rentals/booking.dart';

class Rental {
  final String name;
  final String description;
  final String imagePath;
  final Widget Function() destination;

  Rental(this.name, this.description, this.imagePath, this.destination);
}

class RentalCarouselPage extends StatelessWidget {
  final Map<String, List<Rental>> rentalSections = {
    "": [
      Rental("Luxury Loft", "Modern and spacious", "assets/Rent2.jpg", () => RentalInfoScreen(name: "Luxury Loft", description: "Modern and spacious")),
      Rental("Cozy Cabin", "Perfect for a weekend getaway", "assets/Rent2.jpg", () => RentalInfoScreen(name: "Cozy Cabin", description: "Perfect for a weekend getaway")),
      Rental("City Apartment", "In the heart of downtown", "assets/Rent2.jpg", () => RentalInfoScreen(name: "City Apartment", description: "In the heart of downtown")),
    ],
    "Rentals in your area": [
      Rental("Suburban Home", "Great for families", "assets/Rent2.jpg", () => RentalInfoScreen(name: "Suburban Home", description: "Great for families")),
      Rental("Studio Flat", "Affordable and convenient", "assets/Rent2.jpg", () => RentalInfoScreen(name: "Studio Flat", description: "Affordable and convenient")),
      Rental("Shared Apartment", "Ideal for students", "assets/Rent2.jpg", () => RentalInfoScreen(name: "Shared Apartment", description: "Ideal for students")),
    ],
    "Vacation Rentals": [
      Rental("Beach House", "Steps from the shore", "assets/Rent2.jpg", () => RentalInfoScreen(name: "Beach House", description: "Steps from the shore")),
      Rental("Mountain Lodge", "Breathtaking views", "assets/Rent2.jpg", () => RentalInfoScreen(name: "Mountain Lodge", description: "Breathtaking views")),
      Rental("Lake Cottage", "Peaceful and private", "assets/Rent2.jpg", () => RentalInfoScreen(name: "Lake Cottage", description: "Peaceful and private")),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Rentals', style: TextStyle(color: AppColors.primary, fontFamily: AppFonts.primaryFont)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rentalSections.entries.map((entry) {
            final title = entry.key;
            final rentals = entry.value;
            return buildSection(title, rentals, context);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Rental> rentals, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.primaryFont,
                ),
              ),
            ),
          SizedBox(height: 10),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rentals.length,
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => rentals[index].destination()),
                        );
                      },
                      child: buildRentalCard(rentals[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRentalCard(Rental rental) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              rental.imagePath,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rental.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontFamily: AppFonts.primaryFont,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  rental.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontFamily: AppFonts.primaryFont,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RentalInfoScreen extends StatelessWidget {
  final String name;
  final String description;

  const RentalInfoScreen({required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    const lightBlue = AppColors.primary;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: lightBlue),
        backgroundColor: Colors.white,
        title: Text(name, style: TextStyle(color: lightBlue, fontFamily: AppFonts.primaryFont)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Text("img", style: TextStyle(fontFamily: AppFonts.primaryFont))),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  '₱ 999.00',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: lightBlue,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(name, style: TextStyle(fontSize: 20, color: lightBlue, fontFamily: AppFonts.primaryFont,),),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  description,
                  style: TextStyle(fontFamily: AppFonts.primaryFont, fontSize: 16, color: lightBlue, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookRentalScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
