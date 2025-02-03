import 'package:demo/alerts_snack.dart';
import 'package:demo/demo_container.dart';
import 'package:demo/home.dart';
import 'package:demo/listViewBuilder_demo.dart';
import 'package:demo/listView_demo.dart';
import 'package:demo/wrapDemo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: ListviewbuilderDemo(),
    );
  }
}
