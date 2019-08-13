import 'package:flutter/material.dart';

import '../Model/data.dart';
import '../Services/httpClient.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Lazy loader"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Data>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Data> datas = snapshot.data;
            return Scrollbar(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: datas.length,
              itemBuilder: (context, index){
                return Image.network(datas[index].thumbnailUrl);
              },
            )
            );
          } else {
            return new Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
