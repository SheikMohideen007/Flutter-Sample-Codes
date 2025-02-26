import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker picker = ImagePicker();
  String? image;

  getFromGallery() async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = file!.path;
    });
  }

  getFromCamera() async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = file!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: image == null
                  ? Image.asset('images/profile_icon.png')
                  : Image.file(File(image!)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  getFromGallery();
                                  Navigator.pop(context);
                                },
                                title: Text('Select from gallery'),
                                trailing: Icon(Icons.photo),
                              ),
                              ListTile(
                                onTap: () {
                                  getFromCamera();
                                  Navigator.pop(context);
                                },
                                title: Text('Select from camera'),
                                trailing: Icon(Icons.camera),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Text('Upload pic'))
          ],
        ),
      ),
    );
  }
}
