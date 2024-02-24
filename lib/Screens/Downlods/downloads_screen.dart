import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_api_app/Screens/Downlods/download_cards.dart';
import 'package:netflix_api_app/Screens/Downlods/notification.dart';
import 'package:netflix_api_app/Screens/appbar_screen.dart';
import 'package:netflix_api_app/Services/api_service.dart';
import 'package:netflix_api_app/Services/functions.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppbarScreen(title: 'Downloads',context: context),
      body: Container(
        height: size.height,
        width: double.maxFinite,
        color: Colors.black,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Notifications(size: size),
            SizedBox(
              height: size.height/32,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.settings,color: Colors.grey,),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text('Smart Download',style: TextStyle(color: Colors.grey),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height/38,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Turn on Downloads for You',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w800),)
            ),
            SizedBox(
              height: size.height/41,
            ),
            const Padding(
              padding:EdgeInsets.only(left: 10,right: 10),
              child: Text("We'll download movies and shows just for you, so you'll always have somthing to watch",
              style: TextStyle(fontSize: 15,wordSpacing: 2,color: Colors.grey),),
            ),
            SizedBox(
              height: size.height/30,
            ),
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
                return Center(
                  child: SizedBox(
                    height: size.width*.7,
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: size.width* .32,
                            backgroundColor:const Color.fromARGB(125, 72, 72, 72),
                          )
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: DownloadCard(
                            angle: pi/16, 
                            imagepath: '$baseUrl${data[0].coverImage}', 
                            height: size.width*.45, 
                            width: size.width*.33,
                            margin: const EdgeInsets.only(left: 150),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: DownloadCard(
                                angle: pi / -16,
                                imagepath: '$baseUrl${data[1].coverImage}',
                                height: size.width * .45,
                                width: size.width * .33,
                                margin: const EdgeInsets.only(right: 150))),
                        Align(
                          alignment: Alignment.center,
                          child: DownloadCard(
                            angle: 0,
                            height: size.width * .50,
                            imagepath: '$baseUrl${data[8].coverImage}',
                            width: size.width * .35,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: size.width,
                  height: size.height/18,
                  child: const Center(
                    child: Text('Set Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}