import 'package:flutter/material.dart';
import 'package:instagram/constant/color.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_content_screen.dart';
import 'package:instagram/screens/home_Screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _SelectedBottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: greybackground,
            currentIndex: _SelectedBottomNavigationIndex,
            onTap: (index) {
              setState(() {
                _SelectedBottomNavigationIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_home.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_active_home.png',
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_search_navigation.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_search_navigation_active.png',
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_add_navigation.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_add_navigation_active.png',
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'images/icon_activity_navigation.png',
                ),
                activeIcon: Image.asset(
                  'images/icon_activity_navigation_active.png',
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: grey, width: 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/item1.png'),
                      ),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: pink, width: 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/item1.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _SelectedBottomNavigationIndex,
        children: getlayout(),
      ),
    );
  }

  List<Widget> getlayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
