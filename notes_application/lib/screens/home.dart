import 'package:flutter/material.dart';
import 'package:notes_application/db/local_storage.dart';
import 'package:notes_application/screens/create_notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> notesList = [];
  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {
    LocalStorage localStorage = LocalStorage();
    notesList = await localStorage.readNotes();
    setState(() {});
  }

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
              child: ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    String title = notesList[index].split(':')[0];
                    String description = notesList[index].split(':')[1];
                    String color = notesList[index].split(':')[2];
                    String dt = notesList[index].split(':')[3];
                    print(color);
                    String valueString =
                        color.split('(0x')[1].split(')')[0]; // kind of hacky..
                    int value = int.parse(valueString, radix: 16);
                    Color color2 = Color(value);
                    return notesCard(
                      title: title,
                      desc: description,
                      day: dt,
                      color: color2,
                    );
                  }),
            )
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
