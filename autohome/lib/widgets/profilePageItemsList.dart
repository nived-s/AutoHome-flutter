import 'package:autohome/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class profilePageItemsList extends StatelessWidget {
  final IconData icon;
  final String text;

  const profilePageItemsList({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:24.0, horizontal: 16),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 28,
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Text(
                text,
                style: kSubHeadingSmall(),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
