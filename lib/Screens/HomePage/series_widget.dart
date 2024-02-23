import 'package:flutter/material.dart';
import 'package:netflix_api_app/Model/series_model.dart';
import 'package:netflix_api_app/Services/api_service.dart';

// ignore: must_be_immutable
class SeriesWidget extends StatelessWidget {
   SeriesWidget({
    super.key,
    required this.size,
    required this.text,
    required this.future,
    });
    Size size;
    String text;
    Future future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future, 
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent);
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Somthing went wrong'),
            );
          }
          final List<Series> data =snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: size.height/80,),
                Text(text,style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                SizedBox(height: size.height/80,),
                Container(
                  height: size.width*.4,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      final values=data[index];
                      String imagepath=values.posterImage!;
                      String imageurl='$baseUrl$imagepath';

                      return Container(
                        width: size.width*.28,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
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
      }
    );
  }
}