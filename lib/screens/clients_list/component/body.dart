import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/widgets/commun/card.dart';
import '../../../models/client.dart';
import '../../../services/firebase/firestore/client_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/my_user.dart';
import '../../../services/firebase/auth/auth_service.dart';
import '../../../shared/style.dart';
import '../../commun/wait_page.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  // ignore: prefer_final_fields
  List<Client> _clients = [];
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);
    return FutureBuilder(
      future: auth.currentUser(),
      builder: (context, AsyncSnapshot<MyUser> monUtilisateur) {
        if (monUtilisateur.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: ClientFirestore.getAllClients(monUtilisateur.data!.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> clients) {
              _clients.clear();
              if (clients.hasData) {
                for (var client in clients.data!.docs) {
                  _clients.add(
                      Client.fromJson(client.data() as Map<String, dynamic>));
                }
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: _clients.length,
                    itemBuilder: (context, index) {
                      return MyCard(client: _clients[index]);
                    },
                  ),
                );
              } else {
                return const CircularProgressWidget(
                  primaryColor: primaryColor,
                );
              }
            },
          );
        } else {
          return const CircularProgressWidget(
            primaryColor: primaryColor,
          );
        }
      },
    );
  }
}
