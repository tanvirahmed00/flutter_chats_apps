import 'package:chats_apps/model_class/send_and_recived.dart';
import 'package:chats_apps/model_class/test_data.dart';
import 'package:chats_apps/page/text_chats_page.dart';
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
  List <Send_and_recived_models> smsdata=[];
  void initState() {
    // TODO: implement initState
    super.initState();
    smsdata=Get_data();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final Function_provider Providerdata = Provider.of<Function_provider>(context);
    return Scaffold(
      ///custrom apper call kora hoice
     appBar: custrom_appBerr(context,(){
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
            GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 60,
                  mainAxisSpacing: 8,
                  childAspectRatio: 20,
                ),
                itemCount:smsdata.length,
                itemBuilder: (context,index) {
                  ///custrom list
                  return custrom_list(index);
                }
            ),
          ],
        ),
      ),
    );
  }
  Widget custrom_list(index){
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Textchatpage(
            image:smsdata[index].image,
            name:smsdata[index].name,

          )));
        },
      child: CustomCard("${smsdata[index].image}","${smsdata[index].name}","${smsdata[index].send}"),
    );
  }
}
