import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/data/features/tastks/ui/task_list_screen.dart';


class App extends StatefulWidget {
  const App({ super.key });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme
          .fromSeed(
            seedColor: Colors.blueGrey,
            brightness: Brightness.light
          ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme
          .fromSeed(
            seedColor: Colors.blueGrey,
            brightness: Brightness.dark
          ),
      ),
      themeMode: ThemeMode.dark,
      home: TaskListScreen(),
    );
  }
}