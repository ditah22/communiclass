import 'package:communiclass/services/database.dart';
import 'package:flutter/material.dart';
import 'package:communiclass/services/auth.dart';
import 'package:communiclass/models/user.dart';
import 'package:communiclass/pages/room.dart';

class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final myController = TextEditingController();
  int pin = 0;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('Communiclass'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: SizedBox(
                width: 250.0,
                height: 50.0,
                child: TextField(
                  controller: myController,
                  onChanged: (text) {
                    this.pin = int.parse(text);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter room pin',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: SizedBox(
                width: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () async {
                    User user = await signIn();
                    bool joined = await DatabaseService(uid: user.uid).updateRooms(this.pin, 10);
                    if (joined) {
                      String roomName = await DatabaseService(uid: user.uid).getRoomName(this.pin);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              //TODO given password, get room name
                              builder: (context) => Room(user, roomName, this.pin)));
                    } else {
                      _showMyDialog(context);
                    }
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
              ),
            ),
          ],
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

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            // title: Center(child: Text('Wrong password')),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Wrong Pin',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.4,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
