import 'package:flutter/material.dart';
import 'package:frontend_appdev/pages/Login.dart';
import 'package:frontend_appdev/pages/userDashBoard/home_page.dart';
import 'pages/LandingPage.dart';
import 'pages/Sign_up.dart';
import 'package:frontend_appdev/pages/Admin/ownerPage.dart';
import 'package:frontend_appdev/pages/userDashBoard/profile.dart';
import 'services/api_service.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/landing',
  routes: {
    '/landing': (context) => LandingPage(),
    '/login': (context) => Login(),
    '/sign_up': (context) => SignUp(),
    '/home_page': (context) => home_page(),
    '/owner': (context) => OwnerManager(),
    '/profile': (context) => Profile2(),

  },
));
