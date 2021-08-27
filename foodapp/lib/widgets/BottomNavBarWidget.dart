import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _currentIndex = index;
       navigateToScreens(index);
      });
    }

    return BottomNavigationBar(

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
    );
  }

  void navigateToScreens(int index) {
    if(index==0){

    }else if(index==1){

    }else if(index==2){

    }else if(index==3){

    }
  }
}
