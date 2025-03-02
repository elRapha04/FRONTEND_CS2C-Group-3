import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150, // Ensures it takes full width within constrained parents
        child: TextField(
          style: TextStyle(
            color: Color(0xFF00B2FF),
            fontSize: 16,
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color(0xFF00B2FF),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color(0xFF00B2FF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: TextField(
        style: TextStyle(
          color: Color(0xFF00B2FF),
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFF00B2FF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFF00B2FF),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: TextField(
        style: TextStyle(
          color: Color(0xFF00B2FF),
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFF00B2FF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFF00B2FF),
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: TextField(
        style: TextStyle(
          color: Color(0xFF00B2FF),
        ),
        keyboardType: TextInputType.phone, // Use phone keyboard type
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only digits
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFF00B2FF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFF00B2FF),
            ),
          ),
        ),
      ),
    );
  }
}
