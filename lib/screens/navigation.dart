
import 'package:covide_tracker/screens/state_hospital.dart';
import 'package:flutter/material.dart';
import 'homepage2.dart';
import 'hospital.dart';
import 'hstate.dart';
// import 'hstate.dart';

class BottomNavScreen extends StatefulWidget {
    const BottomNavScreen({Key? key}) : super(key: key);
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    const HomeScreen(),
    const StateTablePage(),
    const StateTablePage1(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.cyan,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.white,
        elevation: 0.0,
        items: [Icons.home, Icons.insert_chart, Icons.local_hospital_rounded]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: "",
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
