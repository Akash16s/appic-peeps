import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'result.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'output.dart';

File file;

class MealState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MealState();
  }
}
class _MealState extends State<MealState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8913A),
        title: Align(
          alignment: Alignment(-0.2, 0),
          child:  Row(
            children: <Widget>[
              Image.asset('assets/meto.png',width: 100,height: 110,fit: BoxFit.fill,),
              Text('Mealifier')
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(height: MediaQuery.of(context).size.height/10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: RaisedButton(
                  color: Color(0xFFF8913A),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  onPressed: _choose,
                  child: Text('Choose Image', style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(width: 10.0),
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  onPressed: _click,
                  child: Text('Click', style: TextStyle(color: Color(0xFFF8913A),),),
                ),
              ),
              SizedBox(width: 10.0),

            ],
          ),
          Container(height: MediaQuery.of(context).size.height/20,),

          Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                  color: Color(0xFFF8913A),
                )
            ),
            height: 300.0,
            width: 300.0,
            child: Center(
              child: file == null
                  ? Text('No Image Selected')
                  : Image.file(file, fit: BoxFit.fill,),
            ),
          ),
          Container(height: MediaQuery.of(context).size.height/20,),

          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Color(0xFFF8913A),
            onPressed: () => {
              _upload,
              Navigator.push(context, MaterialPageRoute(builder: (context) => Result()))
            },
            child: Icon(Icons.file_upload, color: Colors.white,),
          )



        ],
      ),
    );
  }
  void _click() async {
    file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      file = file;
    });
  }
  void _choose() async {
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = file;
    });
  }
}




void _upload() {
  if (file == null) return;
  String base64Image = base64Encode(file.readAsBytesSync());

  http.post('http://e2161af8.ngrok.io/image/', body: {
    "file": base64Image,
  }).then((res) {
    print(res.statusCode);
  }).catchError((err) {
    print(err);
  });
}

