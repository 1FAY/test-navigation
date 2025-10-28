import '../../data/models/task_model.dart';
import '../entities/task_entity.dart';

extension TaskModelMapper on TaskModel {
  TaskEntity toEntity() {
    final pr = switch (priority.toLowerCase()) {
      'low' => TaskPriority.low,
      'high' => TaskPriority.high,
      _ => TaskPriority.medium,
    };

    return TaskEntity(
      id: id,
      title: titleText.trim(),
      isDone: done == 1,
      deadline: deadlineIso != null ? DateTime.parse(deadlineIso!) : null,
      priority: pr,
    );
  }
}
