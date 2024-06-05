import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskify/model/taskify_model.dart';
import 'package:taskify/services/taskify_service.dart';

final serviceProvider = StateProvider<TaskifyService>((ref) {
  return TaskifyService();
});

final fetchStreamProvider = StreamProvider<List<TaskifyModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('taskify')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => TaskifyModel.fromSnapshot(snapshot))
          .toList());
  yield* getData;
});
