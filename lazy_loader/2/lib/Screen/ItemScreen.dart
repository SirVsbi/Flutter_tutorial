import 'package:flutter/material.dart';
import 'package:layz_loader/Model/data.dart';



class ItemScreen extends StatefulWidget{

  final Data item;

  const ItemScreen({Key key, @required this.item}) : super(key : key);

  @override
  _ItemScreenState createState() => new _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text(widget.item.id.toString()),
        ),
      body: new Center(
        child:
          Image.network(widget.item.url),
      )
    );

  }
}