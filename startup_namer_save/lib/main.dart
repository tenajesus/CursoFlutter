import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class RandomWordsState extends State<RandomWords> {
  //Todo Add build() method
  final _lista = <WordPair> [];
  final _tamanio = const TextStyle(fontSize:19.0);

 
  Widget _buildLista() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _lista.length) {
          _lista.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_lista[index]);
      });
}
  Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _tamanio,
    ),
  );
 }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Lista Infinita'),
    ),
    body: _buildLista(),
  );
 }
 
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
          
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      
      title: 'Startup Name Generator',            
      home: RandomWords(),
    );
  }
}
