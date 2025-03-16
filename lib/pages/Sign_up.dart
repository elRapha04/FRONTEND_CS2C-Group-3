import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For jsonEncode
import 'package:frontend_appdev/components/text_field.dart';
import 'package:frontend_appdev/components/Button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> data = {
        'first_name': _firstNameController.text,
        'last_name': _lastNameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'phone_number': _phoneController.text,
      };

      print("Sending request: $data");

      try {
        final response = await http.post(
          Uri.parse('http://192.168.1.32/:8000/api/accounts/register/'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data),
        );

        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Sign Up Successful')));
          Navigator.pushNamed(context, '/login');
        } else {
          final responseData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['error'] ?? 'Sign Up Failed')),
          );
        }
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.03),
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
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF00B2FF),
                                fontFamily: 'JosefinSlab',
                              ),
                            ),
                            MyTextField(
                              controller: _firstNameController,
                              validator:
                                  (value) =>
                                      value == null || value.isEmpty
                                          ? 'Please enter your first name'
                                          : null,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.1),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name',
                              style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF00B2FF),
                                fontFamily: 'JosefinSlab',
                              ),
                            ),
                            MyTextField(
                              controller: _lastNameController,
                              validator:
                                  (value) =>
                                      value == null || value.isEmpty
                                          ? 'Please enter your last name'
                                          : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter email',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF00B2FF),
                          fontFamily: 'JosefinSlab',
                        ),
                      ),
                      EmailField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter your email';
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Password',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF00B2FF),
                          fontFamily: 'JosefinSlab',
                        ),
                      ),
                      PasswordField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter a password';
                          if (value.length < 6)
                            return 'Password must be at least 6 characters';
                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF00B2FF),
                          fontFamily: 'JosefinSlab',
                        ),
                      ),
                      PasswordField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please confirm your password';
                          if (value != _passwordController.text)
                            return 'Passwords do not match';
                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF00B2FF),
                          fontFamily: 'JosefinSlab',
                        ),
                      ),
                      PhoneField(
                        controller: _phoneController,
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Enter your phone'
                                    : null,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ButtonSignUp(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _signUp();
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: const Color(0xFF00B2FF),
                        fontFamily: 'JosefinSlab',
                        fontWeight: FontWeight.bold,
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
