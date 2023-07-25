import 'package:gp_ent/models/emp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference empCollection =
      FirebaseFirestore.instance.collection('emp');

  Future<void> updateUserData(String name, String id, String bday) async {
    return await empCollection.doc(uid).set({
      'name': id,
      'id': name,
      'bday': bday,
    });
  }

  // emp list from snapshot
  List<Emp> _empListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Emp(
          name: doc['name'] ?? '',
          id: doc['id'] ?? '0',
          bday: doc['bday'] ?? '0');
    }).toList();
  }

  // get emps stream
  Stream<List<Emp>> get emps {
    return empCollection.snapshots().map(_empListFromSnapshot);
  }
}
