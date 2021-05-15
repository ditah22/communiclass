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
    int min = 100000;
    int max = 999999;
    int pin;
    bool flag = true;
    while (flag) {
      pin = min + _random.nextInt(max - min);
      await roomManagerCollection.document(pin.toString()).get().then((doc) => {
            flag = (doc.exists),
          });
    }
    await roomManagerCollection.document(pin.toString()).setData({
      'uid': uid,
      'roomName': roomName,
    });
    return pin;
  }

  Future updateRooms(int pin, int grade) async {
    bool flag;
    // flag = true if document with pin exists else false
    await roomManagerCollection.document(pin.toString()).get().then((doc) => {flag = (doc.exists)});
    if (flag) {
      //return doc values
      await roomsCollection.document(uid).setData({
        'pin': pin,
        'grade': grade,
      });
      return true;
    }
    //else doc not exists!
    return false;
  }

  Future getRoomName(int pin) async {
    return await roomManagerCollection.document(pin.toString()).get().then((doc) => doc.data["roomName"]);
  }

  Future getRoomAvg(int pin) async {
    double sum = 0;
    int total = 0;
    await roomsCollection
        .where("pin", isEqualTo: pin)
        .getDocuments()
        .then((queryDocs) async => queryDocs.documents.forEach((doc) {
              sum += doc.data["grade"];
              total += 1;
            }));
    if (total == 0) {
      return 10;
    }
    return sum / total;
  }
// Future updateStats() async {}
}
