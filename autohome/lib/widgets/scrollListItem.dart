import 'package:autohome/constants.dart';
import 'package:flutter/material.dart';

List<Widget> scrollListItems(BuildContext context) {
  int i = 0;
  // List of modes
  List<String> modes = ['Away', 'Bedtime', 'Children', 'Summer', 'winter'];
  List<Widget> items = [];
  while (i < modes.length) {
    items.add(
      Center(
        child: Container(
          // color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          //     .withOpacity(1.0),
          child: Text(
            modes[i],
            style: kModeScrollHeading(),
          ),
        ),
      ),
    );

    i += 1;
  }

  return items;
}
