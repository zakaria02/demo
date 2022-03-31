import '../../../services/firebase/firestore/client_firestore.dart';
import '../../../models/client.dart';
import '../../../widgets/buttons/rounded_button.dart';
import '../../../widgets/inputs/rounded_input_field.dart';
import '../../../models/my_user.dart';
import '../../../services/firebase/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  bool _state = false;
  Client client = Client(nom: "", prenom: "", age: 0, numTel: "");
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return FutureBuilder(
      future: auth.currentUser(),
      builder: (context, AsyncSnapshot<MyUser> monUtilisateur) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              RoundedInputField(
                hintText: "Nom",
                onChanged: (nom) {
                  client.nom = nom;
                },
              ),
              RoundedInputField(
                hintText: "Prénom",
                onChanged: (prenom) {
                  client.prenom = prenom;
                },
              ),
              RoundedInputField(
                hintText: "Age",
                onChanged: (age) {
                  client.age = int.parse(age);
                },
                inputType: TextInputType.number,
              ),
              RoundedInputField(
                hintText: "Numéro de téléphone",
                onChanged: (numTel) {
                  client.numTel = numTel;
                },
                inputType: TextInputType.phone,
                icon: Icons.phone,
              ),
              RoundedButton(
                text: "AJOUTER",
                press: _state
                    ? null
                    : () {
                        setState(() {
                          _state = true;
                        });
                        ClientFirestore.addClient(
                                client, monUtilisateur.data!.uid)
                            .then((added) {
                          if (added) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Le client a bien été ajouté"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Nous n'avons pas pu ajouter le client"),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          }
                        });
                      },
                state: _state,
              ),
            ],
          ),
        );
      },
    );
  }
}
