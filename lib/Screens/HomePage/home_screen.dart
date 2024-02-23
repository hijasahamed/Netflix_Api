import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_api_app/Screens/HomePage/home_appbar.dart';
import 'package:netflix_api_app/Screens/HomePage/main_card.dart';
import 'package:netflix_api_app/Screens/HomePage/movie_widget.dart';
import 'package:netflix_api_app/Services/functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController scrollcontroller=ScrollController();
  final ValueNotifier<bool> tabbarnotifier=ValueNotifier(true);
  final ValueNotifier<bool> colornotifier=ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    scrollcontroller.addListener(_scrollListner);
    final safeAreaHeight=MediaQuery.of(context).padding.top;
    final size=MediaQuery.sizeOf(context);
    return Container(
      color: Colors.black,
      height: size.height,
      width: double.maxFinite,
      child: Stack(
        children: [
          ListView(
            controller: scrollcontroller,
            padding: EdgeInsets.zero,            
            children:  [
              MainCard(size:size),
              MovieWidget(size: size, text: 'Trending Now', future: getnowplaying()),
              MovieWidget(size: size, text: 'Upcoming Movies', future: getupcoming()),
              MovieWidget(size: size, text: 'Top Rated', future: gettoprated(),key1: true,)
            ],
          ),
          HomeAppBar(colorNotifier: colornotifier, safeAreaHeight: safeAreaHeight, tabBarNotifier: tabbarnotifier),
        ],
      ),
    );
  }

  _scrollListner() {
    if (scrollcontroller.position.userScrollDirection ==
        ScrollDirection.forward) {
      tabbarnotifier.value = true;
    } else {
      tabbarnotifier.value = false;
    }
    if (scrollcontroller.offset > 400) {
      colornotifier.value = true;
    } else {
      colornotifier.value = false;
    }
  }

}