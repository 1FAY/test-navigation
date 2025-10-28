import 'package:flutter_application_1/src/domain/mappers/task_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/task_entity.dart';
import '../../../sources/local_task_source.dart';


final _taskSourceProvider = Provider((ref) => LocalTaskSource());

final taskListProvider = FutureProvider<List<TaskEntity>>((ref) async {
  final source = ref.watch(_taskSourceProvider);
  final models = await source.fetchTasks();
  return models.map((m) => m.toEntity()).toList();
});