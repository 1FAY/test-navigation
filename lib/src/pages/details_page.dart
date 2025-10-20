import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Details for item #$id', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        FilledButton.icon(
          icon: const Icon(Icons.arrow_back),
          label: const Text('pop()'),
          onPressed: () => context.pop(),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () async {
            // Показать модальное окно — это тоже часть “навигации” (overlay):
            final result = await showDialog<String>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Dialog'),
                content: const Text('Это диалог поверх текущего маршрута'),
                actions: [
                  TextButton(onPressed: () => Navigator.of(context).pop('cancel'), child: const Text('Cancel')),
                  FilledButton(onPressed: () => Navigator.of(context).pop('ok'), child: const Text('OK')),
                ],
              ),
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Dialog result: $result')));
            }
          },
          child: const Text('showDialog()'),
        ),
        const SizedBox(height: 8),
        FilledButton.tonal(
          onPressed: () async {
            await showModalBottomSheet<void>(
              context: context,
              builder: (context) => SafeArea(
                child: ListTile(
                  title: const Text('Это bottom sheet'),
                  trailing: const Icon(Icons.keyboard_arrow_down),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
            );
          },
          child: const Text('showModalBottomSheet()'),
        ),
      ]),
    );
  }
}
