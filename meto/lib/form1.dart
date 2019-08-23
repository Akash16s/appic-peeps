import 'package:flutter/material.dart';
import 'form2.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

String _email;
String _username;
String _mobile;
String _gender;
String _age;

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
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                  height: 250,
                  color: Color(0xFFF8913A),
                ),
                Positioned(
                    top: 100,
                    left: 20,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      child: Container(
                        height: 500,
                        width: 350,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Username'),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'This is required';
                                      }
                                    },
                                    onSaved: (val) {
                                      setState(() {
                                        _username = val;
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
                                        if (value == null) {
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
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'This is required';
                                      }
                                    },
                                    onSaved: (val) {
                                      setState(() {
                                        _email = val;
                                      });
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: 'Mobile Number'),
                                    validator: (value) {
                                      if (value == null) {
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
                                    // if (_formKey.currentState.validate()) {
                                    //   _formKey.currentState.save();
                                    //   return http.post(
                                    //       Uri.encodeFull('',
                                    //           ),
                                    //       body: {
                                            
                                    //       }).then((response) {
                                    //     response.statusCode == 200
                                    //         ? Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //                 builder: (context) =>
                                    //                     Form2()))
                                    //         : CircularProgressIndicator();
                                    //   });
                                    Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                       Form2()));
                                    
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
