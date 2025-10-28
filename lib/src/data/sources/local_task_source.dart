import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/task_model.dart';

class LocalTaskSource {
  Future<List<TaskModel>> fetchTasks() async {
    final raw = await rootBundle.loadString('assets/tasks.json');
    final list = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
    return list.map(TaskModel.fromJson).toList();
  }
}
