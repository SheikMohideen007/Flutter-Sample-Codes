import 'package:flutter/material.dart';

class DemoContainer extends StatefulWidget {
  const DemoContainer({super.key});

  @override
  State<DemoContainer> createState() => _DemoContainerState();
}

class _DemoContainerState extends State<DemoContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Demo'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              print('icon clicked');
              // debugPrint('icon clicked');
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Icon(Icons.more_vert),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
          Container(
              height: 100,
              width: 300,
              // color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  image:
                      DecorationImage(image: AssetImage('images/nature.jpg')),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(
                  child: Text('hello',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w900)))),
          SizedBox(
              height: 300,
              width: 400,
              child: Image.asset('images/nature.jpg', fit: BoxFit.cover)),
          SizedBox(
              height: 300,
              width: 400,
              child: Image.network(
                  'https://www.shutterstock.com/image-photo/calm-weather-on-sea-ocean-600nw-2212935531.jpg',
                  fit: BoxFit.cover))
        ],
      ),
    );
  }
}
