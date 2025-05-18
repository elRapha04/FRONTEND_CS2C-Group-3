import 'package:flutter/material.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';
import 'package:frontend_appdev/components/Button.dart';
import '../../services/api_service.dart';
import 'package:intl/intl.dart';

class Profile2 extends StatefulWidget {
  const Profile2({super.key});

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  final double coverHeight = 190;
  final double profileHeight = 144;

  String gender = "Select gender"; // Set default to match dropdown options
  DateTime? dateOfBirth = DateTime(2005, 5, 15);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primary),
          backgroundColor: Colors.white,
          title: Text(
            "Profile",
            style: TextStyle(color: AppColors.primary),
          ),
        ),
        body: ListView(
          children: [
            buildTop(),
            SizedBox(height: 10),
            ...accountInformation(),
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.asset(
      "assets/Rent2.jpg",
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: 77,
    backgroundColor: AppColors.primary,
    child: CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: AppColors.primary,
      backgroundImage: AssetImage("assets/profile.jpg"),
    ),
  );

  List<Widget> accountInformation() {
    return [
      ListTile(
        title: Text("Email",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
        subtitle: Text("example@gmail",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
      ),
      Divider(thickness: 1, color: Colors.white, indent: 20, endIndent: 20),
      ListTile(
        title: Text("First Name",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
        subtitle: Text("Jhon",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
      ),
      Divider(thickness: 1, color: Colors.white, indent: 20, endIndent: 20),
      ListTile(
        title: Text("Last Name",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
        subtitle: Text("Doe",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
      ),
      Divider(thickness: 1, color: Colors.white, indent: 20, endIndent: 20),
      ListTile(
        title: Text("Phone",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
        subtitle: Text("0997657085",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
      ),
      Divider(thickness: 1, color: Colors.white, indent: 20, endIndent: 20),

      // Gender selection
      ListTile(
        title: Text("Gender",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
        subtitle: DropdownButton<String>(
          dropdownColor: AppColors.primary,
          value: gender,
          style: TextStyle(
              color: Colors.white,
              fontFamily: AppFonts.primaryFont,
              fontWeight: FontWeight.bold),
          underline: SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              gender = newValue!;
            });
          },
          items: ['Select gender', 'Male', 'Female', 'Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.bold)),
            );
          }).toList(),
        ),
      ),
      Divider(thickness: 1, color: Colors.white, indent: 20, endIndent: 20),

      // Date of Birth picker
      ListTile(
        title: Text("Date of Birth",
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold)),
        subtitle: InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: dateOfBirth ?? DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: ColorScheme.dark(
                      primary: AppColors.primary,
                      onPrimary: Colors.white,
                      surface: Colors.grey.shade900,
                      onSurface: Colors.white,
                    ),
                    dialogBackgroundColor: Colors.grey.shade800,
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              setState(() {
                dateOfBirth = picked;
              });
            }
          },
          child: Text(
            dateOfBirth != null
                ? DateFormat('MM/dd/yyyy').format(dateOfBirth!)
                : 'Select Date',
            style: TextStyle(
              color: Colors.white,
              fontFamily: AppFonts.primaryFont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Divider(thickness: 1, color: Colors.white, indent: 20, endIndent: 20),
    ];
  }
}
