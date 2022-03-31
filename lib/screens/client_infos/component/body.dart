import 'info_item.dart';
import '../../../services/providers/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(
      builder: (context, clientProvider, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ListView(
            children: [
              InfoItem(
                title: "Nom",
                data: clientProvider.client!.nom,
              ),
              InfoItem(
                title: "Prénom",
                data: clientProvider.client!.prenom,
              ),
              InfoItem(
                title: "Age",
                data: "${clientProvider.client!.age} ans",
              ),
              InfoItem(
                title: "Numéro de téléphone",
                data: clientProvider.client!.numTel,
              ),
            ],
          ),
        );
      },
    );
  }
}
