import 'package:flutter/material.dart';

class HotelModel{
  int id;
  String title;
  String imgurl;
  String overview;




  HotelModel.fromJson(Map<String,dynamic> json)
  {
    debugPrint("HELLO THIS IS NEW"+json.toString());
    id = json['id'];
    title = json['title'];
    imgurl = json['poster_path'];
    overview = json['overview'];
  }

}