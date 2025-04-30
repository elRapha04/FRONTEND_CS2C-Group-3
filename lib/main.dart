import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:frontend_appdev/pages/Login.dart';
import 'package:frontend_appdev/pages/userDashBoard/home_page.dart';
=======
>>>>>>> 5500cb3d3454308619414a83c6b02f328f817a25
import 'pages/LandingPage.dart';
import 'pages/Login.dart';
import 'pages/Home.dart';
import 'pages/Sign_up.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/landing',
  routes: {
    '/landing': (context) => LandingPage(),
    '/login': (context) => Login(),
    '/sign_up': (context) => SignUp(),
<<<<<<< HEAD
    '/home': (context) => home_page(),
=======
    '/home': (context) => Home(),
>>>>>>> 5500cb3d3454308619414a83c6b02f328f817a25
  },
));
