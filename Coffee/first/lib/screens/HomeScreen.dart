import 'package:coffee2/utils/authClient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FirebaseUser user;

  @override
  void initState() {
   // WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBar());
    super.initState();
  }


  void showSnackBar(){
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
              content:
                Text("Hey " + user.displayName)
        ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Screen"),
      ),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              user = snapshot.data;
              showSnackBar();
              return new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(user.photoUrl),
                  Text(user.displayName),
                  Text(user.email),
                  Text(user.uid),
                  new MaterialButton(
                    onPressed: () => AuthClient.instance.signOut(),
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text("Log out"),
                  )
                ],
              );
            } else {
              return new CircularProgressIndicator();
            }
          }),
    );
  }


}
