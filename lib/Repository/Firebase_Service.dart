import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/Task.dart';

class FirebaseService {
  final firestore = FirebaseFirestore.instance;

  Stream<List<Task>> getTasks() {
    return firestore.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();
    });
  }

  Future<void> addTask(Task task) async {
    await firestore
        .collection('tasks')
        .add(task.toJson())
        .then((value) async => {
              await firestore
                  .collection('tasks')
                  .doc(value.id)
                  .update({'uid': value.id})
            });
  }

  Future<void> updateTask(Task task) async {
    await FirebaseFirestore.instance
        .collection("tasks")
        .doc(task.uid)
        .update(task.toJson());
  }

  Future<void> delete(Task task) async {
    await FirebaseFirestore.instance
        .collection("tasks")
        .doc(task.uid)
        .delete();
  }
}

final databaseProvider = Provider((ref) => FirebaseService());
