import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://covid19responsefund.org/en';

class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  String bullet = "\u2022 ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Additional Resources"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue,
              child: ExpansionCard(
                borderRadius: 20,
                backgroundColor: Colors.teal,
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FittedBox(
                        child: Text(
                          "What is COVID-19?",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "COVID-19 is the disease caused by a new coronavirus called SARS-CoV-2.  WHO first learned of this new virus on 31 December 2019, following a report of a cluster of cases of ‘viral pneumonia’ in Wuhan, People’s Republic of China.",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue,
              child: ExpansionCard(
                borderRadius: 20,
                backgroundColor: Colors.teal,
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FittedBox(
                        child: Text(
                          "Symptoms of COVID-19",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${bullet}Fever",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                          Text("${bullet}Dry cough",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                          Text("${bullet}Fatigue",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                          Text("${bullet}Shortness of breath",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                          FittedBox(
                            child: Text(
                                "${bullet}Persistent pain or pressure in the chest",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ),
                          Text("${bullet}Sore throat",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue,
              child: ExpansionCard(
                borderRadius: 20,
                backgroundColor: Colors.teal,
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Safety Rules",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Stay safe by taking some simple precautions, such as physical distancing, wearing a mask, especially when distancing cannot be maintained, keeping rooms well ventilated, avoiding crowds and close contact, regularly cleaning your hands, and coughing into a bent elbow or tissue. Do it all!",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: new Image.asset("assets/images/family.png", height: 300),
          ),
          Center(
            child: Text(
              "Feeling Generous?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => _launchURL(),
              child: Text("DONATE!"),
            ),
          ),
        ],
      ),
    );
  }
}
