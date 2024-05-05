import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu_outlined),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.notifications),
            )],
        ),
        body: 
        Column(
          children: [
           Container(
            color: Colors.black,
            height: 100,
            width: 100,
           )
          ],
        ),
      ),
    );
  }
}