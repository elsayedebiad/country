import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Components/cpuntrry.dart';
import '../models/country_data_model.dart';
import '/services/API.dart';

class FootballDetils extends StatefulWidget {
  const FootballDetils({super.key,required});


  @override
  State<FootballDetils> createState() => _FootballDetilsState();
}

class _FootballDetilsState extends State<FootballDetils> {

  List<CountryDataModel> CounteryData = [];

  @override
  void initState()  {
     getCounterygenral();
    super.initState();
  }

  Future<void> getCounterygenral() async {
    CounteryData = await Service(Dio()).getCountries();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1a1a),
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80,
        backgroundColor: Color(0xff222223),
        title: Text(
          "Select Country",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: Column(
        children: [

          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.90,
              child: ListView.builder(
                itemCount: CounteryData.length,
                itemBuilder: (context, index) {
                  return Country(countrydata: CounteryData[index],);
                },),
            ),
          ),



        ],
      ),
    );
  }

}