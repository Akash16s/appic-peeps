import 'package:flutter/material.dart';
import 'form2.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'image.dart';
//String _email;
String _firstname;
String _lastname;
String _height;
String _mobile;
String _gender;
String _age;
dynamic value;

final _formKey = GlobalKey<FormState>();

class Form1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Form1State();
  }
}

class Form1State extends State<Form1> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                  ),

                  Container(
                    height: 250,
                    color: Color(0xFFF8913A),
                  ),
                  Positioned(
                   // top: 50,
                    left: 150,
                    child: Image.asset('assets/meto.png',width: 150,height: 110,fit: BoxFit.fill,),
                  ),
                  Positioned(
                      top: 100,
                      left: 20,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: Container(
                          height: 650,
                          width: 350,
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                        decoration:
                                        InputDecoration(labelText: 'firstname'),
                                        validator: (value) {
                                          if (value == '') {
                                            return 'This is required';
                                          }
                                        },
                                        onSaved: (val) {
                                          setState(() {
                                            _firstname = val;
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                        decoration:
                                        InputDecoration(labelText: 'lastname'),
                                        validator: (value) {
                                          if (value == '') {
                                            return 'This is required';
                                          }
                                        },
                                        onSaved: (val) {
                                          setState(() {
                                            _lastname = val;
                                          });
                                        }),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 100,
                                        padding: EdgeInsets.all(10),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration:
                                          InputDecoration(labelText: 'Age'),
                                          validator: (value) {
                                            if (value == '') {
                                              return 'This is required';
                                            }
                                          },
                                          onSaved: (val) {
                                            setState(() {
                                              _age = val;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 100),
                                      ),
                                      Container(
                                        width: 100,
                                        padding: EdgeInsets.all(10),
                                        child: TextFormField(
                                            decoration: InputDecoration(
                                                labelText: 'Gender'),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'This is required';
                                              }
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                _gender = val;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.all(10),
//                                    child: TextFormField(
//                                        keyboardType: TextInputType.emailAddress,
//                                        decoration: InputDecoration(
//                                          labelText: 'Email',
//                                        ),
//                                        validator: (value) {
//                                          if (value == '') {
//                                            return 'This is required';
//                                          }
//                                        },
//                                        onSaved: (val) {
//                                          setState(() {
//                                            _email = val;
//                                          });
//                                        }),
//                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            labelText: 'weight'),
                                        validator: (value) {
                                          if (value == '') {

                                            return 'This is required';
                                          }
                                        },
                                        onSaved: (val) {
                                          setState(() {
                                            _mobile = val;
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            labelText: 'height'),
                                        validator: (value) {
                                          if (value == '') {

                                            return 'This is required';
                                          }
                                        },
                                        onSaved: (val) {
                                          setState(() {
                                            _height = val;
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 50),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    height: 50,
                                    child: RaisedButton(
                                      color: Color(0xFFF8913A),
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate ( )) {
                                          value = double.parse(_mobile)/(double.parse(_height)*double.parse(_height));
                                          _formKey.currentState.save ( );
                                          return http.post (
                                              Uri.encodeFull ('http://cbc10dfd.ngrok.io/modelmaker/',
                                              ),
                                              body: {
                                                'firstname': _firstname,
                                                'lastname': _lastname,
                                                'sex': _gender,
                                                'age': _age,
//                                                'email': _email,
                                                'weightcurrent': _mobile

                                              } ).then ( (response) {
                                            print(response.statusCode);
                                            if(response.statusCode == 200)
                                            {
                                              print(response.body);
                                              Navigator.push (
                                                context,
                                                MaterialPageRoute (
                                                    builder: (context) =>
                                                        ImageState ( ) ) );
                                            }
                                                else CircularProgressIndicator ( );
                                          } );
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                  ),
                                  Text('OR'),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    height: 50,
                                    child: RaisedButton(
                                      color: Color(0xFFF8913A),
                                      child: Text(
                                        'Upload Picture',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      onPressed: () async {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ImageState() ));
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                        ),
                      ))
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
