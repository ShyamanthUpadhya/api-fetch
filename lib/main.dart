import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'slots.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List slots=[];

  void fetchslots () async {
    Response response =await get(Uri.parse('https://run.mocky.io/v3/d53400a3-6126-495e-9d16-0b4414b537b3'));
    String res=response.body;
    res=res+'}';
    Map data1 = json.decode(res);
    setState(() {
          slots = data1['clients'];
          print(slots);
        });

      Navigator.push(context, MaterialPageRoute(builder: (context)=> Slots(slots:slots)));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(color: Colors.red[400]
            ,onPressed: (){
              fetchslots();
              },
            child: Text('Show Data',
            style: TextStyle(fontSize: 20.0,color: Colors.white,
            ),
            ),
            )
          ],
        ),
      ),
    
      );
  }
}
