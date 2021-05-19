import 'package:bean_client/constants/styles/colors.dart';
import 'package:bean_client/constants/styles/theme.dart';
import 'package:bean_client/views/pages/find/find.dart';
import 'package:bean_client/views/pages/index/index.dart';
import 'package:bean_client/views/pages/me/me.dart';
import 'package:bean_client/views/pages/message/message.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currentIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _tabPages = <Widget>[Index(), Find(), Message(), Me()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabPages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: HighLightColor,
        unselectedItemColor: ClickColor,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "课堂"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: '消息',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
        ],
      ),
    );
  }
}
