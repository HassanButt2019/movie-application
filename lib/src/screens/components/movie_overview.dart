import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie_model.dart';
import 'package:movie_app/src/screens/movie_details.dart';

class MovieOverview extends StatelessWidget {

  MovieOverview({this.model});
  MovieModel model ;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail(model:model)));

          },
        child: Card(
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                new Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://image.tmdb.org/t/p/w500/"+model.imgurl)))),
                SizedBox(width: 10.0),
                Container(
                  child: new Column(children: [
                    Text(model.title??"Movie Title"),
                  ]),
                )
              ],
            ),
          ),
        ),
        ),
      );  }
}