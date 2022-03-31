import '../../../shared/style.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String data;
  const CardItem({Key? key, required this.title, required this.data})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width * 0.4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title : ",
            style: const TextStyle(
              fontFamily: primaryPolice,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 5, bottom: 5),
              child: Text(
                data,
                style: const TextStyle(
                  fontFamily: secondaryPolice,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
