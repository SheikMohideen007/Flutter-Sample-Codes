import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  const Demo1({super.key});

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // CircleAvatar(
          //   radius: 100,
          //   child: SizedBox(
          //     child: Image.asset('images/nature.jpg',fit: Box,)),
          // )
          paddingWithContainer(color: Colors.red),
          paddingWithContainer(color: Colors.blue),
          paddingWithContainer(color: Colors.green),
          paddingWithContainer(color: Colors.yellow),
          paddingWithContainer(color: Colors.red),
          paddingWithContainer(color: Colors.blue),
          paddingWithContainer(color: Colors.green),
          paddingWithContainer(color: Colors.yellow),
        ],
      ),
    );
  }

  Padding paddingWithContainer({required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: color,
        height: 200,
      ),
    );
  }
}

func(int a, String b) {}
