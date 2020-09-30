class Person {
  int id;
  final String firstName;
  final String lastName;
  final String address;

  Person({this.id, this.firstName, this.lastName, this.address});

  //no Flutter.. vc faz parser de json-objetos e de objetos-json
  //usando uma instância de Map
  //dynamic: no DART, é uma tipagem fraca, que aceita qualquer coisa
  //isso foi necessário, porque o pacote de sqlite trabalha com json na
  //inserção e na leitura
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
    };
  }
}