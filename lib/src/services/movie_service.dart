


import 'dart:convert';

import 'package:movie_app/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService{

  String baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=3406d62dd89a4897fdfbe1c59df11b73&language=en-US&page=1";

   List<MovieModel> parseData(String responseBody) {
    var list = json.decode(responseBody)['results']  ;
     print(list);
  //MovieModel data = MovieModel.fromJson(list);
    List<MovieModel> data = list.map<MovieModel>((model) => MovieModel.fromJson(model)).toList();
    return data;
  }

  Future<List<MovieModel>> fetchMovies(String query) async{
    print("HELLO in fetch movies");
    var response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200){
      if(query.isNotEmpty)
      {
      return parseData(response.body).where((movies) =>  movies.title.toLowerCase().contains(query.toLowerCase())).toList();

      }else
      {
        return parseData(response.body);
      }
    }
  }
}