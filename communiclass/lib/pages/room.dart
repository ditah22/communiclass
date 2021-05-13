import 'package:flutter/material.dart';
import 'custom_slider_thumb_circle.dart';

class Room extends StatefulWidget {
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {

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
              Padding(
                padding: const EdgeInsets.fromLTRB(0,450,0,0),
                child: Center(
                    child: SliderWidget(),
                ),
              ),

            ],
          )
      ),
    );
  }
}


