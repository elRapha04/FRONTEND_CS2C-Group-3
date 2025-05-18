import 'package:flutter/material.dart';

class PaymentCard extends StatefulWidget {
  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final DateTime _nextPayment = DateTime(2025, 2, 25);
  final double _totalAmount = 0.00;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF00B2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Next Payment:",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text(
            "${_nextPayment.month.toString().padLeft(2, '0')}/${_nextPayment.day.toString().padLeft(2, '0')}/${_nextPayment.year}",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Divider(color: Colors.white),
          SizedBox(height: 10),
          Text("Total Amount:",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text(
            "₱ ${_totalAmount.toStringAsFixed(2)}",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Divider(color: Colors.white),
        ],
      ),
    );
  }
}
