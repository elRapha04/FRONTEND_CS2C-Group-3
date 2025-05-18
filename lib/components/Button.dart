import 'package:flutter/material.dart';
import 'package:frontend_appdev/pages/Login.dart';
import 'package:frontend_appdev/pages/userDashBoard/home_page.dart';
import 'package:frontend_appdev/pages/userDashBoard/rentals.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';

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
          backgroundColor: AppColors.primary,
        ),
        onPressed: onPressed,
        child: Text(
          'Create Account',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400, fontFamily: AppFonts.primaryFont,),
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
              backgroundColor: AppColors.primary,
            ),
            onPressed: () {},
            child: Text(
              'Create Account',
              style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
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
              backgroundColor: AppColors.primary,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RentalCarouselPage()));
            },
            child: Text(
              'See more',
              style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            )));
  }
}


class LogOutButtons extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const LogOutButtons({
    Key? key,
    required this.text,
    required this.onPressed,
}): super(key: key);
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
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
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
        color: AppColors.primary,
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
          fontSize: 16,
          fontFamily: AppFonts.primaryFont,
        ),
      ),
    );
  }
}

