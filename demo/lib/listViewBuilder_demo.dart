import 'package:flutter/material.dart';

class ListviewbuilderDemo extends StatefulWidget {
  const ListviewbuilderDemo({super.key});

  @override
  State<ListviewbuilderDemo> createState() => _ListviewbuilderDemoState();
}

class _ListviewbuilderDemoState extends State<ListviewbuilderDemo> {
  int count = 20;
  List<Color> color = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.brown,
    Colors.white
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: color.length,
          itemBuilder: (context, index) {
            return paddingWithContainer(color: color[index]);
          }),
    );
  }
}

Widget paddingWithContainer({required Color color}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Container(
      color: color,
      height: 200,
    ),
  );
}
