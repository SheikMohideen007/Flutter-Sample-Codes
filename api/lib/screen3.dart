import 'package:api/counter_provider.dart';
import 'package:api/screen1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.count.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen1()));
                },
                child: Text('screen 1'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        provider.increment();
      }),
    );
  }
}
