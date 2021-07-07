import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child:MovieApplication())
  
  );
}


class MovieApplication extends StatefulWidget {

  @override
  _MovieApplicationState createState() => _MovieApplicationState();
}

class _MovieApplicationState extends State<MovieApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

