import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PictureServices {
  final ImagePicker picker = ImagePicker();

  Future<File> openCamera(BuildContext context) async {
    PickedFile _cameraPicture = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 90,
      // maxHeight: 600,
      // maxWidth: 600,
    );

    if (_cameraPicture == null) {
      return null;
    }

    return File(_cameraPicture.path);
  }

  Future<File> openGallery(BuildContext context) async {
    PickedFile _galleryPicture = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 90,
      // maxHeight: 600,
      // maxWidth: 600,
    );

    if (_galleryPicture == null) {
      return null;
    }

    return File(_galleryPicture.path);
  }

  Future<File> showChoiceDialog(BuildContext context) async {
    File image;
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Choose one"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Camera"),
                onTap: () async {
                  final img = await openCamera(context);

                  image = img;
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              GestureDetector(
                child: Text("Gallery"),
                onTap: () async {
                  final img = await openGallery(context);

                  image = img;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
    return image;
  }
}
