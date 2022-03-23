import 'dart:io';

import 'package:chats_apps/page/login_page.dart';
import 'package:chats_apps/provider/auth_provider.dart';
import 'package:chats_apps/provider/function_provider.dart';
import 'package:chats_apps/widget/_custrom_button.dart';
import 'package:chats_apps/widget/fromdecaretion.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class Registration_page extends StatefulWidget {
  const Registration_page({Key? key}) : super(key: key);

  @override
  State<Registration_page> createState() => _Registration_pageState();
}

class _Registration_pageState extends State<Registration_page> {
  @override
  bool obscure=true;
  File? file;
  ImagePicker image = ImagePicker();
  Future GalleryImage() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });


  }
  Future CameraImage() async {

    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });

  }
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Function_provider Providerdata = Provider.of<Function_provider>(context);
    final Auth_provider auth_provider = Provider.of<Auth_provider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,

          title: Text("Registration",style: TextStyle(color: Colors.black,),),centerTitle:true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: file == null
                  ? AssetImage("images/profile.jpg")
                  : FileImage(File(file!.path)) as ImageProvider,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                custrom_button((){CameraImage();},Icons.camera_alt_outlined,size.width/5,Colors.black),
                SizedBox(
                  width: size.width/10,
                ),
                custrom_button((){GalleryImage();},Icons.image,size.width/5,Colors.black),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Form(key:_formKey,
                child: Column(
                  children: [
                    _textFieldBuilder('Name',auth_provider),
                    SizedBox(height:size.width*0.05),
                    _textFieldBuilder('Email',auth_provider),
                    SizedBox(height:size.width*0.05),
                    _textFieldBuilder('Password',auth_provider),
                    SizedBox(height:size.width*0.05),
                    ElevatedButton(
                      onPressed: ()async{
                        try{
                          if(_formKey.currentState!.validate()){
                            await auth_provider.add_user(context, auth_provider,auth_provider.facultyModel, file!);
                            await auth_provider.createAccount("${auth_provider.facultyModel.email}", "${auth_provider.facultyModel.password}");

                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Login_page()));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  'Registration Successfully',
                                )));
                          }
                        } catch(e){
                          print('error caught:$e');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Password should be at least 6 characters',
                              )));

                        }


                      },
                      child: Text("Registration"),
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
                        // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do have an account?  ', style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login_page()));
                  },
                  child: Text('Back To Login',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ],

        ),
      ),

    );
  }
  Widget _textFieldBuilder(String hintTxt,Auth_provider authProvider){
    Size size=MediaQuery.of(context).size;
    return  TextFormField(
      keyboardType:TextInputType.text,
      decoration: FormDecoration.copyWith(
        labelText: hintTxt,
        labelStyle: TextStyle(
            fontSize: size.height*0.023
        ),

        // suffixIcon: hintTxt=='Password'? IconButton(
        //     icon: obscure
        //         ? Icon(Icons.visibility_off_rounded)
        //         : Icon(Icons.remove_red_eye),
        //     onPressed: () =>
        //         setState(() => obscure = !obscure)):null
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Fill All filled';
        }
        return null;
      },
      onChanged: (value){
        setState(() {
          hintTxt=='Name'?authProvider.facultyModel.name=value
              :hintTxt=='Email'?authProvider.facultyModel.email=value
              :authProvider.facultyModel.password=value;
        });
      },

    );
  }
}
