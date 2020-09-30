import 'package:flutter/material.dart';
import 'package:flutter_shift_bd/sqlite/model/person.dart';

class AddPerson extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova pessoa"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Nome",
                    labelText: "Nome"
                ),
                controller: _firstNameController,
                validator: (value) {
                  //se retornar texto, o validador do formulário entende como erro
                  //e vai mostrar embaixo do campo na cor vermelha
                  if (value.isEmpty) {
                    return 'Insira o nome da pessoa';
                  }

                  //aqui é o único momento na vida do dev flutter que o null
                  //é algo bom. Ou seja, null, está tudo certo e o validador
                  //segue a sua vida
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                    hintText: "Sobrenome",
                    labelText: "Sobrenome"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira o sobrenome da pessoa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                    hintText: "Endereço",
                    labelText: "Endereço"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira o endereço da pessoa';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Person person = Person(
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        address: _addressController.text
                      );
                      Navigator.pop(context, person);
                    }
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
