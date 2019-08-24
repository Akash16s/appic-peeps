import 'package:flutter/material.dart';
import 'package:flutter_speedometer/flutter_speedometer.dart';
import 'WebView.dart';
import 'dart:async';
import 'meal.dart';

class OutputScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OutputScreenState();
  }
}

class OutputScreenState extends State<OutputScreen>{
  String url = 'workout';
  @override
//  PublishSubject<double> eventObservable = new PublishSubject();
  void initState() {
    super.initState();

  }
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            builder: (BuildContext context, snapshot){
              return ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/5,
                    color: Color(0xFFF8913A),
                  ),
                  Container(height: 50.0,),

                  Speedometer(
                    size: 250,
                    minValue: 5,
                    maxValue: 35,
                    currentValue: 25,
                    warningValue: 25,
//                    displayText: ,
                    backgroundColor: Colors.white,
                    kimColor: Colors.black,
                    displayTextStyle: TextStyle(fontSize: 30.0),
                  ),
                  Container(height: 50.0,),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xFFF8913A),
                      child: Text(
                        'Upload Meal',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MealState() ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  Container(height: 50.0,),

                  Container(
                    child: Center(
                      child: Text('Recomended Videos', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(height: 30.0,),

                  Container(
                      height: 200.0,
//                      width: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100.0,
                              width: 300.0,
                              color: Colors.grey,
                            ),
                          );
                        },
                      itemCount: 5,
                    )
                  ),
                  Container(height: 30.0,),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xFFF8913A),
                      child: Text(
                        'More videos',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: 'https://www.youtube.com/results?search_query=${url}',) ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  Container(height: 80.0,),

                  Container(
                    child: Center(
                      child: Text('Recomended Articles', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(height: 30.0,),

                  Container(
                      height: 200.0,
//                      width: 100.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100.0,
                              width: 300.0,
                              color: Colors.grey,
                            ),
                          );
                        },
                        itemCount: 5,
                      )
                  ),
                  Container(height: 30.0,),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xFFF8913A),
                      child: Text(
                        'More articles',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: 'https://www.youtube.com',) ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  Container(height: 30.0,),
                ],
              );
            }
        ),
      ),
    );
  }
}