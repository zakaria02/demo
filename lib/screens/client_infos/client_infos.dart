import '../component/background.dart';
import 'component/body.dart';
import 'package:flutter/material.dart';

class ClientInfosView extends StatelessWidget {
  const ClientInfosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Body(),
      title: "Mon client",
    );
  }
}
