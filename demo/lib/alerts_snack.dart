import 'package:flutter/material.dart';

class AlertsSnack extends StatefulWidget {
  const AlertsSnack({super.key});

  @override
  State<AlertsSnack> createState() => _AlertsSnackState();
}

class _AlertsSnackState extends State<AlertsSnack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // splashFactory:
                  ),
              onPressed: () {
                SnackBar snack = SnackBar(
                    duration: Duration(seconds: 10),
                    onVisible: () {
                      print('it is visible');
                    },
                    content: Text('Your profile is updated !!'));
                ScaffoldMessenger.of(context).showSnackBar(snack);
              },
              child: Text('Snack Bar demo')),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete'),
                        content:
                            Text('Are you sure want to delete this post ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No')),
                        ],
                      );
                    });
              },
              child: Text('Alert demo'))
        ],
      ),
    );
  }
}
