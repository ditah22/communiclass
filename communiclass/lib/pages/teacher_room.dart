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
                  child: ElevatedButton(onPressed: () {
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
  String roomName = "ROOM NAME";

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
                fontSize: 40.0,
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
          ),
        ],
      ),
    );
  }
}
