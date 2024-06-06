import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskify/model/taskify_model.dart';

class TaskifyService {
  final taskifyCollection = FirebaseFirestore.instance.collection('taskify');

  // CRUD

  // Create
  void addNewTask(TaskifyModel model) {
    taskifyCollection.add(model.toMap());
  }

  // Update
  void updateTask(String? docID, bool? valueUpdate) {
    taskifyCollection.doc(docID).update({
      'isDone': valueUpdate,
    });
  }

  // Delete
  void deleteTask(String? docID) {
    taskifyCollection.doc(docID).delete();
  }

  // Archive
  void archiveTask(String? docID) {
    taskifyCollection.doc(docID).update({
      'isArchived': true,
    });
  }

  // UnArchive
  void unArchiveTask(String? docID) {
    taskifyCollection.doc(docID).update({
      'isArchived': false,
    });
  }
}
