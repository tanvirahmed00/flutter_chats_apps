import 'dart:io';

import 'package:chats_apps/model_class/send_and_recived.dart';
import 'package:chats_apps/provider/function_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Auth_provider extends Function_provider{
  Send_and_recived_models __facultyModels=Send_and_recived_models();
  List<Send_and_recived_models> userlist=[];
  List<Send_and_recived_models> get User_List => userlist;
  List<Send_and_recived_models> userListbycategory = [];
  List<Send_and_recived_models> get UserListByCategory => userListbycategory;

  Send_and_recived_models get facultyModel => __facultyModels;
  set facultyModel(Send_and_recived_models model) {
    model = Send_and_recived_models();
    __facultyModels = model;
    notifyListeners();
  }
  Future<void> createAccount(String email,String password) async {
    print('Firebase account created');
    await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    print('Firebase account created');
  }

  Future<void> signIn( String email, String password
      ) async {
    // Sign in with Firebase
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
        password: password);
    print('Firebase signed in');
  }

// Future<void> signOut() async {
//   // Revoke Stream chat token.
//   final callable = functions.httpsCallable('revokeStreamUserToken');
//   await callable();
//   print('Stream user token revoked');
// }
  File? file;
  Future<void> add_user(
      BuildContext context,
      Function_provider account_list,
      Send_and_recived_models _ecommerce_model,
      File imageFile,

      ) async {
    final int timestemp = DateTime.now().millisecondsSinceEpoch;
    String id = timestemp.toString();
    final String submitDate = DateFormat("dd-MMM-yyyy/hh:mm:aa")
        .format(DateTime.now());
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('user Img')
        .child(id);
    firebase_storage.UploadTask storageUploadTask =
    storageReference.putFile(imageFile);
    firebase_storage.TaskSnapshot taskSnapshot;
    storageUploadTask.then((value) {
      taskSnapshot = value;
      taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl) {
        final image = newImageDownloadUrl;
        FirebaseFirestore.instance.collection('user').doc("${facultyModel.email}").set({
          'image': image,
          'name':facultyModel.name,
          'email':facultyModel.email,
          'password':facultyModel.password,
          'timestemp': timestemp.toString(),
          'submitDate': submitDate.toString(),
        });
        // print("firebase");
        // Navigator.pop(context);
      }, onError: (error) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              error.toString(),
            )));
      });
    });
  }
  Future<void> getuserList(
      String collection,
      ) async {
    try {
      await FirebaseFirestore.instance.collection(collection)
          .get()
          .then((snapShot) {
        userlist.clear();
        print("Length: " + userlist.length.toString());
        snapShot.docChanges.forEach((element) {
          Send_and_recived_models userModels = Send_and_recived_models(
            email:element.doc['email'],
            image:element.doc['image'],
            name:element.doc['name'],
            timestamp:element.doc['timestemp'],
            submitDate:element.doc['submitDate'],
          );
          userlist.add(userModels);
        });
      });
      print("Length: " + userlist.length.toString());
      notifyListeners();
    } catch (error) {
      error.toString();
    }
  }


  Future<void> getuserByCategory(String email) async {
    //final String id = await getPreferenceId();
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .where(email, isEqualTo: "p@gmail.com")
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