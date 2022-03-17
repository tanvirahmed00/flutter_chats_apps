import 'package:chats_apps/model_class/send_and_recived.dart';
import 'package:chats_apps/model_class/test_data.dart';
import 'package:chats_apps/provider/function_provider.dart';
import 'package:chats_apps/widget/_custrom_appber.dart';
import 'package:chats_apps/widget/_custrom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Textchatpage extends StatefulWidget {
  String? name;
  String? image;


  @override
  State<Textchatpage> createState() => _TextchatpageState();

  Textchatpage({this.name, this.image});
}

class _TextchatpageState extends State<Textchatpage> {
  // bool _validate = false;
  // final _text = TextEditingController();
  //
  // void dispose() {
  //   _text.dispose();
  //   super.dispose();
  // }

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
      appBar: custrom_appBerr(context,(){},(){},"${widget.name}","${widget.image}",Icons.phone,Icons.video_call),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: size.height*.12,
                  mainAxisSpacing: 8,
                  childAspectRatio: 20,
                ),
                itemCount:smsdata.length,
                itemBuilder: (context,index) {
                  ///custrom list
                  return custrom_text(index);
                }
            ),

          ],
        ),
      ),
      bottomNavigationBar:Container(
        width: size.width/1,
        height: size.height/10,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            custrom_button((){},Icons.attach_file,size.width/15,Colors.black),
            custrom_button((){Providerdata.CameraImage();},Icons.camera_alt_outlined,size.width/15,Colors.black),
            custrom_button((){Providerdata.GalleryImage();},Icons.image,size.width/15,Colors.black),
            Container(
              width: size.width/3  ,
              height: size.height/20,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:BorderRadius.circular(10)
              ),

              child:TextField(
                decoration: InputDecoration(
                    prefixText: "Aa",
                    border: InputBorder.none,
                    focusColor: Colors.white,
                    hoverColor: Colors.red,
                    fillColor: Colors.white),
              ),
            ),
            custrom_button((){},Icons.send_sharp,size.width/15,Colors.black),

          ],
        ),
      ) ,
    );
  }
  Widget custrom_text(index){
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Stack(
            children: [
              Positioned(
                left: size.width/50,
                child:Container(
                padding: EdgeInsets.only(left: 10,),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage:AssetImage('${widget.image}'),
                ),
              ) , ),
              Positioned(
                left: size.width/1.40,
                top: size.height/25,
                child: Container(
                padding: EdgeInsets.only(left:10),
                child:  Container(
                  alignment: Alignment.center,
                  height: size.height/15,
                  width: size.width/5,
                  child: Text("${smsdata[index].recived}",textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)

                  ),
                ),
              ),),
              Positioned(
                left: size.width/6,
                child:Container(

                padding: EdgeInsets.only(right:10),
                child:  Container(
                  alignment: Alignment.center,
                  height: size.height/15,
                  width: size.width/5,
                  child: Text("${smsdata[index].send}",textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ), )
            ],
          ),
    );
  }
}

