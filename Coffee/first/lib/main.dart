import 'package:flutter/material.dart';
import 'app.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget{

  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp>{


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: App(),

    );
  }


}