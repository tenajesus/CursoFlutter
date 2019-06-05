import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Usando paquetes de Terceros, WordPair.random();'),
        ),
        body: Center(
          // child: Text('Instructor: ITIC. Jesús Salvador Rodriguez Cardiel'),
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
