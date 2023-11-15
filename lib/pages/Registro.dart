import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registro extends StatefulWidget{

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  Future<void> agregarProducto(String idproducto, String nombre, String precio, String stock) async{
    await FirebaseFirestore.instance.collection('tb_productos').add({"id":idproducto,"nombre": nombre, "precio": precio, "stock": stock});
  }

 TextEditingController IdController = TextEditingController();

  TextEditingController NombreController = TextEditingController();

  TextEditingController PrecioController = TextEditingController();

  TextEditingController StockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text('Registro de productos',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),



              const SizedBox(height: 15),
              TextField(
                controller: IdController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Id',

                ),
              ),

              const SizedBox(height: 15),
              TextField(
                controller: NombreController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Nombre',

                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: PrecioController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Precio',

                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: StockController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: const Icon(Icons.arrow_forward),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Stock',

                ),
              ),
              const SizedBox(height: 15),

              ElevatedButton(onPressed: () async{
                await agregarProducto(IdController.text, NombreController.text, PrecioController.text, StockController.text).then((_){
                  Registro();

                  IdController.clear();
                  NombreController.clear();
                  PrecioController.clear();
                  StockController.clear();
                });
              },
                child: const Text('Guardar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}