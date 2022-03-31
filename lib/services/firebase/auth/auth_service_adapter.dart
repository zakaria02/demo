import 'dart:async';
import '../../../models/my_user.dart';
import 'auth_service.dart';
import 'firebase_auth_service.dart';

class AuthServiceAdapter implements AuthService {
  AuthServiceAdapter() {
    _setup();
  }
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  AuthService get authService => _firebaseAuthService;

  late StreamSubscription<MyUser> _firebaseAuthSubscription;

  void _setup() {
    // Observable<User>.merge was considered here, but we need more fine grained control to ensure
    // that only events from the currently active service are processed
    _firebaseAuthSubscription =
        _firebaseAuthService.onAuthStateChanged.listen((MyUser user) {
      _onAuthStateChangedController.add(user);
    }, onError: (dynamic error) {
      _onAuthStateChangedController.addError(error);
    });
  }

  @override
  void dispose() {
    _firebaseAuthSubscription.cancel();
    _onAuthStateChangedController.close();
  }

  final StreamController<MyUser> _onAuthStateChangedController =
      StreamController<MyUser>.broadcast();
  @override
  Stream<MyUser> get onAuthStateChanged => _onAuthStateChangedController.stream;

  @override
  Future<MyUser> currentUser() => authService.currentUser();

  @override
  Future<MyUser> signInAnonymously() => authService.signInAnonymously();

  @override
  Future<void> signOut() => authService.signOut();
}
