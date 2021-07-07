import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:movie_app/src/repositories/movie_repository.dart';
import 'package:movie_app/src/screens/components/movie_overview.dart';

class HomeScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<List<MovieModel>> movies = watch(DataStateFuture);
    return Scaffold(
        appBar: AppBar(title: Text("List Of Movies")),
        body: movies.when(
          data: (movie) {
            return ListView.builder(
                itemCount: movie.length,
                itemBuilder: (BuildContext context, index) {
                  return MovieOverview(model: movie[index],);
                });
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text(err.toString())),
        ));
  }
}
