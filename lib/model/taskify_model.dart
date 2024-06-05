import 'package:cloud_firestore/cloud_firestore.dart';

class TaskifyModel {
  String? docID;
  final String titleTask;
  final String description;
  final String category;
  final String dateTask;
  final String timeTask;

  TaskifyModel({
    this.docID,
    required this.titleTask,
    required this.description,
    required this.category,
    required this.dateTask,
    required this.timeTask,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'docID': docID,
      'titleTask': titleTask,
      'description': description,
      'category': category,
      'dateTask': dateTask,
      'timeTask': timeTask,
    };
  }

  factory TaskifyModel.fromMap(Map<String, dynamic> map) {
    return TaskifyModel(
      docID: map['docID'] != null ? map['docID'] as String : null,
      titleTask: map['titleTask'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
    );
  }

  factory TaskifyModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return TaskifyModel(
      docID: doc.id,
      titleTask: doc['titleTask'],
      description: doc['description'],
      category: doc['category'],
      dateTask: doc['dateTask'],
      timeTask: doc['timeTask'],
    );
  }
}
