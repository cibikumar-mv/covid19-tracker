import 'dart:convert';
import 'package:covid19/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatesPage extends StatefulWidget {
  @override
  _IndianStatesState createState() => _IndianStatesState();
}

class _IndianStatesState extends State<StatesPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: Search(countryData));
          })
        ],
        title: Text('All Countries '),
      ),
      body: countryData==null?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              // color: Colors.indigoAccent,
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(color: Colors.white30,boxShadow: [
                BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0,10)),
              ]),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                        Image.network(countryData[index]['countryInfo']['flag'],height: 50,width: 60,),
                      ],
                    ),
                  ),
                  Expanded(child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('CONFIRMED:' + countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),),
                        Text('ACTIVE:' + countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                        Text('RECOVERED:' + countryData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                        Text('DEATHS:' + countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}