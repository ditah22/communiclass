import 'package:communiclass/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:communiclass/pages/home.dart';
import 'package:communiclass/pages/create_room.dart';
import 'package:communiclass/pages/join_room.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/create_room': (context) => OpenRoom(),
      '/join_room': (context) => JoinRoom(),
    },
  ));
}
