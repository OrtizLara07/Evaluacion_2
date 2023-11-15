import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
/**Metodo para consultar toda la informacion de la coleccion tb_productos */
Future<List> getProductos() async {
  List productos = [];
  CollectionReference collectionReference = db.collection('tb_productos');
  QuerySnapshot querySnapshot = await collectionReference.get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final producto = {
      "uid": doc.id,
      "nombre": data["nombre"],
      "precio": data["precio"],
    };
    productos.add(producto);
  }
//await Future.delayed(const Duration(seconds: 2));
  return productos;
}
Future<List> getpProductos1() async {
  List productos = [];
  CollectionReference collectionReference = db.collection('tb_productos');
  QuerySnapshot querySnapshot = await collectionReference.get();
/*
for (var documento in querySnapshot.docs) {
students.add(documento.data());
}
*/
  querySnapshot.docs.forEach((documento) {
    productos.add(documento.data());
  });
  await Future.delayed(const Duration(seconds: 2));
  return productos;
}
//Método para agregar documentos de alumnos.
Future<void> Registrar(String idproducto,String nombre, String precio) async {
  await db.collection('tb_productos').add({"id":idproducto,"nombre" : nombre, "precio"
      : precio});
}
//Método para actualizar documentos de estudiantes.
Future<void> editProducto(String uid, String nombre, String precio, String stock) async {
  await db.collection('tb_productos').doc(uid).set({"nombre" : nombre,
    "precio" : precio, "stock":stock});
}
//Método para eliminar documentos de estudiantes.
Future<void> deleteProducto(String uid) async{
  await db.collection('tb_productos').doc(uid).delete();
}
//print('$
//Método para actualizar documentos de productos.
//Future<void> editProducto(String uid, String nombre, String precio) async {
// await db.collection('tb_productos').doc(uid).set({"nombre" : nombre,
//   "precio" : precio});
//}
//Método para eliminar documentos de estudiantes.
//Future<void> deleteProducto(String uid) async{
//  await db.collection('tb_productos').doc(uid).delete();
//}