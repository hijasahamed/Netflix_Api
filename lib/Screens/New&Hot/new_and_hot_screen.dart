import 'package:flutter/material.dart';
import 'package:netflix_api_app/Screens/New&Hot/first_tab.dart';
import 'package:netflix_api_app/Screens/appbar_screen.dart';
import 'package:netflix_api_app/Services/functions.dart';

class Newandhotscreen extends StatefulWidget {
  const Newandhotscreen({super.key});

  @override
  State<Newandhotscreen> createState() => _NewandhotscreenState();
}

class _NewandhotscreenState extends State<Newandhotscreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: SafeArea(
        child: Scaffold(
          appBar: appbarWidget(
            title: 'New & Hot',
            context: context,
            notification: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
               child: TabBar(
                splashFactory: NoSplash.splashFactory,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 6),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
                unselectedLabelColor: Colors.white.withOpacity(.7),
                isScrollable: true,
                tabs: [
                  customTab(text: '🍿 Coming Soon '),
                  customTab(text: '🔥 Everyone\'s watching '),
                  customTab(text: '🔟 Top 10 Tv Shows'),
                  customTab(text: '🔟 Top 10 Movies')
                ]
              )
              )
          ),
          body: TabBarView(
            children: [
              Firsttab(future: getupcoming()),
              
            ]
          ),
        )
      )
    );
  }

  Padding customTab({required text}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Tab(text: text,),
    );
  }

}