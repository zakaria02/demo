import 'package:flutter/material.dart';
import '../../../shared/style.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String data;
  const InfoItem({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: secondaryPolice,
              color: primaryColor,
              fontSize: 17,
            ),
          ),
          const Divider(
            color: primaryColor,
            thickness: 3,
            endIndent: 170,
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              data,
              style: const TextStyle(
                fontFamily: thirdPolice,
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
