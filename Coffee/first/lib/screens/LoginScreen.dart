import 'package:coffee2/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'package:coffee2/utils/authClient.dart';


class LoginScreen extends StatefulWidget{

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{



  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Log in"),
      ),
      body:
        Center(
          child:
            new MaterialButton(
              onPressed: () => AuthClient.instance.googleSignIn(),
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Log in with Google"),
              )
        )
    );
  }
  
}