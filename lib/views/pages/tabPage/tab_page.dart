import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magic/components/icon/bottom_tab_icon.dart';
import 'package:magic/magic.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

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

  List<Widget> _tabPages = const <Widget>[
    Text("1"),
    Text("2"),
    Text("3"),
    Text("4")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: magicTheme.pageColor,
      body: _tabPages.elementAt(_currentIndex),
      bottomNavigationBar: BottomAppBar(
        color: magicTheme.pageColor,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BottomTabIcon(
                      magicTheme: magicTheme,
                      currentIndex: _currentIndex,
                      onTap: () {
                        _onTabTapped(0);
                      },
                      tag: 0,
                      icon: Icons.pets,
                    ),
                    BottomTabIcon(
                      magicTheme: magicTheme,
                      currentIndex: _currentIndex,
                      onTap: () {
                        _onTabTapped(1);
                      },
                      tag: 1,
                      icon: Icons.travel_explore,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox.shrink(),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return BottomTabIcon(
                          magicTheme: magicTheme,
                          currentIndex: _currentIndex,
                          onTap: () {
                            _onTabTapped(2);
                          },
                          tag: 2,
                          // badgeNum: 2,
                          icon: Icons.mail,
                        );
                      },
                    ),
                    BottomTabIcon(
                      currentIndex: _currentIndex,
                      onTap: () {
                        _onTabTapped(3);
                      },
                      tag: 3,
                      icon: Icons.person,
                      magicTheme: magicTheme,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 20,
                  child: Consumer(
                    builder: (context, watch, child) {
                      // var login = watch(userData).login;
                      return GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.add_circle,
                            size: 36,
                            color: magicColor.colorfulPack.color1,
                          ));
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
