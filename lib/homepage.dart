import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _loading = true;
  File? _image; // Add a null safety check for _image
  final imagePicker = ImagePicker();

  _loadImageGallery() async {
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      setState(() {
        _loading = false;
      });
      _image = File(image.path);
    }
  }

  _loadImageCamera() async {
    var image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      setState(() {
        _loading = false;
      });
      _image = File(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('Mask')),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          color: Colors.grey[500],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(60),
                child: Image.asset(
                  "assets/Images/mask.png",
                ),
              ),
              const Text(
                'Wear a mask, save lives!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    _loadImageCamera(); // Use the corrected method name
                  },
                  child: const Text(
                    'Camera',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    _loadImageGallery(); // Use the corrected method name
                  },
                  child: const Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _loading == false
                  ? SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.file(_image!),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
