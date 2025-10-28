import 'package:equatable/equatable.dart';

enum TaskPriority { low, medium, high }

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final bool isDone;
  final DateTime? deadline;
  final TaskPriority priority;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.isDone,
    required this.deadline,
    required this.priority,
  });

  @override
  List<Object?> get props => [id, title, isDone, deadline, priority];
}
