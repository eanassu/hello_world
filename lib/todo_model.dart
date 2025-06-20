class Todo {
  int? id; // O 'id' é opcional pois será gerado pelo banco de dados
  String title;
  String description;
  bool isDone;

  Todo({this.id, required this.title, required this.description, this.isDone = false});

  // Converte um objeto Todo em um Mapa. Útil para inserção no banco de dados.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0, // SQLite não tem booleano, 1 para true, 0 para false
    };
  }

  // Cria um objeto Todo a partir de um Mapa. Útil para ler do banco de dados.
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isDone: map['isDone'] == 1 ? true : false,
    );
  }
}