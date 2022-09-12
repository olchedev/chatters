import 'package:chatters/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getUser(String uid) {
    return _db.collection(Constants.userCollection).doc(uid).get();
  }

  Future<void> updateUserLastActive(String uid) async {
    try {
      await _db.collection(Constants.userCollection).doc(uid).update(
        {
          'last_active': DateTime.now().toUtc(),
        },
      );
    } catch (e) {
      print('update last_active error: $e');
    }
  }
}
