import 'package:autohome/constants.dart';
import 'package:autohome/widgets/individualRoomPageRoomDetailsContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IndividualRoom extends StatefulWidget {
  const IndividualRoom({super.key});

  @override
  State<IndividualRoom> createState() => _IndividualRoomState();
}

class _IndividualRoomState extends State<IndividualRoom> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.045),
            child: Column(
              children: [
                //## Header of page
                // Image and room details
                SizedBox(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Temp and Humidity
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          individualRoomPageRoomDetailsContainer(
                            icon: FontAwesomeIcons.temperatureQuarter,
                            text: '27°C',
                          ),
                          individualRoomPageRoomDetailsContainer(
                            icon: FontAwesomeIcons.droplet,
                            text: '72%',
                          ),
                        ],
                      ),
                      // Room img
                      Container(
                        height: screenHeight * 0.4,
                        width: screenWidth * 0.52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(blurRadius: 3, spreadRadius: 0.2)
                          ],
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/rooms/kitchen.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // Devices
                Text(
                  'Devices',
                  style: kBodySmall(fontSize: 24),
                ),
                // Available devices
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 18),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: -5,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 22.0, horizontal: 26),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Device img
                                Icon(
                                  FontAwesomeIcons.lightbulb,
                                  size: 42,
                                ),
                                // text and btn
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Light', style: kSubHeadingLarge(),),
                                    CupertinoSwitch(
                                      value: false,
                                      onChanged: (index) {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
