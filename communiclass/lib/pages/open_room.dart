import 'package:flutter/material.dart';

class OpenRoom extends StatefulWidget {
  @override
  _OpenRoomState createState() => _OpenRoomState();
}

class _OpenRoomState extends State<OpenRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('This is open room screen'),
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
                  label: Text("to room screen")
              )
            ],
          )
      ),
    );
  }
}