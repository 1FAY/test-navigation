class TaskModel {
  final String id;
  final String titleText;
  final int done;
  final String? deadlineIso;
  final String priority;

  TaskModel({
    required this.id,
    required this.titleText,
    required this.done,
    required this.deadlineIso,
    required this.priority,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'] as String,
        titleText: json['title_text'] as String,
        done: json['done'] as int,
        deadlineIso: json['deadline_iso'] as String?,
        priority: json['priority'] as String,
      );
}
