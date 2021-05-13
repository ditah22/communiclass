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
        backgroundColor: Colors.deepPurple[900],
        title: Text('This is teacher room'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          presNumber(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple[900],
                  ),
                  child: Text(
                    "End session",
                    style: TextStyle(
                      fontSize: 17.0,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
  String roomName = "Room name\nPassword";

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
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
            child: Text(
              'Average level of understanding in the classroom:',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple[900],
              radius: 70.0,
              child: Text(
                '$average',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
