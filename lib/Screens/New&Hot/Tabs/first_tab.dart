import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_api_app/Services/api_service.dart';

// ignore: must_be_immutable
class Firsttab extends StatelessWidget {
   Firsttab({super.key,required this.future});

  Future future;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scrollbar(
      child: FutureBuilder(
        future: future, 
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(color: Colors.transparent);
          } 
          else if (snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: Text('Somthing went wrong'),
              );
          }
          final data=snapshot.data ??[];
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx,index){
              final values=data[index];
              String imagePath=values.coverImage;
              String imageUrl= '$baseUrl$imagePath';
              final date=DateTime.parse(values.releaseDate);
              final month=DateFormat('MMM').format(date);
              final fullMonth=DateFormat('MMMM').format(date);
              final day=date.day;
              return Container(
                color: Colors.black,
                height: size.height/2.1,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5,right: 7),
                          child: Column(
                            children: [ 
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(month,style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight:FontWeight.w500 ),),
                              ),
                              Text(day.toString(),style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5,right: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover
                              )
                            ),
                            height: size.height/3.7,
                            width: (size.width/1.2)+7,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding:const EdgeInsets.only(top: 15,left: 18),
                          child: Text(
                            values.title,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.notifications_none_sharp,
                                          size: 22,
                                        )),
                                  ],
                                ),
                                const Text(
                                  'Remind Me',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.info_outline_rounded,
                                            size: 22,
                                          )),
                                    ],
                                  ),
                                  const Text(
                                    'Info',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding:const  EdgeInsets.only(left: 45),
                      child: Text(
                        'Coming $fullMonth $day',
                        style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.only(left: 45),
                      child: Text(
                        values.overview,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          );
        }
      ),
    );
  }
}