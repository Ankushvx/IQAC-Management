import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 40,
      height: 80,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Text("hello"),

      //  backgroundColor: Colors.white,
    );
  }
}
