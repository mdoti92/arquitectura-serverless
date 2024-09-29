import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> addTask(
      {required String name, required String description}) async {
    await _firestore.collection('tasks').add({
      'name': name,
      'description': description,
      'create_at': DateTime.now()
    });
  }

  static Future<List<Map<String, dynamic>>> getTasks() async {
    final tasks = await _firestore.collection('tasks').get();

    return tasks.docs.map((docSnap) {
      final task = docSnap.data();
      task['id'] = docSnap.id;
      return task;
    }).toList();
  }
}
