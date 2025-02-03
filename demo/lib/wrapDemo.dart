import 'package:flutter/material.dart';

class Wrapdemo extends StatefulWidget {
  const Wrapdemo({super.key});

  @override
  State<Wrapdemo> createState() => _WrapdemoState();
}

class _WrapdemoState extends State<Wrapdemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wrap(
        spacing: 20,
        runSpacing: 10,
        children: [
          paddingWithContainer(width: 100),
          paddingWithContainer(width: 100),
          paddingWithContainer(width: 100),
          paddingWithContainer(width: 10),
          paddingWithContainer(width: 100),
        ],
      ),
    );
  }
}

Widget paddingWithContainer({required double width}) {
  return Container(
    color: Colors.red,
    height: 200,
    width: width,
  );
}
