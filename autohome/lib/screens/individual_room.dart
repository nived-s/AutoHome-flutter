import 'package:autohome/api_calls.dart';
import 'package:autohome/constants.dart';
import 'package:autohome/models/individual_room_class.dart';
import 'package:autohome/widgets/individualRoomPageRoomDetailsContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:string_2_icon/string_2_icon.dart';

class IndividualRoom extends StatefulWidget {
  final int roomNumber;

  const IndividualRoom({super.key, required this.roomNumber});

  @override
  State<IndividualRoom> createState() => _IndividualRoomState();
}

class _IndividualRoomState extends State<IndividualRoom> {
  RoomData? _room;
  List<CupertinoSwitch> _switches = [];

  late Future<void> _loadImage;

  @override
  void initState() {
    super.initState();
    _loadRoom();
    _loadImage = Future.delayed(const Duration(milliseconds: 80), () {});
  }

  Future<void> _loadRoom() async {
    try {
      final roomData = await fetchData(widget.roomNumber);
      setState(() {
        _room = roomData;
        _switches = roomData.availDevices
            .map((device) => CupertinoSwitch(
                  value: device[2] == 'true',
                  onChanged: (value) => _toggleDevice(device[0], value),
                ))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  void _toggleDevice(String deviceName, bool value) {
    setState(() {
      final index =
          _room?.availDevices.indexWhere((device) => device[0] == deviceName);
      if (index != null) {
        _room?.availDevices[index][2] = value.toString();
      }
    });
  }

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
                      const Column(
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
                      // Container(
                      //   height: screenHeight * 0.4,
                      //   width: screenWidth * 0.52,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     boxShadow: [
                      //       BoxShadow(blurRadius: 3, spreadRadius: 0.2)
                      //     ],
                      //     image: DecorationImage(
                      //       // image: AssetImage(
                      //       //   'assets/images/rooms/kitchen.jpg',
                      //       // ),
                      //       image: NetworkImage(_room!.img),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),

                      FutureBuilder(
                        future: _loadImage,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              height: screenHeight * 0.4,
                              width: screenWidth * 0.52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(blurRadius: 3, spreadRadius: 0.2)
                                ],
                                color: Colors.grey[200],
                              ),
                            );
                          } else {
                            return Container(
                              height: screenHeight * 0.4,
                              width: screenWidth * 0.52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(blurRadius: 3, spreadRadius: 0.2)
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(_room!.img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
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
                      // child: GridView.builder(
                      //   gridDelegate:
                      //       const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: 20,
                      //     mainAxisSpacing: 20,
                      //   ),
                      //   itemCount: roomData.availDevices.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     final device = roomData.availDevices[index];
                      //     bool deviceStatus = device[2] == 'true';
                      //     return Container(
                      //       height: 20,
                      //       width: 20,
                      //       decoration: BoxDecoration(
                      //         color: Color(0xFFD9D9D9),
                      //         borderRadius: const BorderRadius.all(
                      //           Radius.circular(20),
                      //         ),
                      //       ),
                      //       child: Column(
                      //         mainAxisAlignment:
                      //             MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           // Device img
                      //           Icon(
                      //             FontAwesomeIcons.lightbulb,
                      //             size: 42,
                      //           ),
                      //           // text and btn
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceEvenly,
                      //             children: [
                      //               Text(
                      //                 device[0],
                      //                 style: kSubHeadingLarge(),
                      //               ),
                      //               CupertinoSwitch(
                      //                 // value: true,
                      //                 // onChanged: (index) {},
                      //                 value: deviceStatus,
                      //                 onChanged: (value) {
                      //                   // Update the status of the device
                      //                   setState(() {
                      //                     // Update the status of the device in the roomData.availDevices list
                      //                     roomData.availDevices[index]
                      //                         [2] = value.toString();
                      //                   });
                      //                   // Print the updated status to the terminal
                      //                   print(
                      //                       'Device status updated: $value');
                      //                 },
                      //               ),
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: _room?.availDevices.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final device = _room?.availDevices[index];
                          // final iconString = device?[1];
                          // final iconData =
                          //     String2Icon.getIconDataFromString(
                          //         iconString!);
                          return Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Device icon
                                Icon(
                                  String2Icon.getIconDataFromString(device![1]),
                                  size: 42,
                                ),

                                // Device name and switch
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      device[0],
                                      style: kSubHeadingLarge(),
                                    ),
                                    CupertinoSwitch(
                                      value: device[2] == 'true',
                                      onChanged: (value) {
                                        setState(() {
                                          _room?.availDevices[index][2] =
                                              value.toString();
                                        });
                                        _toggleDevice(device[0], value);
                                      },
                                    ),
                                  ],
                                ),
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
