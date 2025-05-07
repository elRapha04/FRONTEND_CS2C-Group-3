import 'package:flutter/material.dart';

class RentalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const lightBlue = Color(0xFF00B2FF);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow
              Icon(Icons.arrow_back, color: lightBlue),

              SizedBox(height: 16),

              // Image placeholder
              Center(
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('img')),
                ),
              ),

              SizedBox(height: 24),

              // Price and star row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₱ 999.00',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: lightBlue,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: lightBlue, size: 23),
                      SizedBox(width: 4),
                      Text(
                        '5',
                        style: TextStyle(
                          color: lightBlue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 8),

              // Location
              Text(
                'Hillside, Lapasan, Cagayan de Oro City Near Centrio',
                style: TextStyle(
                  fontSize: 20,
                  color: lightBlue,
                ),
              ),

              SizedBox(height: 12),

              // Description
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '2 bed space. Open floor plan with natural light. Shared bathroom. All utilities included, . . .',
                      style: TextStyle(
                        fontSize: 20,
                        color: lightBlue,
                      ),
                    ),
                  ),
                  Icon(Icons.circle, size: 6, color: lightBlue),
                ],
              ),

              Spacer(),

              // Continue Button
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
