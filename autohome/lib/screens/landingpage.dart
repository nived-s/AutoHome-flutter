import 'package:autohome/constants.dart';
import 'package:autohome/screens/homepage.dart';
import 'package:autohome/screens/modespage.dart';
import 'package:autohome/screens/profilepage.dart';
import 'package:autohome/screens/roompage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
// page index
  int currentPage = 0;
  // pages
  final List<Widget> pages = const[
    HomePage(),
    RoomPage(),
    ModesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        backgroundColor: Colors.grey.shade300,
        selectedFontSize: 16,
        fixedColor: Colors.black,
        selectedLabelStyle: kSubHeadingSmall(fontSize: 14),
        unselectedLabelStyle: kSubHeadingSmall(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bed),
            label: 'Rooms',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gears),
            label: 'Modes',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userLarge),
            label: 'Profile',
          ),
        ],
      ),
      
    );
  }
}