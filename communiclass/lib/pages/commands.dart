import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Commands {
  static final String AND = '&';
  static final String Q_MARK = '?';
  static final String PIN = 'pin=';
  static final String COMMUNICLASS = 'communiclass/';
  static final String LOCAL_HOST = 'http:/localhost:5000';
  static final String ADMIN_ID = 'adminId="yael"';
  static final String ROOM_NAME = 'roomName=';
  static final String USER_ID = 'userId=';
  static final String GRADE = 'grade=';

  static Future<String> updateUserGrade(String func, int pin, int userId, int grade) async {
    String req = COMMUNICLASS +
        func +
        Q_MARK +
        USER_ID +
        userId.toString() +
        AND +
        PIN +
        pin.toString() +
        AND +
        GRADE +
        grade.toString();
    final response = await http.post(Uri.https(LOCAL_HOST, req));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body).cast<String>();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<String> enterRoom(String func, int pin) async {
    String req = COMMUNICLASS + func + Q_MARK + PIN + pin.toString();
    final response = await http.post(Uri.https(LOCAL_HOST, req));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body).cast<String>();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<String> get(String func, int pin) async {
    String req = COMMUNICLASS + func + Q_MARK + PIN + pin.toString();
    final response = await http.get(Uri.https(LOCAL_HOST, req));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body).cast<String>();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<String> createRoom(String func, String roomName) async {
    String req = COMMUNICLASS + func + Q_MARK + ADMIN_ID + AND + ROOM_NAME + roomName;
    print (req);
    final response = await http.post(Uri.https(LOCAL_HOST, req));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body).cast<String>();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
