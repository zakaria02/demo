import 'shared/style.dart';
import 'screens/add_client/add_client.dart';
import 'screens/client_infos/client_infos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/Home/home.dart';
import 'screens/clients_list/clients_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/firebase/auth/auth_service.dart';
import 'services/firebase/auth/auth_service_adapter.dart';
import 'services/providers/client_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ClientProvider _userProvider = ClientProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClientProvider>(
          create: (context) => _userProvider,
        ),
        Provider<AuthService>(
          create: (context) => AuthServiceAdapter(),
          dispose: (_, AuthService authService) => authService.dispose(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeController(),
          '/clientsList': (context) => const ClientsListView(),
          '/clientInfos': (context) => const ClientInfosView(),
          '/addClient': (context) => const AddClientView(),
        },
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: primaryColor,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: thirdPolice,
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
