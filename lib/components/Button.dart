import 'package:flutter/material.dart';
import 'package:frontend_appdev/pages/Login.dart';
import 'package:frontend_appdev/pages/userDashBoard/home_page.dart';

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
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
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

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF00B2FF),
            ),
            onPressed: () {},
            child: Text(
              'See more',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            )));
  }
}

class NoButton extends StatelessWidget {
  const NoButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => home_page()),
              );
            },
            child: Text(
              'No',
              style: TextStyle(
                  color: Color(0xFF00B2FF),
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            )));
  }
}

class YesButton extends StatelessWidget {
  const YesButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 125,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(
                  color: Color(0xFF00B2FF),
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            )));
  }
}

class MyButtons extends StatelessWidget {
  final String text;

  const MyButtons({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.cyan,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

