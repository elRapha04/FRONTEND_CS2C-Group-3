import 'package:flutter/material.dart';
import 'package:frontend_appdev/pages/Login.dart';
import 'pages/Login.dart';
import 'pages/LandingPage.dart';
import 'pages/Sign_up.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/landing',
  routes: {
    '/landing': (context) => LandingPage(),
    '/login': (context) => Login(),
    '/sign_up': (context) => SignUp(),
  },
));
