import 'package:flutter/material.dart';
import 'package:netflix_api_app/Screens/Search/search.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
      super.key,
      required this.colorNotifier,
      required this.safeAreaHeight,
      required this.tabBarNotifier,
    });

  final ValueNotifier<bool> colorNotifier;
  final double safeAreaHeight;
  final ValueNotifier<bool> tabBarNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:colorNotifier, 
      builder: (context,isTransparent,_){
        return SizedBox(
          height: 148,
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(microseconds: 500),
                color: isTransparent
                ? Colors.black.withOpacity(.9)
                :Colors.transparent,
                height: 60+safeAreaHeight,
                child: Column(
                  children: [
                    Container(
                      height: safeAreaHeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 5
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://clipground.com/images/logo-de-netflix-clipart-1.png'),
                                      fit: BoxFit.contain)),
                            ),
                            const Spacer(), 
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 26,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage()
                                  )
                                );
                              },
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(6)
                              ),
                              width: 30,
                              height: 30,
                            )
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: tabBarNotifier, 
                builder: (context,value,child){
                  return AnimatedContainer(
                    curve: Curves.easeInCubic,
                    duration:const Duration(milliseconds: 300),
                    height: value ? 30 :0,
                    width: double.maxFinite,
                    color: isTransparent
                    ?Colors.transparent
                    : Colors.transparent,
                    child: const Row(
                      children: [ 
                        SizedBox(width: 10,),
                        ContainerButton(label: 'TV Shows'),
                        SizedBox(width: 10,),
                        ContainerButton(label: 'Movies'),
                        SizedBox(width: 10,),
                        ContainerButton(label: 'Categories'),
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        );
      }
    ); 
  }
}

class ContainerButton extends StatelessWidget {
  const ContainerButton({super.key,required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 1),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(label,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    );
  }
}