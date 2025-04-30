import 'package:flutter/material.dart';

import 'package:frontend_appdev/components/home_widgets/payment.dart';
import 'package:frontend_appdev/components/home_widgets/featured.dart';
import 'package:frontend_appdev/components/home_widgets/NavBar.dart';
import 'package:frontend_appdev/components/home_widgets/search.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF00B2FF), size: 37),
        leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.person),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationSearchPage()),
              );
            }, // Go to search screen
          ),
        ],
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              PaymentCard(),
              featured(),
            ],
          ),
        ),
      ),
    );
  }
}
