import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> saveUserProfile({
    required String userId,
    required String name,
    required String email,
    required String phone,
  }) async {
    await _db.collection("users").doc(userId).set({
      "profile": {
        "name": name,
        "email": email,
        "phone": phone,
      },
    }, SetOptions(merge: true));
  }

  static Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    final doc = await _db.collection("users").doc(userId).get();
    return doc.exists ? doc.data() : null;
  }
}