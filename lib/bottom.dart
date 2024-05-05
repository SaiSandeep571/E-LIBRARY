import 'package:e_library/Screens/home.dart';
import 'package:e_library/Screens/search.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
  Home(),
  Search(),
];
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black, 
         currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(label: 'REG', icon: Icon(Icons.edit_note_rounded)),
          BottomNavigationBarItem(label: 'SCAN', icon: Icon(Icons.qr_code_scanner_outlined))
           ]),
    );
      
  }
}