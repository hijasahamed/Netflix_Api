import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainCard extends StatelessWidget {
   MainCard({super.key,required this.size});

  Size size;
  
  get future => null;

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: future, 
    //   builder: (context,snapshot){
    //     if(snapshot.connectionState==ConnectionState.waiting){
    //       return const CircularProgressIndicator(color: Colors.transparent);
    //     }
    //     else if(snapshot.hasError || !snapshot.hasData){ 
    //       return const Center(
    //         child: Text('syam'),
    //       );
    //     }
    //     return FutureBuilder(
    //       future: future, 
    //       builder: (context,PaletteGenerator){
    //         if(PaletteGenerator.connectionState==ConnectionState.waiting){
    //           return const CircularProgressIndicator(color: Colors.transparent,);
    //         }
    //         else if(PaletteGenerator.hasError || !PaletteGenerator.hasData){
    //           return const Center(
    //             child: Text('hijas'),
    //           );
    //         }
    //         return Container(
    //           decoration: const BoxDecoration(
    //             gradient: LinearGradient(
    //               colors: [Colors.red,Colors.yellow],
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,
    //               stops: [0.0,2.0],
    //               tileMode: TileMode.clamp,
    //             )
    //           ),
    //           width: double.infinity,
    //           height: size.height * .78,
    //           child:  Padding(
    //             padding: EdgeInsets.all(20),
    //             child: Container(
    //               height: 300,
    //               width: double.infinity,
    //             ),
    //           ),
    //         );
    //       }
    //     );
    //   }
    // );
    return Container(
                            height: 300,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://m.economictimes.com/thumb/msid-106218108,width-1200,height-1200,resizemode-4,imgsize-51548/aquaman-2-release-after-aquaman-and-the-lost-kingdom-will-there-be-aquaman-3.jpg'),
                                    fit: BoxFit.contain)),
                          );
  }
}