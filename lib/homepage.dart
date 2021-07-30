import 'dart:convert';
import 'package:covid19/pages/QuizPage.dart';
import 'package:covid19/pages/StatesPage.dart';
import 'package:covid19/datasource.dart';
import 'package:covid19/pages/resource_page.dart';
import 'package:covid19/panels/worldwidepanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData;

  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/gov/India'));
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;

  fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://disease.sh/v3/covid-19/countries?sort=cases'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("COVID-19 TRACKER"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30, left: 10),
              child: Row(
                children: [
                  Text(
                    'Hii there,',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child:
                        new Image.asset('assets/images/Mask.png', height: 80),
                  )
                ],
              ),
            ),

            Container(
                padding: EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  "Most affected Countries",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
            countryData == null
                ? CircularProgressIndicator()
                : Container(
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 10,
                            width: 150,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                ],
                                borderRadius: BorderRadius.circular(28),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: GradientColors.blue,
                                )),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                    child: Container(
                                        padding:
                                            EdgeInsets.only(left: 90, top: 90),
                                        child: Image.network(
                                          countryData[index]['countryInfo']
                                              ['flag'],
                                          height: 20,
                                        ))),
                                Positioned(
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(top: 60, left: 15),
                                      child: Text(
                                        'Country: ' +
                                            countryData[index]['country'],
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                                Positioned(
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(top: 135, left: 15),
                                      child: Text(
                                          'Deaths: ' +
                                              countryData[index]['deaths']
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold))),
                                )
                              ],
                            ),
                          );
                        })),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "INDIA:",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatesPage()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "View More",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldwidePanel(
                    worldData: worldData,
                  ),
            Container(
              // padding: EdgeInsets.only(top: 40,left: 10,right: 10),
              // height: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizPage()));
                        },
                        child: new Center(child: Text('TAKE TEST')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResourcePage()));
                        },
                        child: new Center(
                          child: FittedBox(
                            child: Text(
                              'ADDITIONAL RESOURCES',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
