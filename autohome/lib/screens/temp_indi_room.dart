import 'package:autohome/api_calls.dart';
import 'package:autohome/models/individual_room_class.dart';
import 'package:flutter/material.dart';

class indiRoom extends StatefulWidget {
  const indiRoom({super.key});

  @override
  State<indiRoom> createState() => _indiRoomState();
}

class _indiRoomState extends State<indiRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<RoomData>(
        future: fetchIndividualRoom(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Access the properties of RoomData
            final roomData = snapshot.data!;
            return Column(
              children: [
                // Display room image
                Image.network(roomData.img),
                // Display available devices
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: roomData.availDevices.length,
                  itemBuilder: (context, index) {
                    final device = roomData.availDevices[index];
                    return ListTile(
                      leading: Image.network(device[
                          1]), // Assuming the second element is the icon URL
                      title: Text(device[
                          0]), // Assuming the first element is the device name
                      trailing: Text(device[
                          2]), // Assuming the third element is the device status
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
