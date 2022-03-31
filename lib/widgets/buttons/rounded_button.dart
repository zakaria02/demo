import '../../../shared/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedButton extends StatefulWidget {
  final String text;
  final Color color, textColor;
  final VoidCallback? press;
  bool state;
  RoundedButton({
    Key? key,
    required this.text,
    this.color = primaryColor,
    this.textColor = Colors.white,
    required this.press,
    required this.state,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RoundedButtonState();
  }
}

class _RoundedButtonState extends State<RoundedButton>
    with TickerProviderStateMixin {
  void animateButton() {
    var controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    controller.forward();
    setState(() {
      widget.state = true;
    });
  }

  Widget _builButtonChild() {
    if (!widget.state) {
      return Text(
        widget.text,
        style: TextStyle(color: widget.textColor),
      );
    } else {
      return const SizedBox(
        height: 18.0,
        width: 18.0,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(context),
      ),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      child: _builButtonChild(),
      onPressed: widget.press,
      style: ElevatedButton.styleFrom(
        primary: widget.color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        textStyle: TextStyle(
            color: widget.textColor, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
