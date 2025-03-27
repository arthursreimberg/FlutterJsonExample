import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cinema/filme.dart';
import 'dart:convert';

void main() {
  runApp( const MaterialApp (title: "App",
      home: MainApp(),));;
}


class MainApp extends StatefulWidget{
  const MainApp({super.key});
  
  @override
  MainAPP createState() => MainAPP();
}
  

class MainAPP extends State {
  List<Filme> filmes = List.empty();
  Future<void> readJson() async {
    var rootBundle2 = rootBundle;
    final String response = await rootBundle2.loadString('assets/movies.json');
    Iterable data = await json.decode(response);
    filmes =  List<Filme>.from(data.map((model)=> Filme.fromJson(model)));
    setState(() {
      filmes;
    });
  }
  
  @override
   initState()  {
    super.initState();
       readJson();
       }
  @override
  Widget build(BuildContext context) {
    int total = 50;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView.builder(
            itemExtent: total.toDouble(), 
            itemBuilder: (BuildContext context, int index) { 
              return Column(
                children: [
                  Text(filmes[index].id as String),
                  Text(filmes[index].nome),
                  Text(filmes[index].ano as String),
                  Text(filmes[index].avaliacao as String),
                  Text(filmes[index].diretor)
                ],
              );
             },
            

          )
        ),
      ),
    );
  }
}
