import 'package:flutter/material.dart';

class Result extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResultState();
  }
}
class ResultState extends State<Result>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 200.0,
                color: Color(0xFFF8913A),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.green,
                      ),
                      Positioned(
                        left: 25,
                        top: 25,
                          child: Icon(Icons.check, color: Colors.white, size: 50.0,)),
                    ],
                  )
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Text('Type: ',style: TextStyle(fontSize: 23),),
                              Text('Desert',style: TextStyle(fontSize: 23),),
                            ],
                          )
                        ),
                       
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 8, top: 10)),
                        Text(
                          'Nutrients: ',style: TextStyle(fontSize: 23),
                        ),
                        Row(
                          children: <Widget>[
                            Text('Fats and Carbohydrates',style: TextStyle(fontSize: 23),),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}