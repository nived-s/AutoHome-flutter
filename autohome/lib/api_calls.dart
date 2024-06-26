import 'dart:convert';

import 'package:autohome/models/individual_room_class.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// ------------------- MODES -------------------------

Future<void> updateModeRequest(String newMode) async {
  String url = 'http://192.168.11.188:5000/update-mode';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{'mode': newMode}),
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Mode updated",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      // Handle error
      Fluttertoast.showToast(
        msg: "Failed to update mode",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  } catch (error) {
    // Handle exceptions
    Fluttertoast.showToast(
      msg: "Error: $error",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}

// ------------------- END OF MODES -------------------------

// ------------------- DEVICES -------------------------

// - Get individual room details
Future<RoomData> fetchIndividualRoom(int roomNumber) async {
  final response = await http.post(
    Uri.parse('http://192.168.11.188:5000/individual-room'),
    body: jsonEncode({'room': roomNumber}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    Map<String, dynamic> data = json.decode(response.body);
    // Parse JSON into RoomData object
    return RoomData.fromJson(data);
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to load data');
  }
}

// - Update a device
Future<bool> updateDevice(int room, List<dynamic> toupdateDevice) async {
  final body = {
    "room": room,
    "update_device": toupdateDevice,
  };
  const url = 'http://192.168.11.188:5000/update-device';
  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(body),
  );
  if (response.statusCode == 200) {
    // handle successful response
    print('success');
    return true;
  } else {
    // handle error response
    print('fail');
    return false;
  }
}

// ------------------- END OF DEVICES -------------------------

// ------------------- LOGIN AND SIGNUP -------------------------

Future<dynamic> loginApiCall(String username, String password) async {
  final Uri url = Uri.parse(
      'http://192.168.11.188:5000/login'); // Replace with your API URL
  final headers = {'Content-Type': 'application/json'};

  final jsonData = {'username': username, 'password': password};
  final response =
      await http.post(url, headers: headers, body: jsonEncode(jsonData));

  if (response.statusCode == 200) {
    return true; // Login successful
  } else if (response.statusCode == 401) {
    return false; // Invalid username or password
  } else {
    return null; // Unknown error
  }
}

Future<bool> signupApiCall(String username, String email, String password,
    String confirmPassword) async {
  final Uri url = Uri.parse(
      'http://192.168.11.188:5000/signup'); // Replace with your API URL
  final headers = {'Content-Type': 'application/json'};

  final jsonData = {
    'username': username,
    'email': email,
    'password': password,
    'confirm_password': confirmPassword
  };
  final response =
      await http.post(url, headers: headers, body: jsonEncode(jsonData));

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

// ------------------- END OF LOGIN SIGNUP -------------------------