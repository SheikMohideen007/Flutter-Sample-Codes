import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listData = [];
  fetchApiData() async {
// get --> fetch the data from the api endpoint
// post --> create a new data in the api
// delete --> delete a data in the api
// put -->  update a existing data in the api

    String url = "https://dummyjson.com/users";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    setState(() {
      listData = data['users'] as List;
    });

    // print(data['users'][0]['firstName']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchApiData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Data'),
      ),
      body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            final userImg = listData[index]['image'];
            final userName = listData[index]['firstName'];
            final userDOB = listData[index]['birthDate'];
            final university = listData[index]['university'];
            return ListTile(
              leading: CircleAvatar(
                child: Image.network(userImg),
              ),
              title: Text(userName),
              subtitle: Text(userDOB),
              trailing: Text(university),
            );
          }),
    );
  }
}
