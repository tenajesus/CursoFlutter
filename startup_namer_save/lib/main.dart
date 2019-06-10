import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
    

void main() => runApp(MyApp());

class RandomWordsState extends State<RandomWords> {
  //Todo Add build() method
  final _lista = <WordPair> [];
  final _tamanio = const TextStyle(fontSize:19.0);
  //Añadimos _saved set para guardar las palabras
  final _saved = Set<WordPair>();

 
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
  // Comprobamos que no sea un valor repetido
  final bool alreadysaved = _saved.contains(pair);
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _tamanio,
    ),
    trailing: Icon(
      alreadysaved ? Icons.favorite : Icons.favorite_border,
      color: alreadysaved ? Colors.red : null,
    ),
    onTap: (){
      setState(() {
        if (alreadysaved){
          _saved.remove(pair);
        } else{
          _saved.add(pair);
        }
     });
    },
  );
 }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('List View Generator w/Favs'),
      actions: <Widget>[
      IconButton(icon: Icon(Icons.list),onPressed: _pushSaved)
      ],
    ),
     body: _buildLista(),
  );
 }
 
void _pushSaved(){
Navigator.of(context).push(
   MaterialPageRoute<void>(
     builder: (BuildContext context) {
       final Iterable<ListTile> tiles=_saved.map(
       (WordPair pair){
         return ListTile(
           title: Text(
             pair.asPascalCase,
             style: _tamanio,
           )
         );
        },  
       );
       final List<Widget> divided = ListTile
       .divideTiles(
         context: context,
         tiles: tiles,
       )
       .toList();
       return Scaffold(
         appBar: AppBar(
           title: Text('Frases Favoritas'),
         ),
         body: ListView(children:divided),
       );
      }, 
     ),
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
