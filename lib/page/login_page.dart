import 'package:chats_apps/page/botton_navigation_ber.dart';
import 'package:chats_apps/page/registration_page.dart';
import 'package:chats_apps/provider/auth_provider.dart';
import 'package:chats_apps/provider/function_provider.dart';
import 'package:chats_apps/widget/fromdecaretion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final Function_provider Providerdata = Provider.of<Function_provider>(context);
    final Auth_provider auth_provider = Provider.of<Auth_provider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        title: Text("Login",style: TextStyle(color: Colors.black),),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 50,
            ),
            Text("Login page",textAlign:
            TextAlign.center,
              style:TextStyle
                (fontSize: 50),),
            Divider(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child:Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: FormDecoration.copyWith(
                        labelText: "Email",

                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Fill All Field";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          auth_provider.facultyModel.email=value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: _isObscure,
                      decoration: FormDecoration.copyWith(

                        labelText: 'Password',
                        suffix: InkWell(
                          onTap: () {
                            setState(() {

                              _isObscure = !_isObscure;
                            });
                          },
                          child: Icon(
                            _isObscure == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: Colors.blue,
                          ),
                        ),

                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          auth_provider.facultyModel.password=value;
                        });
                      },

                    ),
                    SizedBox(height: 10),
                    InkWell(
                      child: ElevatedButton(
                        onPressed: ()async{
                            try{
                                if(_formKey.currentState!.validate()){
                                  await auth_provider.signIn("${auth_provider.facultyModel.email}", "${auth_provider.facultyModel.password}");
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                        'Successfully Login',
                                      )));
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Botton_navig_ber()));
                                }
                              } catch(e){
                                print('error caught:$e');
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      'incorrect password',
                                    )));

                              }
                        },
                        child: Text("Login"),
                        style:ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
                          // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?  ', style:TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Registration_page()));
                  },
                  child:Text('Register now',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}
