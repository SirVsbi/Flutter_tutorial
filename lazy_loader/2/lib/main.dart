import 'package:flutter/material.dart';
import 'Screen/HomeScreen.dart';
import 'Services/httpClient.dart';
void main(){
  runApp(MyApp());

}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        title: "Lazy loader",
        home: HomeScreen(),
    );
  }
}