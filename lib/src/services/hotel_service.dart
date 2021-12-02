


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/src/models/hotel_model.dart';

class HotelService{

  var header = {
    'x-rapidapi-host': 'priceline-com.p.rapidapi.com',
    'x-rapidapi-key': '74c18b42fdmsh00bf7bbb732abdcp1882d2jsn7f5973f8a83b',
    "useQueryString": true
  };

  String baseUrl = "https://priceline-com.p.rapidapi.com/hotels/3000002244?checkin_date=2021-01-22&checkout_date=2021-01-23&rooms=1&offset=0&currency=USD";

   List<HotelModel> parseData(String responseBody) {
    var list = json.decode(responseBody)['results']  ;
     print(list);
  //MovieModel data = MovieModel.fromJson(list);
    List<HotelModel> data = list.map<HotelModel>((model) => HotelModel.fromJson(model)).toList();
    return data;
  }

  Future<List<HotelModel>> fetchMovies(String query) async{
    print("HELLO in fetch movies");
    var response = await http.get(Uri.parse(baseUrl) , headers:header );
    debugPrint(response.body.toString());
    if(response.statusCode == 200){
      if(query.isNotEmpty)
      {
      return parseData(response.body).where((hotels) =>  hotels.title.toLowerCase().contains(query.toLowerCase())).toList();

      }else
      {
        return parseData(response.body);
      }
    }
  }
}