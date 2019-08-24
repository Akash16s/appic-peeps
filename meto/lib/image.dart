import 'dart:io';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'output.dart';
File file;
dynamic imageToSend;

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
       appBar: AppBar(
        backgroundColor: Color(0xFFF8913A),
        title: Align(
          alignment: Alignment(-0.2, 0),
          child:  Image.asset('assets/meto.png',width: 100,height: 110,fit: BoxFit.fill,),
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
                  onPressed: () async {
     file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageToSend = file;
    });
  },
                 child: Text('Choose Image', style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(width: 10.0),
             SizedBox(
                height: 50.0,
                width: 150.0,
                child: RaisedButton(
                  onPressed: ()async {
   file = await ImagePicker.pickImage(source: ImageSource.camera);
     setState(() {
      imageToSend = file;
    });
  },
                  child: Text('Click', style: TextStyle(color: Color(0xFFF8913A),),),
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0),
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
                onPressed: () =>_upload(context),
                 child: Icon(Icons.file_upload, color: Colors.white,),
              ),
                 ],
      ),
    );
  }
}
Future _upload(BuildContext context) async{
 String fileName = file.path.split("/").last;
  print("Uploading");
    StorageReference storageReference = FirebaseStorage.instance.ref().child('$fileName');
    StorageUploadTask task = storageReference.putFile(imageToSend);
    task.onComplete.then((ref) {
      print("Uploaded");
      ref.ref.getDownloadURL().then((str) {
        print(str);
        http.post(Uri.encodeFull('http://cbc10dfd.ngrok.io/image/'),body: {
          'link':str,
        }).then((response){
          print(response.statusCode);
          var value = (jsonDecode(response.body));
  print(value);
         Navigator.push(context, MaterialPageRoute(builder: (context)=>OutputScreen(value: value)));
        });
      });
      });
}

