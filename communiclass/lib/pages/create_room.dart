import 'package:communiclass/pages/teacher_room.dart';
import 'package:flutter/material.dart';
import 'package:communiclass/services/auth.dart';
import 'package:communiclass/models/user.dart';

class OpenRoom extends StatefulWidget {
  @override
  _OpenRoomState createState() => _OpenRoomState();
}

class _OpenRoomState extends State<OpenRoom> {

  final AuthService _auth = AuthService();
  final myController = TextEditingController();
  String roomName = "";
  String FUNC = "createRoom";

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
                  controller: myController,
                  onChanged: (text) {
                    this.roomName = text;
                  },
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
                  child: ElevatedButton(onPressed: () async {
                    User result = await signIn();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => TeacherRoom(result, roomName)));
                    // Navigator.pushNamed(context, '/teacher_room');
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
  Future signIn() async {
    dynamic result = await _auth.signInAnon();
    if (result == null) {
      print('error sign-in');
    } else {
      print('signed in');
      print(result.uid);
      return result;
    }
  }
}

