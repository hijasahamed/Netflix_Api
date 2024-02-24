import 'package:flutter/material.dart';
import 'package:netflix_api_app/Services/api_service.dart';

// ignore: must_be_immutable
class SecondAndThirdTab extends StatelessWidget {
   SecondAndThirdTab({super.key,required this.future,required this.topten});

  Future future;
  bool? topten;

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scrollbar(
      child: FutureBuilder(
        future: future, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent);
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          final data = snapshot.data ?? [];
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx, index) {
              final values = data[index];
              String imagePath = values.coverImage;
              String imageUrl = '$baseUrl$imagePath';
              return Container(
                height: size.height / 2.3,
                width: double.maxFinite,
                color: Colors.black,
                child: Column(
                  children: [  
                    if(topten==true)
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 5, top: 5, bottom: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),
                              height: size.height / 3.7,
                              width: (size.width / 1.2) + 7,
                            ),
                          ),
                        ],
                      ),
                    if(topten==false)
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: size.height / 4,
                        ),
                      ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: SizedBox(
                            width: size.width / 2,
                            height: 50,
                            child: Text(
                              values.title,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
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
                                        Icons.share,
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'Share',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Info',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.play_arrow,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Info',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15),
                      child: Text(
                        values.overview,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}