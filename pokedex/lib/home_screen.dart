// CodiGo Tecsup - Diego Viera Zegarra
// home_screen.dart
//-------------------------------------------
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokedexApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokedex = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      getPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'assets/images/pokefondo3.png',
              width: 300,
              fit: BoxFit.fitWidth,
            ),
          ),

          Positioned(
            top: 80,
            left: 20,
            child: Text(
              "Pokedex",
              style: GoogleFonts.orbitron(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.25,
                          ),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            var type = pokedex[index]['type'][0];
                            return InkWell(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 6.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: type == 'Grass'
                                        ? Color(0xff48CFAF)
                                        : type == 'Fire'
                                            ? Color(0xffFC6C6D)
                                            : type == "Water"
                                                ? Color(0xff76BEFE)
                                                : type == "Poison"
                                                    ? Colors.deepPurpleAccent
                                                    : type == "Electric"
                                                        ? Color(0xffFFD76F)
                                                        : type == "Rock"
                                                            ? Colors.grey
                                                            : type == "Ground"
                                                                ? Colors.brown
                                                                : type ==
                                                                        "Psychic"
                                                                    ? Colors
                                                                        .indigo
                                                                    : type ==
                                                                            "Fighting"
                                                                        ? Colors
                                                                            .orange
                                                                        : type ==
                                                                                "Bug"
                                                                            ? Colors.lightGreenAccent
                                                                            : type == "Ghost"
                                                                                ? Colors.deepPurple
                                                                                : type == "Normal"
                                                                                    ? Colors.grey
                                                                                    : type == "Dragon"
                                                                                        ? Colors.teal
                                                                                        : type == "Ice"
                                                                                            ? Colors.cyanAccent
                                                                                            : Colors.pink,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -30,
                                        right: -30,
                                        child: Image.asset(
                                          'assets/images/pokeball.png',
                                          height: 150,
                                          fit: BoxFit.fitHeight,
                                          color: Colors.white60,
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Text(
                                          pokedex[index]['name'],
                                          style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 45,
                                        left: 10,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                              type.toString(),
                                              style: GoogleFonts.ubuntu(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Colors.white24,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: Hero(
                                          tag: index,
                                          child: CachedNetworkImage(
                                            imageUrl: pokedex[index]['img'],
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                //Para navegar a una pantalla detalle
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PokemonDetailScreen(
                                            pokemonDetail: pokedex[index],
                                            color: type == 'Grass'
                                                ? Color(0xff48CFAF)
                                                : type == 'Fire'
                                                    ? Color(0xffFC6C6D)
                                                    : type == "Water"
                                                        ? Color(0xff76BEFE)
                                                        : type == "Poison"
                                                            ? Colors
                                                                .deepPurpleAccent
                                                            : type == "Electric"
                                                                ? Color(
                                                                    0xffFFD76F)
                                                                : type == "Rock"
                                                                    ? Colors
                                                                        .grey
                                                                    : type ==
                                                                            "Ground"
                                                                        ? Colors
                                                                            .brown
                                                                        : type ==
                                                                                "Psychic"
                                                                            ? Colors.indigo
                                                                            : type == "Fighting"
                                                                                ? Colors.orange
                                                                                : type == "Bug"
                                                                                    ? Colors.lightGreenAccent
                                                                                    : type == "Ghost"
                                                                                        ? Colors.deepPurple
                                                                                        : type == "Normal"
                                                                                            ? Colors.grey
                                                                                            : type == "Dragon"
                                                                                                ? Colors.teal
                                                                                                : type == "Ice"
                                                                                                    ? Colors.cyanAccent
                                                                                                    : Colors.pink,
                                            heroTag: index,
                                          )),
                                );
                              },
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        setState(() {});
      }
    });
  }
}
