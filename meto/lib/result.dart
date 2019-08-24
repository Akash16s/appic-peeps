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
          child: Text('hello'),
        ),
      ),
    );
  }
}