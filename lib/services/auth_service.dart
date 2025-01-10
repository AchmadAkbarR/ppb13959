import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login method
  static Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Jika berhasil, return null
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        return "Incorrect password.";
      }
      return e.message; // Return pesan error lain dari Firebase
    } catch (e) {
      return "An unexpected error occurred. Please try again.";
    }
  }

  // Register method
  static Future<String?> register(String email, String password) async {
    try {
      if (password.length < 6) {
        return "Password must be at least 6 characters long.";
      }
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null; // Jika berhasil, return null
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'This email is already registered.';
      } else if (e.code == 'weak-password') {
        return 'The password is too weak.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email address.';
      }
      return e.message;
    } catch (e) {
      return "Registration failed. Please try again.";
    }
  }

  // Logout method
  static Future<void> logout() async {
    await _auth.signOut();
  }

  // Reset password
  static Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null; // Jika berhasil, return null
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email.";
      } else if (e.code == 'invalid-email') {
        return "Invalid email address.";
      }
      return e.message;
    } catch (e) {
      return "An unexpected error occurred. Please try again.";
    }
  }

  // Update password
  static Future<String?> updatePassword(String newPassword) async {
    try {
      if (newPassword.length < 6) {
        return "Password must be at least 6 characters long.";
      }
      await _auth.currentUser?.updatePassword(newPassword);
      return null; // Jika berhasil, return null
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password is too weak.";
      } else if (e.code == 'requires-recent-login') {
        return "Please re-login to update your password.";
      }
      return e.message;
    } catch (e) {
      return "Failed to update password. Please try again.";
    }
  }

  // Check if user is logged in
  static User? get currentUser => _auth.currentUser;
}