import 'package:autohome/constants.dart';
import 'package:autohome/widgets/profilePageItemsList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 160,
                    color: Colors.grey.shade300,
                  ),
                  Positioned(
                    top: 80,
                    left: screenWidth / 4 + 20,
                    // child: Container(
                    //   width: 60,
                    //   height: 60,
                    //   color: Colors.green,
                    // ),
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/jon.jpg'),
                        radius: 80,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Jon snow',
              style: kSubHeadingLarge(fontSize: 28),
            ),
            SizedBox(
              height: 20,
            ),
            profilePageItemsList(
              icon: FontAwesomeIcons.user,
              text: 'Personal Information',
            ),
            profilePageItemsList(
              icon: FontAwesomeIcons.lock,
              text: 'Privacy And Security',
            ),
            profilePageItemsList(
              icon: FontAwesomeIcons.bell,
              text: 'Notifications',
            ),
            profilePageItemsList(
              icon: FontAwesomeIcons.gear,
              text: 'Settings',
            ),
            profilePageItemsList(
              icon: FontAwesomeIcons.globe,
              text: 'Language',
            ),
            profilePageItemsList(
              icon: FontAwesomeIcons.circleInfo,
              text: 'Help',
            ),
            profilePageItemsList(
              icon: FontAwesomeIcons.rightFromBracket,
              text: 'Log Out',
            ),
          ],
        ),
      ),
    );
  }
}
