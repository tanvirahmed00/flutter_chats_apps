import 'package:chats_apps/model_class/send_and_recived.dart';
import 'package:chats_apps/page/profile_page.dart';
import 'package:chats_apps/page/text_chats_page.dart';
import 'package:chats_apps/provider/auth_provider.dart';
import 'package:chats_apps/provider/function_provider.dart';
import 'package:chats_apps/widget/_custrom_appber.dart';
import 'package:chats_apps/widget/_custrom_card.dart';
import 'package:chats_apps/widget/_custrom_seachber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class chat_pages extends StatefulWidget {
  String? iamge;
  String? name;

  @override
  State<chat_pages> createState() => _chat_pagesState();

  chat_pages({this.iamge, this.name});
}

class _chat_pagesState extends State<chat_pages> {
  List <Send_and_recived_models> User_List=[];

  int count=0;
  void _custominitState(auth_provider){
    setState(() {
      count++;
    }
    );
    User_List=auth_provider.User_List;
    auth_provider.getuserList('user');
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final Function_provider Providerdata = Provider.of<Function_provider>(context);
    final Auth_provider auth_provider = Provider.of<Auth_provider>(context);
    if(count==0) _custominitState(auth_provider);
    return Scaffold(
      ///custrom apper call kora hoice
     appBar: custrom_appBerr(context,(){
       Navigator.push(context, MaterialPageRoute(builder: (context) =>profile_pages(

       )));
     },(){
       Providerdata.CameraImage();
       // images/5.jpg
     },(){},"Chats","images/5.jpg",Icons.camera_alt_outlined,Icons.edit),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ///custrom seacher ber
            custrom_search_ber(),
            Divider(),
            Container(
              child:  auth_provider.User_List.length>=1?GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 60,
                    mainAxisSpacing: 8,
                    childAspectRatio: 20,
                  ),
                  itemCount:auth_provider.User_List.length,
                  itemBuilder: (context,index) {
                    ///custrom list
                    return custrom_list(index, auth_provider);
                  }
              ):Center(child: Text('No Data Found Yet !!',style: TextStyle
                (fontSize: 20,color: Colors.red),),),
            ),

          ],
        ),
      ),
    );
  }
  Widget custrom_list(index,Auth_provider auth_provider){
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Textchatpage(
            image:User_List[index].image,
            name:User_List[index].name,

          )));
        },
      child: CustomCard("${User_List[index].image}","${User_List[index].name}","${User_List[index].send}"),
    );
  }
}
