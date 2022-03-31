import '../../../models/my_user.dart';
import 'auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  MyUser _userFromFirebase(User? user) {
    return MyUser(
      uid: user!.uid,
    );
  }

  @override
  Stream<MyUser> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<MyUser> signInAnonymously() async {
    final UserCredential userCredential =
        await _firebaseAuth.signInAnonymously();
    MyUser monUtilisateur = _userFromFirebase(userCredential.user);
    return monUtilisateur;
  }

  @override
  Future<MyUser> currentUser() async {
    MyUser monUtilisateur = _userFromFirebase(_firebaseAuth.currentUser);
    return monUtilisateur;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  void dispose() {}
}
