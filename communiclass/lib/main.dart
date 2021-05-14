import 'package:communiclass/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:communiclass/pages/home.dart';
import 'package:communiclass/pages/room.dart';
import 'package:communiclass/pages/create_room.dart';
import 'package:communiclass/pages/join_room.dart';
import 'package:communiclass/pages/teacher_room.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/create_room': (context) => OpenRoom(),
      // '/room': (context) => Room(),
      '/join_room': (context) => JoinRoom(),
      // '/teacher_room': (context) => TeacherRoom(),
    },
  ));
}
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<User>.value(
//       value: AuthService().user,
//       child: MaterialApp(
//         // initialRoute: '/home',
//         // routes: {
//         //   '/home': (context) => Home(),
//         //   '/create_room': (context) => OpenRoom(),
//         //   '/room': (context) => Room(),
//         //   '/join_room': (context) => JoinRoom(),
//         //   '/teacher_room': (context) => TeacherRoom(),
//         // },
//         home: Home(),
//       ),
//     );
//   }
// }
