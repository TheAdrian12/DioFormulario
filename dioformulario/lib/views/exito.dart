import 'package:flutter/material.dart';
import 'package:dioformulario/views/Data_succes.dart';

class Exito extends StatelessWidget {
  const Exito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage:  NetworkImage(
                "http://conceptodefinicion.de/wp-content/uploads/2014/10/persona.jpg",
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(20, 20),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: const DataSucces(),
            ),
          ],
        ),
      ),
    );
  }
}
