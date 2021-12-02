



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/hotel_model.dart';
import 'package:movie_app/src/screens/home_screen.dart';
import 'package:movie_app/src/services/hotel_service.dart';

HotelService hotelService = HotelService();


enum Filter {
  none,
  completed,
  uncompleted,
}


 var DataStateFuture = FutureProvider<List<HotelModel>> ((ref){
  return hotelService.fetchMovies(query);
});










