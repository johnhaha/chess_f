import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';
import 'package:template/data/appData.dart';
import 'package:template/data/userData.dart';
import 'package:badges/badges.dart';

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

  List<Widget> _tabPages = <Widget>[Text("1"), Text("2"), Text("3"), Text("4")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColor,
      body: _tabPages.elementAt(_currentIndex),
      bottomNavigationBar: BottomAppBar(
        color: PageColor,
        shape: CircularNotchedRectangle(),
        child: Container(
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
                      currentIndex: _currentIndex,
                      onTap: () {
                        _onTabTapped(0);
                      },
                      tag: 0,
                      icon: Icons.pets,
                    ),
                    BottomTabIcon(
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
                      builder: (context, watch, child) {
                        var showBadget = watch(appData).msgBadget;
                        return BottomTabIcon(
                          currentIndex: _currentIndex,
                          onTap: () {
                            _onTabTapped(2);
                          },
                          tag: 2,
                          showBadge: showBadget,
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
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 20,
                  child: Consumer(
                    builder: (context, watch, child) {
                      var login = watch(userData).login;
                      return GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.add_circle,
                            size: 36,
                            color: MainColor,
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

class BottomTabIcon extends StatelessWidget {
  const BottomTabIcon({
    Key? key,
    int? currentIndex,
    required this.onTap,
    this.tag,
    this.icon,
    this.badgeNum = 0,
    this.showBadge = false,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final int? _currentIndex;
  final Function onTap;
  final int? tag;
  final IconData? icon;
  final int badgeNum;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Badge(
            showBadge: showBadge,
            badgeContent: badgeNum > 0
                ? Text(
                    "$badgeNum",
                    style: smallBodyText,
                  )
                : null,
            child: Icon(icon,
                size: 24.0,
                color: _currentIndex == tag ? MainColor : ClickColor),
          ),
        ));
  }
}
