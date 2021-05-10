import 'package:flutter/material.dart';

class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('This is join room screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
            children: [
              FlatButton.icon(onPressed: () {
                Navigator.pushNamed(context, '/room');
              },
                  icon: Icon(Icons.edit_location),
                  label: Text("enter room number")
              )
            ],
          )
      ),
    );
  }
}