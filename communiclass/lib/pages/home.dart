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
        backgroundColor: Colors.deepPurple[900],
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
                      Navigator.pushNamed(context, '/create_room');
                    },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple[900],
                        ),
                        child: Text(
                          "Create new room",
                          style: TextStyle(
                            fontSize: 17.0,
                            letterSpacing: 0.8,
                          ),)
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
          )
      ),
    );
  }
}