class RoomData {
  final List<List<String>> availDevices;
  final String img;
  final int room;

  RoomData({required this.availDevices, required this.img, required this.room});

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      availDevices: List<List<String>>.from(json['avail_devices']),
      img: json['img'],
      room: json['room'],
    );
  }
}