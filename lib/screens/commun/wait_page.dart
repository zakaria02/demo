import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  final Color primaryColor;
  const CircularProgressWidget({
    Key? key,
    required this.primaryColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 56.0,
              width: 56.0,
              child: CircularProgressIndicator(
                value: null,
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Veuillez attendre s'il vous plaît !!",
            style: TextStyle(
                fontFamily: "Quicksand", fontSize: 17, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
