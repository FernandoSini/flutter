
// classe representando dados da disciplina a ser
// persistida na base (local) de dados - sqlite
class Disciplina {

  int id;
  String nome;
  String curso;

  Disciplina(this.id, this.nome, this.curso);

  // converte atributos do objeto para um Map (chave / valor)
  Map<String, dynamic> toMap() {
    return {'id' : this.id,
    'nome' : this.nome,
    'curso' :this.curso};
  }

}