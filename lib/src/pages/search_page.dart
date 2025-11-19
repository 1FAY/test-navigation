import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Search'),
        const SizedBox(height: 12),
        FilledButton.icon(
          icon: const Icon(Icons.search),
          label: const Text('Имитация результата → Details #99'),
          onPressed: () => context.push('/home/details/99'),
        ),
      ]),
    );
  }
}