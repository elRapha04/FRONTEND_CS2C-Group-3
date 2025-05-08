import 'package:flutter/material.dart';

class RentalItem {
  final String imagePath; // Path to asset image
  final double price;
  final int rating;
  final String location;

  RentalItem({
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.location,
  });
}

class LapasanPage extends StatelessWidget {
  final List<RentalItem> rentalItems = [
    RentalItem(
      imagePath: 'assets/Rent2.jpg',
      price: 999.00,
      rating: 5,
      location: "Cagayan de Oro - Rental A",
    ),
    RentalItem(
      imagePath: 'assets/Rent2.jpg',
      price: 850.00,
      rating: 4,
      location: "Iligan City - Rental B",
    ),
    RentalItem(
      imagePath: 'assets/Rent2.jpg',
      price: 1100.00,
      rating: 5,
      location: "Davao City - Rental C",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "Lapasan",
            style: TextStyle(color: Colors.blue, fontSize: 14),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: rentalItems.length,
        itemBuilder: (context, index) {
          return RentalBox(item: rentalItems[index]);
        },
      ),
    );
  }
}

class RentalBox extends StatelessWidget {
  final RentalItem item;

  const RentalBox({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.cyan),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₱ ${item.price.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, size: 20, color: Colors.blue),
                      SizedBox(width: 4),
                      Text("${item.rating}", style: TextStyle(color: Colors.blue, fontSize: 20,)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(item.location, style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
