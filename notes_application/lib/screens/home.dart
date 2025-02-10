import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_application/db/db_service.dart';
import 'package:notes_application/db/local_storage.dart';
import 'package:notes_application/screens/create_notes.dart';
import 'package:notes_application/screens/update_notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> notesList = [];
  // @override
  // void initState() {
  //   super.initState();
  //   getNotes();
  // }

  // getNotes() async {
  //   LocalStorage localStorage = LocalStorage();
  //   notesList = await localStorage.readNotes();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateNotes()));
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Text('Notes Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Reminders',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                  stream: DbService().readNotes(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    QuerySnapshot qs = snapshot.data;
                    int len = qs.docs.length;
                    print(len);
                    return MasonryGridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        itemCount: len,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = qs.docs[index];
                          Map data = ds.data() as Map;
                          String title = data['title'];
                          String description = data['description'];
                          String color = data['color'];
                          String dt = data['date_time'];
                          print(color);
                          String valueString = color
                              .split('(0x')[1]
                              .split(')')[0]; // kind of hacky..
                          int value = int.parse(valueString, radix: 16);
                          Color color2 = Color(value);
                          return GestureDetector(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Delete'),
                                      content: Text(
                                          "Are you sure want to delete it ?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              DbService()
                                                  .deleteNotes(docId: ds.id);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Deleted Successfully !!!')));
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateNotes(
                                        docId: ds.id,
                                        title: title,
                                        description: description,
                                        color: color2))),
                            child: notesCard(
                              title: title,
                              desc: description,
                              day: dt.split(" ")[0],
                              color: color2,
                            ),
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Container notesCard(
      {required String title,
      required String desc,
      required String day,
      required Color color}) {
    return Container(
      width: 200,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 10),
            Text(desc),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text('$day, 11.30 PM'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
