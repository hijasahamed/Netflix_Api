import 'package:flutter/material.dart';
import 'package:netflix_api_app/Model/movie_model.dart';
import 'package:netflix_api_app/Services/api_service.dart';
import 'package:palette_generator/palette_generator.dart';

// ignore: must_be_immutable
class MainCard extends StatelessWidget {
   MainCard({super.key,required this.size});

  Size size;
  
  get future => null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future, 
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const CircularProgressIndicator(color: Colors.transparent);
        }
        else if(snapshot.hasError || !snapshot.hasData){ 
          return const Center(
            child: Text('syam'),
          );
        }

        final data=snapshot.data ?? [];

        return FutureBuilder(
          future: future, 
          builder: (context, paletteGenerator){
            if(paletteGenerator.connectionState==ConnectionState.waiting){
              return const CircularProgressIndicator(color: Colors.transparent,);
            }
            else if(paletteGenerator.hasError || !paletteGenerator.hasData){
              return const Center(
                child: Text('hijas'),
              );
            }
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red,Colors.yellow],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0,2.0],
                  tileMode: TileMode.clamp,
                )
              ),
              width: double.infinity,
              height: size.height * .78,
              child:  Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child:  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [ 
                          GestureDetector(
                            child: Container(
                              height: 44,
                              width: 125,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: const Center(
                                child: Text('Play',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: 44,
                              width: 125,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: const Row(
                                children: [ 
                                  Icon(Icons.add,color: Colors.black,),
                                  Text("My List",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)                                  
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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