import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void createNotes(
      {required String title,
      required String description,
      required Color color,
      required DateTime? dt}) {
    firestore.collection('Notes').add({
      'title': title,
      'description': description,
      'color': color.toString(),
      'date_time': dt.toString()
    });
  }

  Stream readNotes() {
    return firestore.collection('Notes').snapshots();
  }
}
