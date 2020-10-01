import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shift_bd/firebase/addCar.dart';
import 'package:flutter_shift_bd/firebase/model/car.dart';

class ListCars extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Future<Car> future = Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCar(),
                  ));
              future.then((car) {
                if (car != null){
                  insertCar(car);
                }
              });
            },
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  insertCar(Car car){
    Firestore.instance.collection('car').add(car.toJson());
  }

  Widget _buildBody(BuildContext context) {
    return Center();
  }


}