import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  bool isHistorySelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions', style: TextStyle(color: Colors.cyan)),
        iconTheme: IconThemeData(
          color: Colors.cyan,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          // Two separate buttons with spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isHistorySelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isHistorySelected ? Color(0xFF00B2FF) : Colors.white,
                    foregroundColor:
                    isHistorySelected ? Colors.white : Color(0xFF00B2FF),
                    side: BorderSide(color: Color(0xFF00B2FF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('History'),
                ),
              ),
              SizedBox(width: 20), // spacing between buttons
              Container(
                width: 160,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isHistorySelected = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    !isHistorySelected ? Color(0xFF00B2FF) : Colors.white,
                    foregroundColor:
                    !isHistorySelected ? Colors.white : Color(0xFF00B2FF),
                    side: BorderSide(color: Color(0xFF00B2FF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Pending'),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: isHistorySelected ? historyList() : pendingList(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> historyList() {
    return [
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15,)),
        trailing: Text('₱ 999.99', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25)),
      ),
      Divider(
        thickness: 1,
        color: Color(0xFF00B2FF),
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15,)),
        trailing: Text('₱ 999.99', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25)),
      ),
      Divider(
        thickness: 1,
        color: Color(0xFF00B2FF),
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15)),
        trailing: Text('₱ 999.99', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25)),
      ),
      Divider(
        thickness: 1,
        color: Color(0xFF00B2FF),
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15,)),
        trailing: Text('₱ 999.99', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25)),
      ),
      Divider(
        thickness: 1,
        color: Color(0xFF00B2FF),
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15,)),
        trailing: Text('₱ 999.99', style: TextStyle(color: Color(0xFF00B2FF), fontSize: 25)),
      ),
      Divider(
        thickness: 1,
        color: Colors.cyan,
        indent: 20, // left spacing
        endIndent: 20,
      ),
    ];
  }

  List<Widget> pendingList() {
    return [
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: Colors.cyan, fontSize: 25,)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Due: Jul 13 2025, 2:00 pm',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
            Text('₱ 999.99',
                style: TextStyle(color: Colors.cyan, fontSize: 25))
          ],
        ),
        trailing: Icon(Icons.close, color: Colors.cyan, size: 25,),
      ),
      Divider(
        thickness: 1,
        color: Colors.cyan,
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: Colors.cyan, fontSize: 25)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Due: Jul 13 2025, 2:00 pm',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
            Text('₱ 999.99',
                style: TextStyle(color: Colors.cyan, fontSize: 25))
          ],
        ),
        trailing: Icon(Icons.close, color: Colors.cyan, size: 25,),
      ),
      Divider(
        thickness: 1,
        color: Colors.cyan,
        indent: 20, // left spacing
        endIndent: 20,
      ),
    ];
  }
}
