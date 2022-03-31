import '../component/background.dart';
import 'component/body.dart';
import 'package:flutter/material.dart';

class ClientsListView extends StatelessWidget {
  const ClientsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Body(),
      title: "Mes clients",
    );
  }
}
