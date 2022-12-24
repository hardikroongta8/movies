import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _authService = FirebaseAuth.instance;

  Stream<User?> get user{
    return _authService.authStateChanges();
  }

  Future register(String email, String password) async {
    try {
      UserCredential result = await _authService.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future login(String email, String password) async {
    try {
      UserCredential result = await _authService.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logout() async {
    try {
      return await _authService.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}