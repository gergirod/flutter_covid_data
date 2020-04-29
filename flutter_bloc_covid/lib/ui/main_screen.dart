import 'package:flutter/material.dart';
import 'package:flutter_bloc_covid/ui/countries_screen.dart';
import 'package:flutter_bloc_covid/ui/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    CountriesScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xc6c0c0),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.map,
                color: Color(0xFF7799bd),),
              title: Text('Global',
                style: TextStyle(
                  color: Color(0xFF7799bd)
                ),)
          ),
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.list,
                  color: Color(0xFF7799bd),),
              title: Text('Countries',
              style: TextStyle(
                color: Color(0xFF7799bd)
              ))
          )
        ],
      ),

    );
  }

}