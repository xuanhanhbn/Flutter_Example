import 'package:flutter/material.dart';
import 'package:flutter_example/home_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: [
              HomePage(),
            ],
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              SalomonBottomBarItem(
                  icon: Icon(Icons.search), title: Text("Search")),
              SalomonBottomBarItem(
                  icon: Icon(Icons.settings), title: Text("Setting")),
              SalomonBottomBarItem(
                  icon: Icon(Icons.people_rounded), title: Text("stack"))
            ],
          ),
        ),
      ),
    );
  }
}
