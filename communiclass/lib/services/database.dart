import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class DatabaseService {
  final String uid;
  final _random = new Random();

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference roomManagerCollection = Firestore.instance.collection('room_manager');
  final CollectionReference roomsCollection = Firestore.instance.collection('rooms');

  //TODO: implement stats
  // final CollectionReference statsCollection = Firestore.instance.collection('stats');

  Future updateRoomManager(String roomName) async {
    int min = 10000000;
    int max = 99999999;
    int pin = min + _random.nextInt(max - min); //TODO handle if exist
    return await roomManagerCollection.document(pin.toString()).setData({
      'uid': uid,
      'roomName': roomName,
    });
  }

  Future updateRooms(int pin, int grade) async {
    bool flag;
    // flag = true if document with pin exists else false
    roomManagerCollection.document(pin.toString()).get().then((doc) => {flag = (doc.exists)});
    if (flag) {
      //return doc values
      return await roomsCollection.document(pin.toString()).setData({
        'uid': uid,
        'grade': grade,
      });
    }
    //else doc not exists!
    return null;
  }

// Future updateStats() async {}
}
