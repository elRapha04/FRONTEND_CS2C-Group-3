import 'package:flutter/material.dart';

class PaymentCard extends StatefulWidget {
  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  DateTime _nextPayment = DateTime(2025, 2, 25);
  double _totalAmount = 0.00;

  void _editPaymentDetails() async {
    final result = await showDialog(
      context: context,
      builder: (context) => EditPaymentDialog(
        initialDate: _nextPayment,
        initialAmount: _totalAmount,
      ),
    );

    if (result != null) {
      setState(() {
        _nextPayment = result['date'];
        _totalAmount = result['amount'];
      });
    }
  }

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
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.edit, color: Colors.white),
              onPressed: _editPaymentDetails,
            ),
          ),
        ],
      ),
    );
  }
}

class EditPaymentDialog extends StatefulWidget {
  final DateTime initialDate;
  final double initialAmount;

  EditPaymentDialog({
    required this.initialDate,
    required this.initialAmount,
  });

  @override
  _EditPaymentDialogState createState() => _EditPaymentDialogState();
}

class _EditPaymentDialogState extends State<EditPaymentDialog> {
  late DateTime selectedDate;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    amountController =
        TextEditingController(text: widget.initialAmount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Payment Info'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                  "Next Payment: ${selectedDate.toLocal().toString().split(' ')[0]}"),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Total Amount"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            final editedData = {
              'date': selectedDate,
              'amount': double.tryParse(amountController.text) ??
                  widget.initialAmount,
            };
            Navigator.pop(context, editedData);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
