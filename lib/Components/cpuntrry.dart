import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/country_data_model.dart';

class Country extends StatelessWidget {
  const Country({super.key, required this.countrydata});
  final CountryDataModel countrydata;

  @override
  Widget build(BuildContext context) {
    {
      return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 10),
            width: MediaQuery.of(context).size.width*0.80,
            height: 250,
            decoration: BoxDecoration(
              // color: Colors.grey,
              image: DecorationImage(
                  image: countrydata.Image != null
                      ? NetworkImage(countrydata.Image!)
                      : NetworkImage(
                          "https://www.creativefabrica.com/wp-content/uploads/2019/03/Monogram-NO-Logo-Design-by-Greenlines-Studios-580x386.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(25),
            ),

          ),

          Container(

            margin: EdgeInsets.only(top: 10,left: 50,right: 50),
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
              color: Color(0xffE91C63),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              countrydata.CountryName,
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins',fontSize: 20),
            ),
          ),

        ],
      );
    }
    ;
  }
}
