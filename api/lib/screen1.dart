import 'package:api/counter_provider.dart';
import 'package:api/screen2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    return Scaffold(
      backgroundColor: provider.dark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('State Management demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.count.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen2()));
                },
                child: Text('screen 2')),
            ElevatedButton(
                onPressed: () {
                  provider.toggleMode();
                },
                child: Text('toggle mode'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.increment();
          // setState(() {

          // });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
