
import 'package:evaluacion/pages/Registro.dart';
import 'package:evaluacion/pages/acercade.dart';
import 'package:evaluacion/pages/consulta.dart';
import 'package:evaluacion/views/edit_productos.dart';
import 'package:evaluacion/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => homeState();
}

class homeState extends State<home> {
  int ItemDrawer = 0;

  _getDrawerItem(int position) {
    switch (position) {
      case 1:return Registro();
      case 2:return Consulta();
      case 3:return const AcercaDe();
      case 4:return const EditProductos();
    }
  }

  void _onSelectItemDrawer(int pos) {
    Navigator.pop(context);
    setState(() {
      ItemDrawer = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.purpleAccent,
        title: Text('EVALUACIÓN 2 CRUD Y LOGIN'),

      ),
      //agregar un aimagen
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Center(
                child: Text(
                  'MENÚ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:35,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.red),
            ListTile(
              leading: Icon(Icons.switch_account_rounded ),
              title: Text('Acerca de R y B'),
              onTap: () {
                _onSelectItemDrawer(3);
              },
            ),
            ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Registrar'),
                onTap: () {
                  _onSelectItemDrawer(1);
                }),
            ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Editar Producto'),
                onTap: () {
                  _onSelectItemDrawer(4);
                }),
            ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Consultar'),
                onTap: () {
                  _onSelectItemDrawer(2);
                }),
            Divider(color: Colors.red),
            ListTile(
                leading: Icon(Icons.close),
                title: Text('Cerrar sesión'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  MaterialPageRoute(builder:(context)=> LoginPage());
                }),
          ],
        ),
      ),
      body:
      _getDrawerItem(ItemDrawer),



    );
  }
}