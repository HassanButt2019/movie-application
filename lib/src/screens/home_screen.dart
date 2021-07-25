import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:movie_app/src/repositories/movie_repository.dart';
import 'package:movie_app/src/screens/components/movie_overview.dart';
import 'package:search_widget/search_widget.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
String query = '';
class _HomeScreenState extends State<HomeScreen> {
TextEditingController movieTitle = new TextEditingController();
  



  @override
  void initState() {
    super.initState();
    //movieTitle.text = context.read(nameFilterProvider).state.toString();
    movieTitle.addListener(() {
     setState(() {
       query = movieTitle.text.toString();
     });
    });
  }


  bool search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: search? 
          Material(
      color: Colors.blue,
          child: TextFormField(
        // controller: _password,
        controller: movieTitle,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        
    
        onChanged: (String query) async{
          print(query);



        },
 
        decoration: InputDecoration(
          hintText: 'Search Products',
          hintStyle: TextStyle(color: Colors.white),
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          // border:
          //     OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    )
          :Text("List Of Movies"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if(search){
                      search = false;
                    }else
                    {
search = true;
                    }
                    
                  });
                },
                icon: Icon(
                  Icons.search,
                  size: 25,
                ))
          ],
        ),
        body: Consumer(builder: (context, watch, child) {
          AsyncValue<List<MovieModel>> movies = watch(DataStateFuture);
          return movies.when(
            data: (movie) {
           //  filtermovies = movie.where((movies) => movies.title.toLowerCase().contains(movieTitle.text.toLowerCase())).toList();
              return ListView.builder(
                  itemCount:movie.length,
                  itemBuilder: (BuildContext context, index) {
                    return MovieOverview(
                      model: movie[index],
                    );
                  });
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text(err.toString())),
          );
        })

        // loading: () => const Center(child: CircularProgressIndicator()),
        // error: (err, stack) => Center(child: Text(err.toString())),
        );
  }
}
