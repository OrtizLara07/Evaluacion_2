import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget{
  const AcercaDe({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset('img/bre.jpg',
                    height: 250,
                    width: 600,),
                  const Text('Brenda Molina',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset('img/rebe.jpg',
                    height: 250,
                    width: 600,),
                  const Text('Rebeca Ortiz',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}