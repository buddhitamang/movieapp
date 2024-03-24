
import 'package:flutter/material.dart';
import 'package:movieapp/Pages/home_page.dart';
import 'package:movieapp/Pages/movie_details.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex=0;

  void navigatePage(int index){
    setState(() {
      _currentIndex=index;
    });

  }

  final List<Widget> pages=[
    HomePage(),
    Center(child: Text('search page'),),
    Center(child: Text('profile page'),),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: navigatePage,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
      ],
      ),
      body: pages[_currentIndex]

    );
  }
}
