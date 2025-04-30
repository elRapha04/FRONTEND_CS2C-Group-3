import 'package:flutter/material.dart';
import 'package:frontend_appdev/components/Button.dart';

class featured extends StatelessWidget {
  const featured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(style: BorderStyle.none),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              "Featured",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00B2FF),
              ),
            ),
          ),
          Container(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image(image: AssetImage("assets/Rental1.jpg"), height: 170, fit: BoxFit.cover,)
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    Text(
                      "Rental name",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00B2FF),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    Text(
                      "Description",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF00B2FF),
                      ),
                    ),
                  ],
                ),
              )
            ]),
            width: double.infinity,
            height: 250,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SeeMoreButton(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
