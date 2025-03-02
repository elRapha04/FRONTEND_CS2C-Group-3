import 'package:flutter/material.dart';
import 'package:frontend_appdev/components/text_field.dart';
import 'package:frontend_appdev/components/Button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // Add padding to avoid overlap with the keyboard
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // First Name and Last Name Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First Name',
                            style: TextStyle(
                              fontSize: screenWidth * 0.06, // Responsive font size
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF00B2FF),
                            ),
                          ),
                          const MyTextField(),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03), // Responsive spacing
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Name',
                            style: TextStyle(
                              fontSize: screenWidth * 0.06, // Responsive font size
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF00B2FF),
                            ),
                          ),
                          const MyTextField(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // Email Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter email',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF00B2FF),
                      ),
                    ),
                    const EmailField(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // Create Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Password',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF00B2FF),
                      ),
                    ),
                    const PasswordField(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // Confirm Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF00B2FF),
                      ),
                    ),
                    const PasswordField(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // Phone Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF00B2FF),
                      ),
                    ),
                    const PhoneField(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // Sign Up Button
                const ButtonSignUp(),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // Already have an account? Text
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      color: const Color(0xFF00B2FF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}