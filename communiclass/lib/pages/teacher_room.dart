import 'package:flutter/material.dart';

class TeacherRoom extends StatefulWidget {
  @override
  _TeacherRoomState createState() => _TeacherRoomState();
}

class _TeacherRoomState extends State<TeacherRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('This is teacher room'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.deepPurple[50],
      body: SafeArea(
          child: Column(
        children: [presNumber()],
      )),
    );
  }
}

class presNumber extends StatefulWidget {
  @override
  _presNumberState createState() => _presNumberState();
}

class _presNumberState extends State<presNumber> {
  double average = 10;
  String roomName = "temp";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Text(
              '$roomName',
              style: TextStyle(
                color: Colors.deepPurple[800],
                letterSpacing: 2.0,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,

              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
            child: Text(
              'the average level of understanding in the class is:',
              style: TextStyle(
                color: Colors.orangeAccent[400],
                letterSpacing: 2.0,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,

              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),

            child: Text(
              '$average',
              style: TextStyle(
                color: Colors.deepPurple[900],
                letterSpacing: 2.0,
                fontSize: 100.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
