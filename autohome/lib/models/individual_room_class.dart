// class RoomData {
//   final List<List<String>> availDevices;
//   final String img;
//   final int room;

//   RoomData({
//     required this.availDevices,
//     required this.img,
//     required this.room,
//   });

//   factory RoomData.fromJson(Map<String, dynamic> json) {
//     return RoomData(
//       availDevices: List<List<String>>.from(json['avail_devices']?.map((x) => List<String>.from(x))),
//       img: json['img'],
//       room: json['room'],
//     );
//   }
// }


class RoomData {
  final List<Map<String, dynamic>> availDevices;
  final String img;
  final int room;

  RoomData({
    required this.availDevices,
    required this.img,
    required this.room,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      availDevices: List<Map<String, dynamic>>.from(json['avail_devices']?.map((x) => {
        'device': x[0],
        'icon': x[1],
        'isOn': x[2],
        'pin_num': x[3], // add pin_num field here
      })),
      img: json['img'],
      room: json['room'],
    );
  }
}