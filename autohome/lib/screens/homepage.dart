import 'package:autohome/screens/landingpage.dart';
import 'package:autohome/screens/roompage.dart';
import 'package:autohome/widgets/circulariconbtn.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:autohome/constants.dart';
import 'package:group_button/group_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define a variable to keep track of the selected mode index
    int selectedModeIndex = -1;

    // List of modes
    List<String> modes = ['Away', 'Bedtime', 'Children', 'Summer', 'winter'];

    final controller = GroupButtonController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.045),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, \nJon Snow',
                      style: kHeadingLarge(fontSize: screenWidth * 0.09),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        radius: screenWidth * 0.055,
                        child: Icon(
                          FontAwesomeIcons.gear,
                          size: screenWidth * 0.065,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // Energy, Temperature
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Energy
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.bolt,
                              size: screenWidth * 0.09,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Energy',
                                  style: kBodySmall(
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                Text(
                                  '60kW',
                                  style: kBodyLarge(
                                    fontSize: screenWidth * 0.06,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        // temperature
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.temperatureHalf,
                              size: screenWidth * 0.09,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Temp',
                                  style: kBodySmall(
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                Text(
                                  '27°C',
                                  style: kBodyLarge(
                                    fontSize: screenWidth * 0.06,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // MODES
                Column(
                  children: [
                    // heading of Modes
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Modes',
                            style:
                                kSubHeadingLarge(fontSize: screenWidth * 0.05),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.sliders,
                                size: screenWidth * 0.035,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Customize',
                                style: kSubHeadingSmall(
                                    fontSize: screenWidth * 0.045),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Modes scroll
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GroupButton(
                            options: GroupButtonOptions(
                              unselectedColor: Colors.grey,
                              unselectedTextStyle: kBodyLarge(),
                              selectedColor: Colors.grey.shade300,
                              selectedTextStyle:
                                  kBodyLarge(color: Colors.green),
                              borderRadius: BorderRadius.circular(16),
                              groupingType: GroupingType.row,
                              spacing: 6,
                            ),
                            controller: controller,
                            buttons: modes,
                            onSelected: (value, index, isSelected) {
                              print("$index is selected");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // ROOMS
                Column(
                  children: [
                    // heading of rooms
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rooms',
                            style:
                                kSubHeadingLarge(fontSize: screenWidth * 0.05),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const LandingPage()),);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.arrowRight,
                                  size: screenWidth * 0.035,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'View All',
                                  style: kSubHeadingSmall(
                                      fontSize: screenWidth * 0.045),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ROOM CARD
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: modes.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: screenWidth * 0.6,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: selectedModeIndex == index
                                  ? Colors.amber
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/rooms/kitchen.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: BlurryContainer(
                                height: 110,
                                width: screenWidth,
                                blur: 8,
                                color: Colors.white.withOpacity(0.15),
                                child: Column(
                                  children: [
                                    Text(
                                      'Living Room',
                                      style:
                                          kSubHeadingLarge(color: Colors.white),
                                    ),
                                    const Row(
                                      children: [
                                        // icons
                                        CircularIconButton(
                                          icon: FontAwesomeIcons.fan,
                                        ),
                                        CircularIconButton(
                                          icon: Icons.air,
                                        ),
                                        CircularIconButton(
                                          icon: FontAwesomeIcons.fan,
                                        ),
                                        CircularIconButton(
                                          icon: FontAwesomeIcons.lightbulb,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
