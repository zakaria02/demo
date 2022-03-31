import '../../models/client.dart';
import 'package:flutter/cupertino.dart';

class ClientProvider with ChangeNotifier {
  Client? client;

  Future<void> importClient(Client newClient) async {
    client = newClient;
    notifyListeners();
  }

  Future<void> destoryClient() async {
    client = null;
    notifyListeners();
  }
}
