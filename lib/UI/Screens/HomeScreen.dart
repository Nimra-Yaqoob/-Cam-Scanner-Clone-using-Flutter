import 'dart:io';

import 'package:documentscanne/UI/Screens/RecognizerScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hexcolor/hexcolor.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late ImagePicker imagePicker;
  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#edfafd"),
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: Colors.blueAccent,
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.scanner_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text('Scan', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.document_scanner,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(
                          'Recognize',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.assessment_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text('Enhance', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.black,
            child: Container(height: MediaQuery.of(context).size.height - 250),
          ),
          Card(
            color: Colors.blueAccent,
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.rotate_left,
                      size: 35,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.camera,
                      size: 35,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.image_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    onTap: () async {
                      XFile? xfile = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (xfile != null) {
                        File image = File(xfile.path);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Recognizerscreen(image);
                          }),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
