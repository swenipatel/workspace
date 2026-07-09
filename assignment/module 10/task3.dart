import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;

  Future pickImage() async {
    final picked =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      image = File(picked.path);
      setState(() {});
    }
  }

  Future uploadImage() async {
    if (image == null) return;

    await FirebaseStorage.instance
        .ref("images/${DateTime.now().millisecondsSinceEpoch}.jpg")
        .putFile(image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Upload")),
      body: Column(
        children: [
          image == null
              ? Text("No Image")
              : Image.file(image!, height: 200),
          ElevatedButton(
            onPressed: pickImage,
            child: Text("Pick Image"),
          ),
          ElevatedButton(
            onPressed: uploadImage,
            child: Text("Upload"),
          ),
        ],
      ),
    );
  }
}