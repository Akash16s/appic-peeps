import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatelessWidget{
  String url;
  WebViewScreen({this.url});
  @override
  Widget build(BuildContext context) {
    print(url);
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Color(0xFFF8913A),
          title: Align(
            alignment: Alignment(-0.2, 0),
            child:  Image.asset('assets/meto.png',width: 100,height: 110,fit: BoxFit.fill,),
          ),
        ),
        body: WebviewScaffold(url: url),
      ),
    );
  }
}