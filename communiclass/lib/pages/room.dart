import 'package:flutter/material.dart';
import 'custom_slider_thumb_circle.dart';

class Room extends StatefulWidget {
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {

  SliderWidget sliderWidget = SliderWidget();
  double _value = 10;

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
              Center(
                  child: sliderWidget,
              ),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[900],
                ),
                child: Text(
                  "Join room",
                  style: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}



