import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('This is home screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Center(
              child: Column(
                  children: [
                  SizedBox(
                    width: 250.0,
                    height: 50.0,
                    child: ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, '/open_room');
                    },
                        child: Text("Create new room")
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: SizedBox(
                      width: 250.0,
                      height: 50.0,
                      child: ElevatedButton(onPressed: () {
                        Navigator.pushNamed(context, '/join_room');
                      },
                          child: Text(
                              "Join room",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}