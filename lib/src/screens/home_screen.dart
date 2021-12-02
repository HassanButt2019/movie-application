import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/hotel_model.dart';
import 'package:movie_app/src/repositories/hotel_repository.dart';
import 'package:search_widget/search_widget.dart';

import 'components/hotel_overview.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
String query = '';
class _HomeScreenState extends State<HomeScreen> {
TextEditingController hotelTitle = new TextEditingController();
  



  @override
  void initState() {
    super.initState();
    //movieTitle.text = context.read(nameFilterProvider).state.toString();
    hotelTitle.addListener(() {
     setState(() {
       query = hotelTitle.text.toString();
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
        controller: hotelTitle,
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
          :Text("List Of Hotels"),
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
          AsyncValue<List<HotelModel>> hotels = watch(DataStateFuture);
          return hotels.when(
            data: (hotel) {
              return ListView.builder(
                  itemCount:hotel.length,
                  itemBuilder: (BuildContext context, index) {
                    return HotelOverview(
                      model: hotel[index],
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
