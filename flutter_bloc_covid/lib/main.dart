import 'package:flutter/material.dart';
import 'package:flutter_bloc_covid/ui/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid App',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
