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

  doTextRecognization() async {
    InputImage inputImage = InputImage.fromFile(widget.image);
    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );

    String text = recognizedText.text;
    print(text);
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
      body: Container(child: Image.file(widget.image)),
    );
  }
}
