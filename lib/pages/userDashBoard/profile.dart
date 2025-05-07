import 'package:flutter/material.dart';
import 'package:frontend_appdev/components/Button.dart';

class Profile2 extends StatefulWidget {
  const Profile2({super.key});

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  final double coverHeight = 190;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00B2FF),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF00B2FF)),
          title: Text("Profile", style: TextStyle(color: Color(0xFF00B2FF))),
        ),
        body: ListView(
          children: [
            buildTop(),
            buildContent(),
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
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.asset("assets/Rent2.jpg",width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: 77,
    backgroundColor: Color(0xFF00B2FF),
    child: CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Color(0xFF00B2FF),
      backgroundImage: AssetImage("assets/profile.jpg")),
  );
  Widget buildContent() => SingleChildScrollView(
    child: Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          Text('Username',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          Text('username@example.com',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(
            height: 10,
          ),
          MyButtons(
            text: 'Account Information',
          ),
          SizedBox(
            height: 7,
          ),
          MyButtons(
            text: 'Funtion',
          ),
          SizedBox(
            height: 7,
          ),
          MyButtons(
            text: 'Function',
          ),
          SizedBox(
            height: 7,
          ),
          MyButtons(
            text: 'Function',
          ),
          SizedBox(
            height: 7,
          ),
          MyButtons(
            text: 'Funtion',
          ),
          SizedBox(
            height: 7,
          ),
          MyButtons(
            text: 'Function',
          ),
          SizedBox(
            height: 7,
          ),
          MyButtons(
            text: 'Function',
          ),
        ],
      ),
    ),
  );
}
