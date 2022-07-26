import 'dart:io';
import 'package:chats_apps/model_class/send_and_recived.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Function_provider extends ChangeNotifier{
  Send_and_recived_models __facultyModels=Send_and_recived_models();
  Send_and_recived_models get facultyModel => __facultyModels;
  List<Send_and_recived_models> userListbycategory = [];
  List<Send_and_recived_models> get productListByCategory => userListbycategory;
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
  Future<void> getProductsByCategory(String email) async {
    //final String id = await getPreferenceId();
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .where(email, isEqualTo: email)
          .get()
          .then((snapShot) {
        userListbycategory.clear();
        snapShot.docChanges.forEach((element) {
          print("Length: " + userListbycategory.length.toString());
          Send_and_recived_models productModels = Send_and_recived_models(

            name: element.doc['name'],
            image: element.doc['image'],
            email: element.doc['email'],
          );
          userListbycategory.add(productModels);
        });
      });
      print("Length: " + userListbycategory.length.toString());
      notifyListeners();
    } catch (error) {
      error.toString();
    }
  }


}
