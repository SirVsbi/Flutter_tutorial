import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget{

  _HomeScreenState createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen>{



  List<int> _history = [0];

  void _onItemTapped(int index) {
    _history.add(index);
    setState(() {
      _selectedIndex = index;
      ModalRoute.of(context).addLocalHistoryEntry(
        LocalHistoryEntry(
          onRemove: () {
            _history.removeLast();
            setState(() {
              _selectedIndex = _history.last;
            });
          }
        )
      );

    });
  }



  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    PlaceholderWidget(Colors.red),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.yellow)
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom nav with history"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('First'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Seccond'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Third'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

}



class PlaceholderWidget extends StatelessWidget{

  final Color _color;
  PlaceholderWidget( this._color);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
    );
  }

}


