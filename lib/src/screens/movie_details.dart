import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  MovieDetail({this.model});
  MovieModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Movie Detail")),
        actions: [],
      ),
      body: Scrollbar(
              child: ListView(children: [
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                
                elevation: 15.0,
                child: Container(
                  
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.height,
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                            topLeft:  const  Radius.circular(40.0),
                            topRight: const  Radius.circular(40.0),
                            bottomLeft:  const  Radius.circular(40.0),
                            bottomRight: const  Radius.circular(40.0)
                            ),
            
                    image: DecorationImage(
                      image: NetworkImage(
                       "https://image.tmdb.org/t/p/w500/"+ model.imgurl
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(alignment: Alignment.topLeft,
              child: Text(model.title , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
              
              
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(children: [
              Text("Overview", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
              SizedBox(height:10.0),
              Text(model.overview)
                ],),
              ),
            )

          ],
        ),
        ],),
      )
    );
  }
}
