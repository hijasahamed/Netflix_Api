import 'package:flutter/material.dart';

class Newandhotscreen extends StatefulWidget {
  const Newandhotscreen({super.key});

  @override
  State<Newandhotscreen> createState() => _NewandhotscreenState();
}

class _NewandhotscreenState extends State<Newandhotscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('New and Hot Screen'),
      ),
    );
  }
}