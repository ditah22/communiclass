import 'package:flutter/material.dart';
import 'package:communiclass/pages/home.dart';
import 'package:communiclass/pages/room.dart';
import 'package:communiclass/pages/open_room.dart';
import 'package:communiclass/pages/join_room.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home':(context) => Home(),
      '/open_room': (context) => OpenRoom(),
      '/room': (context) => Room(),
      '/join_room': (context) => JoinRoom(),
    },
  ));
}
