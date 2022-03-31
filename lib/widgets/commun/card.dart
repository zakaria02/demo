import 'component/card_item.dart';
import '../../services/providers/client_provider.dart';
import '../../models/client.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Client client;
  const MyCard({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Consumer<ClientProvider>(builder: (context, clientProvider, child) {
      return InkWell(
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 32, color: Colors.black45, spreadRadius: -8)
              ],
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/client.png",
                width: _width * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardItem(title: "Nom", data: client.nom),
                    CardItem(title: "Prénom", data: client.prenom),
                    CardItem(title: "Age", data: "${client.age} ans"),
                    CardItem(title: "Numéro de téléphone", data: client.numTel),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () => clientProvider
            .importClient(client)
            .then((value) => Navigator.of(context).pushNamed("/clientInfos")),
      );
    });
  }
}
