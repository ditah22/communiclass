import 'package:flutter/material.dart';

class OpenRoom extends StatefulWidget {
  @override
  _OpenRoomState createState() => _OpenRoomState();
}

class _OpenRoomState extends State<OpenRoom> {

  final myController = TextEditingController();
  String roomName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('This is create room screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 250.0,
                height: 50.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: myController,
                  onChanged: (text) {this.roomName = text;},
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a room name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: SizedBox(
                  width: 250.0,
                  height: 50.0,
                  child: ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/teacher_room');
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple[900],
                    ),
                    child: Text(
                      "Create room",
                      style: TextStyle(
                        fontSize: 17.0,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}