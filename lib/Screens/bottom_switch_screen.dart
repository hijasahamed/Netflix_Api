import 'package:flutter/material.dart';
import 'package:netflix_api_app/Screens/Downlods/downloads_screen.dart';
import 'package:netflix_api_app/Screens/HomePage/home_screen.dart';
import 'package:netflix_api_app/Screens/New&Hot/new_and_hot_screen.dart';

class Switchscreen extends StatefulWidget {
  const Switchscreen({super.key});

  @override
  State<Switchscreen> createState() => _SwitchscreenState();
}

class _SwitchscreenState extends State<Switchscreen> {
  
  int tabindex=0;
  List tabs=[
  const HomeScreen(),
  const Newandhotscreen(),
  const DownloadsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(          
          currentIndex: tabindex,
          onTap: (index){
            setState(() {
              tabindex=index;
            });
          },      
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: 'New & Hot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_for_offline),
              label: 'Downloads',
            ),
          ],
        ),
        body: tabs[tabindex],
    );
  }
}