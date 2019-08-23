import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

File img;
File imageToSend;
class ImageState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageState();
  }
}
class _ImageState extends State<ImageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _choose,
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: _click,
                child: Text('Click Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: _upload,
                child: Text('Upload Image'),
              )
            ],
          ),
          img == null
              ? Text('No Image Selected')
              : Image.file(img)
        ],
      ),
    );
  }
}
void _choose() async {
  img = await ImagePicker.pickImage(source: ImageSource.gallery);
//  _ImageState().setState(() {
//    imageToSend = img;
//  });
}

void _click() async {
   img = await ImagePicker.pickImage(source: ImageSource.camera);
//  _ImageState().setState(() {
//    imageToSend = img;
//  });
}

void _upload() {
  Dio dio = new Dio();
  FormData formdata = new FormData(); // just like JS
  formdata.add("photos", new UploadFileInfo(img, img.path));
  dio.post('http://d2cf961e.ngrok.io/image', data: formdata, options: Options(
      method: 'POST',
      //responseType: ResponseType.PLAIN // or ResponseType.JSON
  ))
      .then((response) => print(response))
      .catchError((error) => print(error));
}
