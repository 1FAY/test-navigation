import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_list_provider.dart';


class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Список задач')),
      body: tasksAsync.when(
        data: (tasks) => ListView.separated(
          itemCount: tasks.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, i) {
            final t = tasks[i];
            return ListTile(
              leading: Icon(
                t.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                color: t.isDone ? Colors.green : Colors.grey,
              ),
              title: Text(t.title),
              subtitle: Text('Приоритет: ${t.priority.name}'
                  '${t.deadline != null ? '\nДедлайн: ${t.deadline}' : ''}'),
            );
          },
        ),
        error: (e, _) => Center(child: Text('Ошибка: $e')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
