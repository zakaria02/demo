import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/client.dart';

class ClientFirestore {
  static Stream<QuerySnapshot> getAllClients(uid) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection('clients')
        .snapshots()
        .handleError((err) async {
      return Future.error("error while getting clients");
    });
  }

  static Future<bool> addClient(Client client, String uid) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("clients")
        .add(client.toJson())
        .then((value) {
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }
}
