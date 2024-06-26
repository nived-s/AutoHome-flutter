import 'package:autohome/constants.dart';
import 'package:autohome/screens/individual_room.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> room_names = [
      'Kitchen',
      'Living Room',
      'Master Bedroom',
      'Childrens Bedroom',
      'Garage'
    ];

    List<String> room_images = [
      'kitchen.jpeg',
      'hall.jpeg',
      'master_bedroom.jpeg',
      'children_room.jpeg',
      'guest_bedroom.jpeg'
    ];

    List<int> total_devices = [1, 3, 2, 2, 2];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.045),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.88,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IndividualRoom(
                              roomNumber: index,
                            ),
                            // builder: (context) => RoomPageNew(roomNumber: index),
                            // builder: (context) => indiRoom(),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        width: screenWidth * 0.6,
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/rooms/${room_images[index]}'),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      // 'Living Room',
                                      room_names[index],
                                      style: kSubHeadingLarge(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                    Text(
                                      // '5 Devices',
                                      total_devices[index].toString() +
                                          ' Devices',
                                      style:
                                          kSubHeadingLarge(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 32,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
