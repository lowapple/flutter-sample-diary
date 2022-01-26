import 'package:diary_sample/ui/pages/page_diary_create.dart';
import 'package:diary_sample/ui/pages/page_diary_list.dart';
import 'package:flutter/material.dart';

import 'components/animation/slide_up.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _pages = [const PageDiaryList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _onBottomNavTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile'))
            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF3C4858),
          child: const Icon(Icons.add),
          onPressed: () => Navigator.of(context)
              .push(SlideUpRoute(widget: const PageDiaryCreate())),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
