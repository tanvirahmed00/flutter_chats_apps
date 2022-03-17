import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Function_provider extends ChangeNotifier{
  File? file;
  ImagePicker image = ImagePicker();
  Future CameraImage() async {

    var img = await image.getImage(source: ImageSource.camera);
    // setState(() {
    //   file = File(img!.path);
    // });
    file = File(img!.path);
    notifyListeners();
  }
  Future GalleryImage() async {
    var img = await image.getImage(source: ImageSource.gallery);
    // setState(() {
    //   file = File(img!.path);
    // });
    file = File(img!.path);
    notifyListeners();
  }

}
