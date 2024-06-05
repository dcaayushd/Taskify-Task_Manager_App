import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskify/services/taskify_service.dart';

final serviceProvider = StateProvider<TaskifyService>((ref) {
  return TaskifyService() ;
});

