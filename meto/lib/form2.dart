import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'image.dart';
String _weight;
String _height;
String _temperature;
String _drug;

final _formKey = GlobalKey<FormState>();

class Form2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Form2State();
  }
}

class Form2State extends State<Form2> {
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
                        child: Center(
                          child: Form(
                            key: _formKey,
                                                      child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecoration(labelText: 'Weight'),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'This is required';
                                      }
                                    },
                                     onSaved: (val) {
                                        setState(() {
                                          _weight = val;
                                        });
                                      }
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecoration(labelText: 'Height'),
                                    onSaved: (val) {
                                    setState(() {
                                      _height = val;
                                    });
                                  },
                                  ),
                                ),
                                Padding(
                                 padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Environmental Temperature'),
                                    onSaved: (val) {
                                    setState(() {
                                      _temperature = val;
                                    });
                                  }
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Drugs',
                                    ),
                                   onSaved: (val) {
                                        setState(() {
                                          _drug = val;
                                        });
                                      }
                                  ),
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
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                         Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                         ImageState()));
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)),
                                  ),
                                ),
                              ],
                            ),
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
