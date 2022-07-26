import 'package:chats_apps/widget/_custrom_button.dart';
import 'package:flutter/material.dart';
class profile_pages extends StatefulWidget {

  String? email;

  @override
  State<profile_pages> createState() => _profile_pagesState();

  profile_pages({this.email});
}

class _profile_pagesState extends State<profile_pages> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile",style: TextStyle(color: Colors.black),),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              height:180,
              alignment: Alignment.center,
              child:CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("images/5.jpg"),
              ),
            ),
            Text("Tanvir ahmed",textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
            Divider(),
            ListTile(
              title: Text("tanvir"),
              subtitle: Text("This is not your username or pin.This name will be visible to your text  contexts"),
              leading: Icon(Icons.person_rounded),
              trailing:  custrom_button((){},Icons.edit,size.width/15,Colors.black),
            ),
            ListTile(
              title: Text("About"),
              subtitle: Text("Hey there I am text chats app useres"),
              leading: Icon(Icons.admin_panel_settings),
              trailing:  custrom_button((){},Icons.edit,size.width/15,Colors.black),
            ),ListTile(
              title: Text("Email or phone"),
              subtitle: Text("01725265253"),
              leading: Icon(Icons.phone_android),
              trailing:  custrom_button((){},Icons.edit,size.width/15,Colors.black),
            ),
          ],
        ) ,
        // Container(
        //   child:  auth_provider.User_List.length>=1?GridView.builder(
        //       physics: ScrollPhysics(),
        //       shrinkWrap: true,
        //       gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 1,
        //         mainAxisExtent: 60,
        //         mainAxisSpacing: 8,
        //         childAspectRatio: 20,
        //       ),
        //       itemCount:auth_provider.User_List.length,
        //       itemBuilder: (context,index) {
        //         ///custrom list
        //         return custrom_list(index, auth_provider);
        //       }
        //   ):Center(child: Text('No Data Found Yet !!',style: TextStyle
        //     (fontSize: 20,color: Colors.red),),),
        // ),
      ),
    );
  }
  Widget profile(){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height:180,
          alignment: Alignment.center,
          child:CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("images/5.jpg"),
          ),
        ),
        Text("Tanvir ahmed",textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
        Divider(),
        ListTile(
          title: Text("tanvir"),
          subtitle: Text("This is not your username or pin.This name will be visible to your text  contexts"),
          leading: Icon(Icons.person_rounded),
          trailing:  custrom_button((){},Icons.edit,size.width/15,Colors.black),
        ),
        ListTile(
          title: Text("About"),
          subtitle: Text("Hey there I am text chats app useres"),
          leading: Icon(Icons.admin_panel_settings),
          trailing:  custrom_button((){},Icons.edit,size.width/15,Colors.black),
        ),ListTile(
          title: Text("Email or phone"),
          subtitle: Text("01725265253"),
          leading: Icon(Icons.phone_android),
          trailing:  custrom_button((){},Icons.edit,size.width/15,Colors.black),
        ),
      ],
    );
  }
}
