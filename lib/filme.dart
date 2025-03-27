

class Filme
{

  late int id;
  late String nome;
  late int ano;
  late double avaliacao;
  late String diretor;


  Filme()
  {
    id = 0;
    nome ="";
    ano = 0;
    avaliacao = 0.0;
    diretor = "";

  }

  Filme.v(this.id, this.nome, this.ano, this.avaliacao, this.diretor);

  //Mapeando a classe com o Json
  Filme.fromJson(Map<String, dynamic> json): 
    id = json["idImdb"] as int,
    nome = json["title"] as String,
    ano = json["year"] as int,
    avaliacao = json["rating"] as double,
    diretor = json["director"] as String;

  Map<String, dynamic> toJson() => {
        'idImdb': id,
        'title': nome,
        'year': ano,
        'rating': avaliacao,
        'director': diretor,
      };
}
