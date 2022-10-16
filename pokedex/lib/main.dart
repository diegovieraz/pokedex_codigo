// CodiGo Tecsup - Diego Viera Zegarra
// main.dart
//-------------------------------------------

import 'package:flutter/material.dart';
import 'package:pokedex/home_screen.dart';

void main(){
  runApp(PokedexTecsup());
}

class PokedexTecsup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
