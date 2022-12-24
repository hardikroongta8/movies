import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[800],
      appBar: AppBar(
        title: const Text('Movies'),
        elevation: 0,
        backgroundColor: Colors.pink[900],
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.pink[900],
          ),
        ),
      ),
    );
  }
}