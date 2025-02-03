import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? pref;
  void saveNotes({required String title, required String description}) async {
    pref = await SharedPreferences.getInstance();
    String str = title + ":" + description;
    List<String> notesList = pref!.getStringList('notes') ?? [];
    notesList.add(str);
    await pref!.setStringList('notes', notesList);
  }
}
