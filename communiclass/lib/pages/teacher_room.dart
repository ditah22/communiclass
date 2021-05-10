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
        title: Text('This is teacher room screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
            children: [
              FlatButton.icon(onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
              },
                  icon: Icon(Icons.edit_location),
                  label: Text("end session")
              )
            ],
          )
      ),
    );
  }
}