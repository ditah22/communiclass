import 'package:flutter/material.dart';

class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final myController = TextEditingController();
  int roomPassword = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('This is join room screen'),
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
                    this.roomPassword = int.parse(text);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter room password',
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
                  onPressed: () {
                    if(this.roomPassword == 1234){
                      Navigator.pushNamed(context, '/room');
                    }
                    else {
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
                  Text('Wrong password', textAlign: TextAlign.center,
                  textScaleFactor: 1.4,),
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


