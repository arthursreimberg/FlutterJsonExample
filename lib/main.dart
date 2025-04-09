import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cinema/filme.dart';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(title: "App", home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAPP createState() => MainAPP();
}

class MainAPP extends State {
  List<Filme> filmes = List.empty();
  int total = 0;
  Future<void> readJson() async {
    var rootBundle2 = rootBundle;
    final String response = await rootBundle2.loadString('assets/movies.json');
    Iterable data = await json.decode(response);
    filmes = List<Filme>.from(data.map((model) => Filme.fromJson(model)));
    total = filmes.length;
    setState(() {
      filmes;
      total;
    });
  }

  @override
  initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: Center(
          child: 
                ListView.builder(
                  itemCount: filmes.length,
                  itemBuilder: (BuildContext context, index)
                   {
                    return Column(
                      
                      children: [
                        Container(
                          width: 300,
                          height: 100,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 176, 208, 235),
                          border: Border.all(
                            color: const Color.fromARGB(255, 173, 187, 199), // Cor da borda
                            width: 3.0,         // Largura da borda
                          ),
                          borderRadius: BorderRadius.circular(8)),
                        child: Column(
                            children: [
                              Text("Id: ${filmes[index].id.toString()}"),
                              Text("Titulo: ${filmes[index].nome}"),
                              Text("Lançamento: ${filmes[index].ano.toString()}"),
                              Text("Avaliação: ${filmes[index].avaliacao.toString()}"),
                            ],
                        ),
                        ),
                      ],
                    );  
                      
                   },)
            )),
    );
  }
}
