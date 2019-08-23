import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
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
        height: MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SingleChildScrollView(
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
                      top: 100,
                      left: 20,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: Container(
                          height: 600,
                          width: 350,
                          child: Center(
                              child: SingleChildScrollView(
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
                                          if (_formKey.currentState.validate ( )) {
                                            _formKey.currentState.save ( );
                                            http.post (
                                                Uri.encodeFull ( '',
                                                ),
                                                body: {
                                                  'weight': _weight,
                                                  'gender': _height,
                                                  'age': _temperature,
                                                  'email': _drug,

                                                } ).then ( (response) {
                                              print(response.statusCode);
                                              response.statusCode == 200
                                                  ? Navigator.push (
                                                  context,
                                                  MaterialPageRoute (
                                                      builder: (context) =>
                                                          Form2 ( ) ) )
                                                  : CircularProgressIndicator ( );
                                            } );
                                          }
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
