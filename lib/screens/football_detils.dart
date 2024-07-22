import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/models/return_football.dart';
import '../Components/cpuntrry.dart';
import '../models/country_data_model.dart';
import '/services/API.dart';

class FootballDetils extends StatefulWidget {
  const FootballDetils({super.key, required});

  @override
  State<FootballDetils> createState() => _FootballDetilsState();
}

class _FootballDetilsState extends State<FootballDetils> {
  List<CountryDataModel> CounteryData = [];

  @override
  void initState() {
    getCounterygenral();
    super.initState();
  }

  Future<void> getCounterygenral() async {
    CounteryData = await Service(Dio()).getCountries();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1a1a),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: 80,
        backgroundColor: Color(0xff222223),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Select Country",
                style: TextStyle(fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search_outlined),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.90,
                child: ListView.builder(
                  itemCount: CounteryData.length,
                  itemBuilder: (context, index) {
                    return ReturnFootball(
                      countrydata: CounteryData[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
