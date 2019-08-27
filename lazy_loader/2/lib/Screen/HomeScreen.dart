import 'package:flutter/material.dart';
import 'package:layz_loader/Screen/ItemScreen.dart';

import '../Model/data.dart';
import '../Services/httpClient.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrooled) {
        return <Widget>[
          new SliverAppBar(
            pinned: true,
            floating: true,
            centerTitle: true,
            title: Text("Lazy loader"),
            bottom: TabBar(
              tabs: <Tab>[
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.grid_off)),
              ],
              controller: _tabController,
            ),
          ),
        ];
      },
      body: TabBarView(
        children: <Widget>[
          mainScreen(),
          Center(child: Text("hey")),
        ],
        controller: _tabController,
      ),
    ));
  }

  Widget mainScreen() {
    return FutureBuilder<List<Data>>(
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
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: Card(
                    child: Image.network(datas[index].thumbnailUrl),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemScreen(item: datas[index]),
                      ),
                    );
                  });
            },
          ));
        } else {
          return new Center(child: new CircularProgressIndicator());
        }
      },
    );
  }
}
