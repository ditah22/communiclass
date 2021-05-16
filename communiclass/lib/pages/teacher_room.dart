import 'package:communiclass/services/database.dart';
import 'package:flutter/material.dart';
import 'package:communiclass/models/user.dart';
import 'package:wakelock/wakelock.dart';

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

  final String CLOSE_THE_ROOM = 'Do you want to close the room';
  final String END_SESSION = 'Do you want to end the session';

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: ()=>_onBackPressed(CLOSE_THE_ROOM),
        //   () async {
        // await DatabaseService(uid: widget.user.uid).closeRoom(widget.pin);
        // Navigator.pop(context, true);
        // return;},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: ()=>_onBackPressed(CLOSE_THE_ROOM)
                //   () async{
                // await DatabaseService(uid: widget.user.uid).closeRoom(widget.pin);
                // Navigator.pop(context, true);}
                ),
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
                      onTap: () async {
                        double current = await DatabaseService(uid: widget.user.uid).getRoomAvg(widget.pin);
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
                    onPressed: ()=>_onBackPressed(END_SESSION),
                    //     () {
                    //   Navigator.pop(context);
                    //   Navigator.pop(context);
                    // },
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
      ),
    );
  }

  Future<bool> _onBackPressed(String text) async {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text(text),
        actions: <Widget>[
          new GestureDetector(
            onTap: ()  async{
              await DatabaseService(uid: widget.user.uid).closeRoom(widget.pin);
              Wakelock.disable();
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
            },
            child: roundedButton(" Yes ", Colors.deepPurple[900],
                const Color(0xFFFFFFFF)),
          ),
          new GestureDetector(
            onTap: ()  {
              Navigator.of(context).pop(false);},
            child: roundedButton("No", Colors.deepPurple[900],
                const Color(0xFFFFFFFF)),
          ),
        ],
      ),
    );
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      width: 55.0,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }
}

