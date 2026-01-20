import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 🔐 LOGIN
  Future<bool> login(
      String email,
      String password,
      bool rememberMe,
      ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Firebase يحفظ الجلسة تلقائيًا
      return true;
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  /// 🆕 REGISTER
  Future<void> register(
      String fullName,
      String userName,
      String email,
      String password,
      ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // حفظ الاسم (اختياري)
      await credential.user?.updateDisplayName(fullName);
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  /// 🔁 RESET PASSWORD
  Future<void> sendResetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  /// 🚪 LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

  /// 👤 CURRENT USER
  bool get isLoggedIn => _auth.currentUser != null;

  /// ❌ Error mapping (احترافي)
  String _mapError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'Email already in use';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      default:
        return 'Authentication error';
    }
  }
}
