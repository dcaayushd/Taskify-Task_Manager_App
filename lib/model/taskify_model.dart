// import 'package:cloud_firestore/cloud_firestore.dart';

// class TaskifyModel {
//   String? docID;
//   final String titleTask;
//   final String description;
//   final String category;
//   final String dateTask;
//   final String timeTask;
//   final bool isDone;

//   TaskifyModel({
//     this.docID,
//     required this.titleTask,
//     required this.description,
//     required this.category,
//     required this.dateTask,
//     required this.timeTask,
//     required this.isDone,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       // 'docID': docID,
//       'titleTask': titleTask,
//       'description': description,
//       'category': category,
//       'dateTask': dateTask,
//       'timeTask': timeTask,
//       'isDone': isDone,
//     };
//   }

//   factory TaskifyModel.fromMap(Map<String, dynamic> map) {
//     return TaskifyModel(
//       docID: map['docID'] != null ? map['docID'] as String : null,
//       titleTask: map['titleTask'] as String,
//       description: map['description'] as String,
//       category: map['category'] as String,
//       dateTask: map['dateTask'] as String,
//       timeTask: map['timeTask'] as String,
//       isDone: map['isDone'] as bool,
//     );
//   }

//   factory TaskifyModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> doc) {
//     return TaskifyModel(
//       docID: doc.id,
//       titleTask: doc['titleTask'],
//       description: doc['description'],
//       category: doc['category'],
//       dateTask: doc['dateTask'],
//       timeTask: doc['timeTask'],
//       isDone: doc['isDone'],
//     );
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';

class TaskifyModel {
  String? docID;
  final String titleTask;
  final String description;
  final String category;
  final String dateTask;
  final String timeTask;
  final bool isDone;
  final bool isArchived;

  TaskifyModel({
    this.docID,
    required this.titleTask,
    required this.description,
    required this.category,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
    required this.isArchived,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'docID': docID,
      'titleTask': titleTask,
      'description': description,
      'category': category,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone': isDone,
      'isArchived': isArchived,
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
      isDone: map['isDone'] as bool,
      isArchived: map['isArchived'] as bool,
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
      isDone: doc['isDone'],
      isArchived: doc['isArchived'],
    );
  }
}
