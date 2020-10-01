import 'package:floor/floor.dart';

//a entidade
@entity
class Book {
  @PrimaryKey(autoGenerate: true)
  int id;

  final String name;
  final String author;

  //construtor com parâmetros opcionais (uso das chaves)
  Book({this.id, this.name, this.author});
}