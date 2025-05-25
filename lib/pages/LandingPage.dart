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
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;
            final isPortrait = screenHeight > screenWidth;
            final isLargeScreen = screenWidth > 600;

            return Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isLargeScreen ? screenWidth * 0.1 : 20,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: isLargeScreen ? 120 : 100,
                          child: ClipOval(
                            child: Image(image: AssetImage('assets/logo.png')),
                          ),
                        ),
                        SizedBox(height: isLargeScreen ? 100 : 90),
                        Text(
                          'Get started',
                          style: TextStyle(
                            fontSize: isLargeScreen ? 64 : 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: AppFonts.primaryFont,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Find your ideal rental today!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isLargeScreen ? 18 : 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.primaryFont,
                          ),
                        ),
                        SizedBox(height: isLargeScreen ? 40 : 30),
                        _buildAuthButton(
                          context: context,
                          width: isLargeScreen ? screenWidth * 0.4 : 315,
                          text: 'Login',
                          route: '/login',
                          isLargeScreen: isLargeScreen,
                        ),
                        SizedBox(height: isLargeScreen ? 25 : 20),
                        _buildAuthButton(
                          context: context,
                          width: isLargeScreen ? screenWidth * 0.4 : 315,
                          text: 'Create an account',
                          route: '/sign_up',
                          isLargeScreen: isLargeScreen,
                        ),
                        SizedBox(height: isLargeScreen ? 140 : 120),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAuthButton({
    required BuildContext context,
    required double width,
    required String text,
    required String route,
    required bool isLargeScreen,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: width,
        height: isLargeScreen ? 60 : 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x3b3b3b).withOpacity(0.44),
              offset: const Offset(0, 7),
              blurRadius: 4,
              spreadRadius: -2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isLargeScreen ? 26 : 24,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.primaryFont,
            ),
          ),
        ),
      ),
    );
  }
}