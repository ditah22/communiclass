import 'package:flutter/material.dart';

class Room extends StatefulWidget {
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('This is room screen'),
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