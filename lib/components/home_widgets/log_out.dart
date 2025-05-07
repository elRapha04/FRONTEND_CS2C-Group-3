import 'package:flutter/material.dart';
import 'package:frontend_appdev/components/Button.dart';
import 'package:frontend_appdev/pages/userDashBoard/home_page.dart';
import 'package:frontend_appdev/pages/Login.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Optional for better visuals
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Color(0xFF00B2FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.exit_to_app, size: 100, color: Colors.white),
              SizedBox(height: 16),
              Text(
                "You are about to logout.\nAre you sure this is what you want to do?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogOutButtons(
                      text: "No",
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home_page()));
                      },
                  ),
                  SizedBox(width: 10),
                  LogOutButtons(
                    text: "Logout",
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login() ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
