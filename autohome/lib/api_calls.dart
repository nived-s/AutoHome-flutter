import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// ------------------- MODES -------------------------

Future<void> updateModeRequest(String newMode) async {
  String url = 'http://192.168.1.5:5000/update-mode';

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

