import 'dart:math';

import 'package:flutter/material.dart';
import 'package:name_generator/screens/random_names_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //holds the current random name,
  String _currentName = '';

  //function to generate random names
  void _generateRandomName() {
    final random = Random();

    //Generate a random index
    int randomIndex = random.nextInt(randomNames.length);

    setState(() {
      //update the current name
      _currentName = randomNames[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Random Name Generator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //instruction
            const Text(
              textAlign: TextAlign.center,
              "Click on the Button to \nGenerate Random Names",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            //random names are displayed here
            Text(
              _currentName.isEmpty ? '' : _currentName,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),

            //random names generator button.
            ElevatedButton(
              style: const ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
              onPressed: () {
                //clickable function.
                _generateRandomName();
              },
              child: const Icon(Icons.add_circle_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
