import 'package:flutter/material.dart';

import '../models/crud.dart';




 class EditProductos extends StatefulWidget {
   const EditProductos({super.key});

   @override
   State<EditProductos> createState() => _EditProductosState();
   }

  class _EditProductosState extends State<EditProductos> {



final TextEditingController IdController = TextEditingController(text: "");
final TextEditingController NombreController = TextEditingController(text: "");
final TextEditingController PrecioController = TextEditingController(text: "");
final TextEditingController StockController = TextEditingController(text: "");
 @override
 Widget build(BuildContext context) {
   /*
 Aca se reciben los parámetros enviados al dar clic
 en cualquier elemento de la lista. Estos datos se pintan en EditText
 */
   final Map arguments = ModalRoute.of(context)!.settings.arguments as
  Map;
   IdController.text = arguments["uid"];
   NombreController.text = arguments['nombre'];
   PrecioController.text = arguments["precio"];
   StockController.text = arguments['stock'];

   return Scaffold(
   appBar: AppBar(
   title: const Text('Editando Estudiante')
   ),
   body: Padding(
   padding: const EdgeInsets.all(15.0),
   child: Column(
   children: [
   const Text('Información Estudiante',
   style: TextStyle(
   fontSize: 30,
   color: Colors.grey,
   fontWeight: FontWeight.bold
   ),
   ),
   const SizedBox(height: 20,),
   TextField(
   controller: NombreController,
   keyboardType: TextInputType.text,
   decoration: const InputDecoration(
   border: OutlineInputBorder(),
   hintText: 'Digite sus nombres',
   prefixIcon: Icon(Icons.person,
  color: Colors.red,)
   ),
   ),
   const SizedBox(height: 20,),
   TextField(
   controller: PrecioController,
   keyboardType: TextInputType.text,
   decoration: const InputDecoration(
   border: OutlineInputBorder(),
   hintText: 'Digite sus apellidos',
   prefixIcon: Icon(Icons.arrow_forward_ios,
   color: Colors.red,)
   ),
   ),
   const SizedBox(height: 20,),
   ElevatedButton(
   onPressed: () async{
   //print(arguments["uid"]);
   //await editAlumno("", _nombresControllers.text,StockController.text;
   await editProducto(arguments['uid'], NombreController.text, PrecioController.text,StockController.text).then((_){
   Navigator.pop(context);
   });
   },
   child: const Text('Actualizar'))
   ]),
   ),
   );
 }
  }

