import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speedometer/flutter_speedometer.dart';
import 'WebView.dart';
import 'form1.dart';
import 'meal.dart';


class OutputScreen extends StatefulWidget{
  dynamic value;
  OutputScreen(this.value);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OutputScreenState();
  }
}

class OutputScreenState extends State<OutputScreen>{
   String url = value <= 25 ? 'how + to + increase + BMI + to + 25' : 'how + to + decrease + BMI + to + 25 ';
  @override
//  PublishSubject<double> eventObservable = new PublishSubject();
  void initState() {
    super.initState();
    print(value);
  }
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.white,),
            onTap: () => Navigator.pop(context),
          ),
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
        backgroundColor: Colors.white,
        body: FutureBuilder(
            builder: (BuildContext context, snapshot){
              return ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/5,
                    color: Color(0xFFF8913A),
                    child: Center(child: Text('$value',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),),
                  ),
                  Container(height: 50.0,),

                  Speedometer(
                    size: 250,
                    minValue: 5,
                    maxValue: 35,
                    currentValue: value,
                    warningValue: 25,
//                    displayText: ,
                    backgroundColor: Colors.white,
                    kimColor: Colors.black,
                    displayTextStyle: TextStyle(fontSize: 30.0),
                  ),
                  Container(height: 50.0,),
                  RaisedButton(
                    color: Color(0xFFF8913A),
                    child: Text(
                      'Upload Meal',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MealState() ));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  Container(height: 50.0,),

                  Container(
                    child: Center(
                      child: Text('Recomended Videos', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(height: 30.0,),

                  Container(
                      height: 200.0,
//                      width: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: value > 25 ? over25[index] : under25[index],))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Image.asset(value > 25 ? picsover25[index] : picsunder25[index]),
                                height: 100.0,
                                width: 300.0,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      itemCount: value> 25 ? over25.length : under25.length,
                    )
                  ),
                  Container(height: 30.0,),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xFFF8913A),
                      child: Text(
                        'More videos',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: 'https://www.youtube.com/results?search_query=${url}',) ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  Container(height: 80.0,),

                  Container(
                    child: Center(
                      child: Text('Recomended Articles', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(height: 30.0,),

                  Container(
                      height: 200.0,
//                      width: 100.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100.0,
                              width: 300.0,
                              color: Colors.grey,
                            ),
                          );
                        },
                        itemCount: 5,
                      )
                  ),
                  Container(height: 30.0,),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xFFF8913A),
                      child: Text(
                        'More articles',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: 'https://www.youtube.com',) ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  Container(height: 30.0,),
                ],
              );
            }
        ),
      ),
    );
  }
}

List<String> picsunder25 = [
  'assets/1.png',
  'assets/2.png',
  'assets/4.png',
  'assets/5.png'
];

List<String> picsover25 = [
  'assets/2.png',
  'assets/3.png',
];

List<String> under25 = [
  'https://www.youtube.com/watch?v=fR7NsyGkY38&t=31s',
  'https://www.youtube.com/watch?v=gwiK43nfo6s&t=6s',
  'https://www.youtube.com/watch?v=B73LaQZ8jeA',
  'https://www.youtube.com/watch?v=CC0f4NvQvos',
];
List<String> over25 = [
  'https://www.youtube.com/watch?v=gwiK43nfo6s&t=6s',
  'https://www.youtube.com/watch?v=MKm7rKhf98I&t=19s',

];