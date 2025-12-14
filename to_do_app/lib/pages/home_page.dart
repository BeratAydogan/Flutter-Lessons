import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  List toDoList=[
    ['Learn Web Dev', false],
    ['Learn Mobile Dev', false],
    ['Learn Backend Dev', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('Simple ToDo App'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(itemCount: toDoList.length, itemBuilder: (BuildContext context, index) {
        return Container(
          child: Text(
            toDoList[index][0],
          ),
        );
      }),
    );
  }
}