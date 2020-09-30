import 'package:cloud_firestore/cloud_firestore.dart';

class Car {

  final String name;
  final String brand;

  //referência do path do banco
  // / - raiz
  // /ford
  //cloud firestore = coleções e documentos
  DocumentReference reference;

  //construtor
  Car(this.name, this.brand);

  //construtor nomeado
  Car.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        brand = map['brand'];

  //construtor nomeado
  Car.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'brand': brand,
      };

}