import 'package:flutter/material.dart';
import 'package:evaluacion/models/crud.dart';

class Home2 extends StatefulWidget {
  const Home2({
    super.key
  });

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  dynamic datos;

  void dataFireBase() {
    db.collection("tb_productos").where("nombre", isEqualTo: "uva").get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
  void dataFireBase1() {
    setState(() {
      db.collection("tb_productos").get().then(
            (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consulta Cloud Firestore"),
      ),
      body: FutureBuilder(
          future: getProducto(), // Assuming this is a function you've defined somewhere
          builder: ((context, snapshot) {
            if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return Dismissible(
                      key: Key(snapshot.data?[index]['uid']),
                      onDismissed: (direction) async {
                        // Method to delete
                        await deleteProducto(snapshot.data?[index]['uid']);
                        setState(() {
                          snapshot.data?.removeAt(index);
                        });
                      },
                      confirmDismiss: (direction) async {
                        bool result = false;
                        result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("¿Realmente quieres eliminar a ${snapshot.data?[index]['nombre']} ${snapshot.data?[index]['precio']}?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text("Aceptar"),
                                ),
                              ],
                            );
                          },
                        );
                        return result;
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.startToEnd, // Specify the direction here
                      child: Card(
                          elevation: 10,
                          clipBehavior: Clip.hardEdge,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: InkWell(
                            splashColor: Colors.blueGrey,
                            onTap: () async {
                              await Navigator.pushNamed(context, "/edit", arguments: {
                                "uid": snapshot.data?[index]['uid'],
                                'nombre': snapshot.data?[index]['nombre'],
                                'precio': snapshot.data?[index]['precio']
                              });
                              setState(() {});
                            },
                            child: SizedBox(
                              width: 300,
                              height: 100,
                              child: Center(
                                child: Text(
                                  snapshot.data?[index]['nombre'] + " " + snapshot.data?[index]['precio'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ) );             }),
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        await Navigator.pushNamed(context, "/add");
        setState(() {
        });
//print('Termino la espera');
      },
        child: const Icon(Icons.add),
      ),
    );
  }

  getProducto() {}
}



