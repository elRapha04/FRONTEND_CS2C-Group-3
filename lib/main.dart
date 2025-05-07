import 'package:flutter/material.dart';
import 'package:frontend_appdev/pages/Login.dart';
import 'package:frontend_appdev/pages/userDashBoard/home_page.dart';
import 'pages/LandingPage.dart';
import 'pages/Home.dart';
import 'pages/Sign_up.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/home_page',
  routes: {
    '/landing': (context) => LandingPage(),
    '/login': (context) => Login(),
    '/sign_up': (context) => SignUp(),
    '/home_page': (context) => home_page(),
    '/home': (context) => Home(),

  },
));
