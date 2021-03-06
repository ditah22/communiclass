import 'package:flutter/material.dart';
import 'custom_slider_thumb_circle.dart';
import 'package:communiclass/models/user.dart';

class Room extends StatefulWidget {
  final User user;
  final String roomName;
  final int pin;

  Room(this.user, this.roomName, this.pin);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('Communiclass'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,30),
            child: Text(
              widget.roomName + "\nRoom Pin: " + widget.pin.toString(),
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.3,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Use this slider to rate your current level of understanding',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.3,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child: Center(
              child: SliderWidget(widget.user, widget.pin),
            ),
          ),
        ],
      ),
    );
  }
}
