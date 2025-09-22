import 'package:flutter/material.dart';
import 'package:dioformulario/views/vistacambiante.dart';

class Vista extends StatelessWidget {
  const Vista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuNhTZJTtkR6b-ADMhmzPvVwaLuLdz273wvQ&s',
            ),
            SizedBox(height: 50),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(20, 20),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: const Vistacambiante(),
            ),
          ],
        ),
      ),
    );
  }
}
