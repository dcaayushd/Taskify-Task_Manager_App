import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskify/model/taskify_model.dart';

class TaskifyService {
  final taskifyCollection = FirebaseFirestore.instance.collection('taskify');

  //CRUD

  //Create
  void addNewTask(TaskifyModel model) {
    taskifyCollection.add(model.toMap());
  }

  //Create
  void updateTask(String? docID, bool? valueUpdate) {
    taskifyCollection.doc(docID).update({
      'isDone': valueUpdate,
    });
  }

  //Delete
   void deleteTask(String? docID) {
    taskifyCollection.doc(docID).delete();
  }
}
