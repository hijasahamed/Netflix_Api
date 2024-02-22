

import 'package:flutter/material.dart';
import 'package:netflix_api_app/Screens/Downlods/download_cards.dart';
import 'package:netflix_api_app/Services/api_service.dart';
import 'package:netflix_api_app/Services/functions.dart';

// ignore: must_be_immutable
class Notifications extends StatelessWidget {
   Notifications({super.key,required this.size});

  Size size;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [ 
            CircleAvatar(
              radius: size.width/18,
              backgroundColor: Color.fromARGB(255, 204, 18, 5),
              child: const Icon(Icons.notifications),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('Notifications',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded,size: 18,) 
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 26),
          child: Row(
            children: [ 
              Stack(
                children: [
                  FutureBuilder(
                    future: getnowplaying(), 
                    builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2.5,));
                      }
                      else if(snapshot.hasError ||!snapshot.hasData){
                      return const Center(child: Text('Something Went Wrong',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400),),);
                      }
                      final data=snapshot.data ?? [];
                      return DownloadCard(
                        angle: 0, 
                        imagepath: '$baseUrl${data[6].coverImage}', 
                        height: size.height/10, 
                        width: size.height/6
                      );
                    }
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Netflix Lookahead',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('Explore what coming soon'),
                    Text('28 Feb'),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}