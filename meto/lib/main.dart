import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'form1.dart';

void main(){
   SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Color(0xFFFA9F56),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WelcomeScreenState();
  }
}
class WelcomeScreenState extends State<WelcomeScreen>{
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Color(0xFFF8913A),
        // color: Color(0xFFF77B00),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.asset('assets/meto.png'),
              Text('Follow the path to be ',style: TextStyle(color: Colors.white.withOpacity(1),fontWeight: FontWeight.bold,fontSize: 20),),
              Padding(padding: EdgeInsets.only(top: 5),),
              Text('healthy with us',style: TextStyle(color: Colors.white.withOpacity(1),fontWeight: FontWeight.bold,fontSize: 20),),
              Padding(padding: EdgeInsets.only(top: 105)),
              SizedBox(
                width: 300,
                height: 50,
                 child: RaisedButton(
                   color: Colors.white,
                  child: Text('Get Started',style: TextStyle(color: Color(0xFFF8913A)),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Form1()));
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}