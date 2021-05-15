import 'package:communiclass/services/database.dart';
import 'package:flutter/material.dart';
import 'package:communiclass/models/user.dart';

class TeacherRoom extends StatefulWidget {
  final User user;
  final String roomName;
  final int pin;

  TeacherRoom(this.user, this.roomName, this.pin);

  @override
  _TeacherRoomState createState() => _TeacherRoomState();
}

class _TeacherRoomState extends State<TeacherRoom> {
  double average = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('This is teacher room'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    "Room Name: " + widget.roomName + "\nRoom Pin: " + widget.pin.toString(),
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
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Average level of understanding in the classroom:',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: GestureDetector(
                    onTap: () async{
                      double current=await DatabaseService(uid: widget.user.uid).getRoomAvg(widget.pin);
                      // print(current);
                      setState(() {
                        average = current;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple[900],
                      radius: 50.0,
                      child: Text(
                        '$average',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
      ),
    );
  }
}

// class presNumber extends StatefulWidget {
//   @override
//   _presNumberState createState() => _presNumberState();
// }
//
// class _presNumberState extends State<presNumber> {
//   @override
//   Widget build(BuildContext context) {
//     return null;
//   }
// }
