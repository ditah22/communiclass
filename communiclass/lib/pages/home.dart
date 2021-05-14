import 'package:communiclass/models/user.dart';
import 'package:communiclass/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 250.0,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () async {
                      User result = await signIn();
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
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: SizedBox(
                  width: 250.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      User result = await signIn();
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
      )),
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
