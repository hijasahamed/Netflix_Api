import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api_app/Model/movie_model.dart';
import 'package:netflix_api_app/Services/api_service.dart';

// ignore: must_be_immutable
class MovieWidget extends StatelessWidget {
  MovieWidget(
      {super.key,
      required this.size,
      required this.text,
      required this.future,
      this.key1});

  String text;
  Size size;
  Future future;
  bool? key1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent,);
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Somthing went wrong'),
            );
          }
          final List<Movie> data=snapshot.data ?? [];

          return Padding(
            padding:const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                SizedBox(height: size.height/80,),
                Text(text,style: const TextStyle(
                  fontSize: 21,fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: size.height/80,),
                SizedBox(
                  height: size.height/5,
                  width: size.width*4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: key1==true ? 10 :data.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      final values=data[index];
                      String imagepath=values.coverImage;
                      String imageurl='$baseUrl$imagepath';

                      return key1==true
                      ? Container(
                        width: size.width*.45,
                        margin: const EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [ 
                            Positioned(
                              bottom: size.width*.01,
                              left: size.width*.02,
                              child: BorderedText(
                                strokeColor: Colors.white,
                                strokeWidth: 1.5,
                                child: Text(
                                  '${index+1}',
                                  style: index+1==10
                                  ?GoogleFonts.alumniSansInlineOne(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      shadows: [
                                        Shadow(
                                          color: Colors.grey.shade700.withOpacity(.9),
                                          offset: const Offset(-3.0,-1.0),
                                          blurRadius: 30.0
                                        )
                                      ],
                                      fontSize: 110,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                  : TextStyle(
                                    color: Colors.grey.shade900,
                                    shadows: [
                                      Shadow(
                                        color: Colors.grey.shade700.withOpacity(.9),
                                        offset: const Offset(-3.0,-1.0),
                                        blurRadius: 30
                                      )
                                    ],
                                    fontSize: 110,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              )
                            )
                          ],
                        )
                      )
                      : Container(
                        width: size.width*.30,
                        height: size.width*.28,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(imageurl),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover
                          )
                        ),
                      );
                    }
                  ),
                )
              ],
            ),
          );
        });
  }
}
