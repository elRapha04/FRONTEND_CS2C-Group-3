import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const MyTextField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        child: TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16,
            fontFamily: AppFonts.primaryFont,
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red, // Red border for error state
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red, // Red border for focused error state
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const EmailField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324,
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyle(
          color: AppColors.primary,
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red, // Red border for error state
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red, // Red border for focused error state
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PasswordField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyle(
          color: AppColors.primary,
          fontFamily: AppFonts.primaryFont,
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red, // Red border for error state
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red, // Red border for focused error state
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PhoneField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyle(
          color: AppColors.primary,
          fontFamily: AppFonts.primaryFont,
        ),
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only digits
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red, // Red border for error state
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red, // Red border for focused error state
            ),
          ),
        ),
      ),
    );
  }
}
