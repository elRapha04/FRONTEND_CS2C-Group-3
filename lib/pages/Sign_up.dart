import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For jsonEncode
import 'package:frontend_appdev/components/text_field.dart';
import 'package:frontend_appdev/components/Button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Form key for validation
    final _formKey = GlobalKey<FormState>();

    // Controllers for text fields
    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
    TextEditingController();
    final TextEditingController _phoneController = TextEditingController();

    Future<void> _signUp() async {
      if (_formKey.currentState!.validate()) {
        // Prepare the data to send
        final Map<String, dynamic> data = {
          'first_name': _firstNameController.text,
          'last_name': _lastNameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'phone_number': _phoneController.text,
        };

        // Make the HTTP POST request
        final response = await http.post(
          Uri.parse('http://127.0.0.1:8000/api/accounts/signup/'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data),
        );

        // Handle the response
        if (response.statusCode == 201) {
          // Sign up successful
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign Up Successful')),
          );
          // Optionally navigate to another page
          Navigator.pushNamed(context, '/login');
        } else {
          // Sign up failed
          final responseData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['error'] ?? 'Sign Up Failed')),
          );
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
            child: Form(
              key: _formKey,
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
                                fontSize:
                                screenWidth * 0.06, // Responsive font size
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF00B2FF),
                              ),
                            ),
                            MyTextField(
                              controller: _firstNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.1), // Responsive spacing
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name',
                              style: TextStyle(
                                fontSize:
                                screenWidth * 0.06, // Responsive font size
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF00B2FF),
                              ),
                            ),
                            MyTextField(
                              controller: _lastNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
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
                      EmailField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
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
                      PasswordField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
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
                      PasswordField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
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
                      PhoneField(
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your phone";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  // Sign Up Button
                  ButtonSignUp(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with sign-up logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sign Up Successful')),
                        );
                      }
                    },
                  ),
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
      ),
    );
  }
}
