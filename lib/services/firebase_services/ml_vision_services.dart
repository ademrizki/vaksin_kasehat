import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:vaksin_kasehat/services/picture_services.dart';

class FirebaseMLVisionServices with PictureServices {
  final DocumentTextRecognizer _cloudDocumentTextRecognizer =
      FirebaseVision.instance.cloudDocumentTextRecognizer();

  Future fnRecognizeImageToText(BuildContext context) async {
    final _imageFile = await super.showChoiceDialog(context);
    final FirebaseVisionImage _visionImage =
        FirebaseVisionImage.fromFile(_imageFile);

    final VisionDocumentText _visionDocumentText =
        await _cloudDocumentTextRecognizer.processImage(_visionImage);

    String text = _visionDocumentText.text;
    for (DocumentTextBlock block in _visionDocumentText.blocks) {
      final Rect boundingBox = block.boundingBox;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;
      final documentTextRecognizedBreak = block.recognizedBreak;

      for (DocumentTextParagraph paragraph in block.paragraphs) {
        // Same getters as DocumentTextBlock
        for (DocumentTextWord word in paragraph.words) {
          // Same getters as DocumentTextBlock
          for (DocumentTextSymbol symbol in word.symbols) {
            // Same getters as DocumentTextBlock
          }
        }
      }
    }
  }
}
