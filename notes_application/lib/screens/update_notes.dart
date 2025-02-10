import 'package:flutter/material.dart';
import 'package:notes_application/db/db_service.dart';

class UpdateNotes extends StatefulWidget {
  final String title, description, docId;
  final Color color;
  const UpdateNotes(
      {super.key,
      required this.title,
      required this.description,
      required this.color,
      required this.docId});

  @override
  State<UpdateNotes> createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  Color defaultColor = Colors.white;
  DateTime? dt = DateTime.now();
  // String str="    Name    ";

  @override
  void initState() {
    super.initState();
    setState(() {
      title.text = widget.title;
      description.text = widget.description;
      defaultColor = widget.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("${title.text}..${description.text}");
          if (title.text.trim().isNotEmpty &&
              description.text.trim().isNotEmpty) {
            // LocalStorage local = LocalStorage();
            // local.saveNotes(
            //     title: title.text.trim(),
            //     description: description.text.trim(),
            //     color: defaultColor,
            //     dt: dt);
            DbService dbService = DbService();
            dbService.updateNotes(
                docId: widget.docId,
                title: title.text,
                description: description.text,
                color: defaultColor,
                dt: dt);

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notes saved successfully !!!')));
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Title & Description should not be empty')));
          }
        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text('Update Notes'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () async {
                dt = await showDatePicker(
                  context: context,
                  // currentDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                print(dt);
              },
              icon: Icon(Icons.date_range)),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            colorCard(color: Colors.blue.shade300),
                            colorCard(color: Colors.red.shade300),
                            colorCard(color: Colors.green.shade300),
                            colorCard(color: Colors.purple.shade300),
                            colorCard(color: Colors.orange.shade300),
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(Icons.palette))
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter a Title : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Text(
              'Enter a Description : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                controller: description,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget colorCard({required Color color}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          defaultColor = color;
        });

        Navigator.pop(context);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
      ),
    );
  }
}
