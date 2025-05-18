import 'package:flutter/material.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';
import '../../services/api_service.dart';

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
        title: Text('Transactions', style: TextStyle(color: AppColors.primary, fontFamily: AppFonts.primaryFont,)),
        iconTheme: IconThemeData(
          color: AppColors.primary,
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
                    isHistorySelected ? AppColors.primary : Colors.white,
                    foregroundColor:
                    isHistorySelected ? Colors.white : AppColors.primary,
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('History', style: TextStyle(fontFamily: AppFonts.primaryFont,),),
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
                    !isHistorySelected ? AppColors.primary : Colors.white,
                    foregroundColor:
                    !isHistorySelected ? Colors.white : AppColors.primary,
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Pending', style: TextStyle(fontFamily: AppFonts.primaryFont,),),
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
        title: Text('Rental Name', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: AppFonts.primaryFont,)),
        trailing: Text('₱ 999.99', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
      ),
      Divider(
        thickness: 1,
        color: AppColors.primary,
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: AppFonts.primaryFont,)),
        trailing: Text('₱ 999.99', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
      ),
      Divider(
        thickness: 1,
        color: AppColors.primary,
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: AppFonts.primaryFont,)),
        trailing: Text('₱ 999.99', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
      ),
      Divider(
        thickness: 1,
        color: AppColors.primary,
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: AppFonts.primaryFont,)),
        trailing: Text('₱ 999.99', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
      ),
      Divider(
        thickness: 1,
        color: AppColors.primary,
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont,)),
        subtitle:
        Text('Jan 13 2025, 2:00 pm', style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: AppFonts.primaryFont)),
        trailing: Text('₱ 999.99', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont)),
      ),
      Divider(
        thickness: 1,
        color: AppColors.primary,
        indent: 20, // left spacing
        endIndent: 20,
      ),
    ];
  }

  List<Widget> pendingList() {
    return [
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Due: Jul 13 2025, 2:00 pm',
                style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: AppFonts.primaryFont)),
            Text('₱ 999.99',
                style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont))
          ],
        ),
        trailing: IconButton(
          onPressed:(){
            print("You click the delete button");
          },
          icon: Icon(Icons.close, color: AppColors.primary, size: 25,),
        ),
      ),
      Divider(
        thickness: 1,
        color: AppColors.primary,
        indent: 20, // left spacing
        endIndent: 20,
      ),
      ListTile(
        title: Text('Rental Name', style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Due: Jul 13 2025, 2:00 pm',
                style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: AppFonts.primaryFont)),
            Text('₱ 999.99',
                style: TextStyle(color: AppColors.primary, fontSize: 25, fontFamily: AppFonts.primaryFont))
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            print("You click the delete button");
          },
          icon: Icon(Icons.close, color: AppColors.primary, size: 25,),),
      ),
      Divider(
        thickness: 1,
        color: AppColors.primary,
        indent: 20, // left spacing
        endIndent: 20,
      ),
    ];
  }
}
