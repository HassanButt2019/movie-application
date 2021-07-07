

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:movie_app/src/services/movie_service.dart';


MovieService movieService = MovieService();




 var DataStateFuture = FutureProvider<List<MovieModel>> ((ref){
  return movieService.fetchMovies();
});
