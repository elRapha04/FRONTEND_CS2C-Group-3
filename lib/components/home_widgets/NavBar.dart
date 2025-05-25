import 'package:flutter/material.dart';
import 'package:frontend_appdev/components/home_widgets/log_out.dart';
import 'package:frontend_appdev/pages/userDashBoard/profile.dart';
import 'package:frontend_appdev/pages/userDashBoard/transaction.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';


class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary,
      child: ListView(
        children: [
          Container(
            color: AppColors.primary,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30, color: Colors.grey,),
                ),
                SizedBox(height: 10),
                Text(
                  "Your Name",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: AppFonts.primaryFont, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "your.email@example.com",
                  style: TextStyle(color: Colors.white70, fontSize: 20, fontFamily: AppFonts.primaryFont,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 20,
              color: Colors.white,
            ),
            title: Text("Profile",
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: AppFonts.primaryFont,)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile2())
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.compare_arrows,
              size: 20,
              color: Colors.white,
            ),
            title: Text("Transaction",
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: AppFonts.primaryFont,)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionScreen())),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 20,
              color: Colors.white,
            ),
            title: Text("Logout",
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: AppFonts.primaryFont,)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LogOut()),
              );
            },
          ),
        ],
      ),
    );
  }
}
