import 'package:flutter/material.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';
import '../services/api_service.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                      child: ClipOval(
                          child: Image(image: AssetImage('assets/logo.png', ))
                      )
                  ),
                  SizedBox(height: 90,),
                  Text(
                    'Get started',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      fontFamily: AppFonts.primaryFont,
                    ),
                  ),
                  Text(
                    'Find your ideal rental today!',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: AppFonts.primaryFont,),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Container(
                      width: 315,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Color(0x3b3b3b).withOpacity(0.44),
                          offset: Offset(0, 7),
                          blurRadius: 4,
                          spreadRadius: -2,
                        )],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Login',
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.primaryFont,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                    child: Container(
                      width: 315,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Color(0x3b3b3b).withOpacity(0.44),
                          offset: Offset(0, 7),
                          blurRadius: 4,
                          spreadRadius: -2,
                        )],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Create an account',
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.primaryFont,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
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
