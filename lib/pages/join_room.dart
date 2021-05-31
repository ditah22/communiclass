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
  String invalidPassword = "";
  final myController = TextEditingController();
  String pin = "";
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
                    this.pin = text;
                    setState(() => invalidPassword = "");
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: 'Enter room pin',
                    errorText: invalidPassword,
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
                    if (!this.isNumeric(this.pin)) {
                      setState(() => invalidPassword = "Password should contain digits only");
                    } else if (this.pin.length != 6) {
                      setState(() => invalidPassword = "Password should be 6 digits");
                    } else {
                      bool joined = await DatabaseService(uid: user.uid).updateRooms(int.parse(this.pin), 10);
                      if (joined) {
                        setState(() => invalidPassword = "");
                        String roomName =
                            await DatabaseService(uid: user.uid).getRoomName(int.parse(this.pin));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // given password, get room name
                                builder: (context) => Room(user, roomName, int.parse(this.pin))));
                      } else {
                        setState(() => invalidPassword = "Invalid password");
                        // _showMyDialog(context);
                      }
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

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
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
