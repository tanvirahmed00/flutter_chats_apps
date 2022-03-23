import 'dart:io';
import 'package:chats_apps/model_class/send_and_recived.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Function_provider extends ChangeNotifier{
  Send_and_recived_models __facultyModels=Send_and_recived_models();
  Send_and_recived_models get facultyModel => __facultyModels;
  set facultyModel(Send_and_recived_models model) {
    model = Send_and_recived_models();
    __facultyModels = model;
    notifyListeners();
  }



  File? file;
  ImagePicker image = ImagePicker();
  var img;
  Future CameraImage() async {

    var img = await image.getImage(source: ImageSource.camera);

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
