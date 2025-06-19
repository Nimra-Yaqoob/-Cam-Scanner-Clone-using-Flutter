import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class Recognizerscreen extends StatefulWidget {
  File image;
  Recognizerscreen(this.image, {super.key});
  @override
  State<Recognizerscreen> createState() => _Recognizerscreen();
}

class _Recognizerscreen extends State<Recognizerscreen> {
  late TextRecognizer textRecognizer;
  @override
  void initState() {
    super.initState();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    doTextRecognization();
  }

  String result = "";
  doTextRecognization() async {
    InputImage inputImage = InputImage.fromFile(widget.image);
    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );

    result = recognizedText.text;

    String text = recognizedText.text;
    print(result);
    setState(() {
      result;
    });
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Recognizer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Image.file(widget.image)),
            Card(
              margin: EdgeInsets.all(10),
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.document_scanner, color: Colors.white),
                          Text(
                            'Results',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Icon(Icons.copy, color: Colors.white),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    color: Colors.blueAccent,
                  ),

                  Text(result,style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
