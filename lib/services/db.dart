import 'package:gp_ent/models/emp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference empCollection =
      FirebaseFirestore.instance.collection('emp');

  Future<void> initializeUserData(
      String name, String id, Map<String, int> score) async {
    return await empCollection.doc(uid).set({
      'name': name,
      'id': id,
      'score': score,
    });
  }

  Future<void> updateUserData(String uid, Map<String, int> score) async {
    return await empCollection.doc(uid).update({
      'score': score,
    });
  }

  // emp list from snapshot
  List<Emp> _empListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Emp(
          name: doc['name'] ?? '',
          id: doc['id'] ?? '0',
          score: doc['score'] ?? '{"null": 0}');
    }).toList();
  }

  // get emps stream
  Stream<List<Emp>> get emps {
    return empCollection.snapshots().map(_empListFromSnapshot);
  }
}
