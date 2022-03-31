import '../../screens/commun/wait_page.dart';
import '../../shared/style.dart';
import '../../screens/clients_list/clients_list.dart';
import '../../services/firebase/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/my_user.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeController> {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (_, AsyncSnapshot<MyUser> user) {
        if (user.connectionState == ConnectionState.active) {
          final MyUser? monUtilisateur = user.data;
          if (monUtilisateur == null || monUtilisateur.uid.isEmpty) {
            return FutureBuilder(
              future: auth.signInAnonymously(),
              builder: (context, AsyncSnapshot<MyUser?> signedUser) {
                if (signedUser.connectionState == ConnectionState.done) {
                  return const ClientsListView();
                } else {
                  return const CircularProgressWidget(
                    primaryColor: primaryColor,
                  );
                }
              },
            );
          } else {
            return const ClientsListView();
          }
        }
        return const CircularProgressWidget(
          primaryColor: primaryColor,
        );
      },
    );
  }
}
