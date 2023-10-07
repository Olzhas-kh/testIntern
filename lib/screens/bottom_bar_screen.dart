import 'package:flutter/material.dart';
import 'package:test_intern/const/colors.dart';
import 'package:test_intern/screens/check_screen/screens/check_screen.dart';
import 'package:test_intern/screens/contacts_screen/screens/contacts_screen.dart';
import 'package:test_intern/screens/galery_screen.dart/screen/galery_screen.dart';
import 'package:test_intern/screens/news/screen/news_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const NewsScreen(),
    const GaleryScreen(),
    const CheckScreen(),
    const ContactsScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 10,
          selectedItemColor: ColorProject.white,
          unselectedItemColor: ColorProject.iconBottomBar,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorProject.background,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Check',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_contact_cal),
              label: 'Contacts',
            ),
          ]),
    );
  }
}
