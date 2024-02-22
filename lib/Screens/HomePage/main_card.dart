import 'package:flutter/material.dart';
import 'package:netflix_api_app/Model/movie_model.dart';
import 'package:netflix_api_app/Services/api_service.dart';
import 'package:netflix_api_app/Services/functions.dart';
import 'package:palette_generator/palette_generator.dart';

// ignore: must_be_immutable
class MainCard extends StatelessWidget {
   MainCard({super.key,required this.size});

  Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getnowplaying(), 
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const CircularProgressIndicator(color: Colors.transparent,strokeWidth: 2,);
        }
        else if(snapshot.hasError || !snapshot.hasData){ 
          return const Center(
            child: Text('syam'),
          );
        }
        final data=snapshot.data ?? [];
        return FutureBuilder(
          future: getPaletColor(data[data.length-6]), 
          builder: (context, paletteGenerator){
            if(paletteGenerator.connectionState==ConnectionState.waiting){
              return const CircularProgressIndicator(color: Colors.transparent,);
            }
            else if(paletteGenerator.hasError || !paletteGenerator.hasData){
              return const Center(
                child: Text('Something Went Wrong'),
              );
            }
            final palette = paletteGenerator.data;
            final paletteColor = palette?.colors.first;
            return Container(
              decoration:   BoxDecoration(
                gradient: LinearGradient(
                  colors: [paletteColor?? const Color.fromARGB(255, 240, 3, 3),Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0,0.8],
                  tileMode: TileMode.clamp,
                )
              ),
              width: double.infinity,
              height: size.height * .75,
              child:  Padding(
                padding: const EdgeInsets.only(top: 160,bottom: 10,left: 25,right: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        '$baseUrl${data[data.length-6].posterpath}'
                      ),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill
                    ),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [ 
                        GestureDetector(
                          child: Container(
                            height: 44,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ 
                                Icon(Icons.play_arrow,color: Colors.black,),
                                Text("Play",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)                                  
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 44,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ 
                                Icon(Icons.add,color: Colors.black,),
                                Text("My List",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)                                  
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }

  Future<PaletteGenerator> getPaletColor(Movie movie) async {
    return await PaletteGenerator.fromImageProvider(
        NetworkImage('$baseUrl${movie.posterpath}'));
  }

}