//import '../../../services/local/validators.dart';
import '../../../shared/style.dart';
import 'package:flutter/material.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType inputType;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        keyboardType: inputType,
        /*validator: (email) {
          if (email == null || email.isEmpty)
            return "Veuillez saisir votre adresse mail!";
          else if (!Validator.isEmail(email))
            return "L'adresse mail saisie est incorrecte";
          return null;
        },*/
      ),
    );
  }
}
