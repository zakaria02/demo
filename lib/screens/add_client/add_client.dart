import '../component/background.dart';
import 'component/body.dart';
import 'package:flutter/material.dart';

class AddClientView extends StatelessWidget {
  const AddClientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Body(),
      title: "Ajouter un client",
    );
  }
}
