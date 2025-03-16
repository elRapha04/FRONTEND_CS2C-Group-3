import 'package:flutter/material.dart';

class ButtonSignUp extends StatelessWidget {
  final VoidCallback onPressed;

  const ButtonSignUp({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 313,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF00B2FF),
        ),
        onPressed: onPressed,
        child: Text(
          'Create Account',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'JosefinSlab'),
        ),
      ),
    );
  }
}

class ButtonSignUpAccount extends StatelessWidget {
  const ButtonSignUpAccount({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 313,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF00B2FF),
            ),
            onPressed: () {},
            child: Text(
              'Create Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            )));
  }
}
