import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resolución y Densidad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resolución y Densidad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/image_low_res.png',
              width: 200,
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/image_medium_res.png',
              width: 200,
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/image_high_res.png',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
