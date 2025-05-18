import 'package:flutter/material.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';
import 'package:frontend_appdev/components/Button.dart';

class featured extends StatelessWidget {
  const featured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(style: BorderStyle.none),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Featured",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontFamily: AppFonts.primaryFont,
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    "assets/Rental1.jpg",
                    fit: BoxFit.cover,
                    height: 120,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rental Name",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                          fontFamily: AppFonts.primaryFont,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontFamily: AppFonts.primaryFont,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          SeeMoreButton(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
