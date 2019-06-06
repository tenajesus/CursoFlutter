import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class RandomWordsState extends State<RandomWords>{
  //Todo Add build() method
  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWords extends StatefulWidget{
@override
RandomWordsState createState() => RandomWordsState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Usando paquetes de Terceros, WordPair.random();'),
        ),
        body: Center(
          // child: Text('Instructor: ITIC. Jesús Salvador Rodriguez Cardiel'),
          child: RandomWords(),
        ),
      ),
    );
  }
}
