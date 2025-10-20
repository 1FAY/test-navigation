import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (i) => i + 1);
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final id = items[index];
        return Card(
          child: ListTile(
            title: Text('Item #$id'),
            subtitle: const Text('tap to open details (push)'),
            onTap: () {
              // Переход с добавлением в стек:
              context.push('/home/details/$id');
            },
            trailing: IconButton(
              icon: const Icon(Icons.open_in_new),
              tooltip: 'open (replace stack)',
              onPressed: () {
                // Жёсткая замена стека (например, навигация по deeplink):
                context.go('/home/details/$id');
              },
            ),
          ),
        );
      },
    );
  }
}