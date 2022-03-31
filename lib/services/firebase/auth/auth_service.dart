import 'dart:async';
import '../../../models/my_user.dart';

abstract class AuthService {
  Future<MyUser> currentUser();
  Future<MyUser> signInAnonymously();
  Future<void> signOut();
  Stream<MyUser> get onAuthStateChanged;
  void dispose();
}
