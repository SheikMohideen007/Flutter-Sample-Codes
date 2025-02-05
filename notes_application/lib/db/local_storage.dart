import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? pref;
  void saveNotes(
      {required String title,
      required String description,
      required Color color,
      required DateTime? dt}) async {
    pref = await SharedPreferences.getInstance();
    // String str = title +
    //     ":" +
    //     description +
    //     ":" +
    //     color.toString() +
    //     ":" +
    //     dt.toString();
    String str = '$title:$description:${color.toString()}:${dt.toString()}';
    List<String> notesList = pref!.getStringList('notes') ?? [];
    print('before.. $notesList');
    notesList.add(str);
    print('after.. $notesList');
    await pref!.setStringList('notes', notesList);
  }
}
