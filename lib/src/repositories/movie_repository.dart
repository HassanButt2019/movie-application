

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:movie_app/src/screens/home_screen.dart';
import 'package:movie_app/src/services/movie_service.dart';


MovieService movieService = MovieService();


enum Filter {
  none,
  completed,
  uncompleted,
}


 var DataStateFuture = FutureProvider<List<MovieModel>> ((ref){
  return movieService.fetchMovies(query);
});










