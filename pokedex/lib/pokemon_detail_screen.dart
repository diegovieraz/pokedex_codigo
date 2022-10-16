// CodiGo Tecsup - Diego Viera Zegarra
// pokemon_detail_screen.dart
//-------------------------------------------
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen(
      {super.key,
      required this.pokemonDetail,
      required this.color,
      required this.heroTag});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var type = widget.pokemonDetail['type'][0];
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 5,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text(
              widget.pokemonDetail['name'],
              style: GoogleFonts.orbitron(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),

          Positioned(
            top: 150,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 4.0,
                  bottom: 4.0,
                ),
                child: Text(
                  widget.pokemonDetail['type'].join(', '),
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white24,
              ),
            ),
          ),

          Positioned(
            top: 200,
            left: 20,
            child: Text(
              "#"+widget.pokemonDetail['num'],
              style: GoogleFonts.orbitron(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          Positioned(
            top: height * 0.1,
            right: -30,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 300,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white60,
                    Colors.white,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Name",
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail['name'],
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //----------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Height",
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail['height'],
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //----------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Weight",
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail['weight'],
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //----------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Spawn Time",
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail['spawn_time'],
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //----------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Weakness",
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail['weaknesses'].join(", "),
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //----------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Pre Form",
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          widget.pokemonDetail['prev_evolution'] != null ?
                          SizedBox(
                            height: 20,
                            width: width * 0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['prev_evolution'].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                  ),
                                  child: Text(widget.pokemonDetail['prev_evolution'][index]['name'],
                                    style: GoogleFonts.orbitron(
                                      color: Colors.blueGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                );
                              },
                            ),
                          ) : Text('Just Hatched',style: GoogleFonts.orbitron(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),
                    //----------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Evolution",
                              style: GoogleFonts.orbitron(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          widget.pokemonDetail['next_evolution'] != null ?
                          SizedBox(
                            height: 20,
                            width: width * 0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['next_evolution'].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                  right: 8.0,
                                ),
                                  child: Text(widget.pokemonDetail['next_evolution'][index]['name'],
                                    style: GoogleFonts.orbitron(
                                      color: Colors.blueGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                );
                              },
                            ),
                          ) : Text('Maxed Out',style: GoogleFonts.orbitron(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: width / 2.7,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail['img'],
                height: 220,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
