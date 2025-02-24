import 'package:api/counter_provider.dart';
import 'package:api/screen3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    int count = Provider.of<CounterProvider>(context).count;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen3()));
                },
                child: Text('screen 3'))
          ],
        ),
      ),
    );
  }
}
