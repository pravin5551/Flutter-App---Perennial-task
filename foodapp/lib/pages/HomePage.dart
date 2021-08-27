

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/pages/SignInPage.dart';
import 'package:foodapp/pages/bottm_tabs/covid_tab.dart';
import 'package:foodapp/widgets/BottomNavBarWidget.dart';

import 'bottm_tabs/resturant_tab.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAFAFA),
        elevation: 0,
        title: Text(
            'Home Page',
          style: TextStyle(
            color: Color(0xFF3a3737),
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),

        ),
        brightness: Brightness.dark,
        actions: <Widget>[
          IconButton(onPressed:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInPage()),
            );
          }, icon: Icon(
            Icons.logout,
            color: Color(0xFF3A3737),
          ))
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        // type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(color: Color(0xFF2c2b2b)),
              ),
              backgroundColor: Colors.redAccent

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.near_me),
              title: Text(
                'Food Page',
                style: TextStyle(color: Color(0xFF2c2b2b)),
              ),
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              title: Text(
                'Api call',
                style: TextStyle(color: Color(0xFF2c2b2b)),
              ),
              backgroundColor: Colors.yellowAccent

          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              title: Text(
                'Order',
                style: TextStyle(color: Color(0xFF2c2b2b)),
              ),
              backgroundColor: Colors.pinkAccent

          ),
        ],

        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFFfd5352),
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }

  final tabs = [
    Center(child: HomeTab(),),
    Center(child: SecondAPI(),),
    Center(child: HomeTab(),),
    Center(child: SecondAPI(),),
  ];
}
