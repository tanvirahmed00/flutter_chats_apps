import 'package:chats_apps/model_class/send_and_recived.dart';

List <Send_and_recived_models> Get_data(){
  List <Send_and_recived_models> list=<Send_and_recived_models> [];

  Send_and_recived_models data=new Send_and_recived_models();
  data.id="11";
  data.image="images/5.jpg";
  data.name="tanvir";
  data.send="hi";
  data.date="11-12-2020";
  list.add(data);


  data=new Send_and_recived_models();
  data.id="11";
  data.image="images/5.jpg";
  data.name="Loman";
  data.recived="hello ";
  data.date="11-12-2020";
  list.add(data);


  data=new Send_and_recived_models();
  data.id="11";
  data.image="images/5.jpg";
  data.name="imran";
  data.recived="how are you";
  data.send="hi";
  data.date="11-12-2020";
  list.add(data);

  data=new Send_and_recived_models();
  data.id="11";
  data.image="images/5.jpg";
  data.name="sohan";
  data.recived="how are you";
  data.send="I am fine";
  data.date="11-12-2020";
  list.add(data);

  data=new Send_and_recived_models();
  data.id="11";
  data.image="images/5.jpg";
  data.name="Mojid";
  data.send="I am fine";
  data.recived="and you";
  data.date="11-12-2020";
  list.add(data);

  data=new Send_and_recived_models();
  data.id="11";
  data.image="images/5.jpg";
  data.name="Mojid";
  data.recived="hello";
  data.send="hi";
  data.date="11-12-2020";
  list.add(data);

  data=new Send_and_recived_models();
  data.id="11";
  data.image="images/5.jpg";
  data.name="Mojid";
  data.recived="tomar nane ki";
  data.send="hi";
  data.date="11-12-2020";
  list.add(data);

  data=new Send_and_recived_models();
  data.id="11";
  data.image="images/5.jpg";
  data.name="Mojid";
  data.recived="hell";
  data.send="tanvir";
  data.date="11-12-2020";
  list.add(data);


  return list;
}