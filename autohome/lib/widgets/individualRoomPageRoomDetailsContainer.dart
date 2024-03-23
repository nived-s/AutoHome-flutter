import 'package:autohome/constants.dart';
import 'package:flutter/material.dart';

class individualRoomPageRoomDetailsContainer extends StatelessWidget {
  final IconData icon;
  final String text;

  const individualRoomPageRoomDetailsContainer({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.17,
      width: screenWidth * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFD5EBE0),
        boxShadow: [BoxShadow(blurRadius: 1,spreadRadius: 0.2,)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 34,
          ),
          Text(
            text,
            style: kSubHeadingLarge(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
