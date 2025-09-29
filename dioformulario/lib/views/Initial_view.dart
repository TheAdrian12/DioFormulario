import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_event.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final correoController = TextEditingController();
    final usuarioController = TextEditingController();
    final contraController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 208, 224),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Registro',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: correoController,
                decoration: InputDecoration(
                  labelText: 'Ingrese su correo',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.email, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: usuarioController,
                decoration: InputDecoration(
                  labelText: 'Ingrese su usuario',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.person, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: contraController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Ingrese su contraseña',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.lock, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                      HomeLoginPressed(
                        correoController.text,
                        usuarioController.text,
                        contraController.text,
                      ),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                shadowColor: Colors.tealAccent,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}