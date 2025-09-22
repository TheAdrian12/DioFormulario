import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dioformulario/cubit/navegacionCubit.dart';
import 'package:dioformulario/views/vista.dart';
import 'package:dioformulario/views/Loading_view.dart';

class Inicial extends StatelessWidget {
  const Inicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NavegacionCubit, NavegacionState>(
        listener: (context, state) {
          if (state is NavegacionSuccess) {
            Navigator.pushReplacement(
              // Cambia a pushReplacement para evitar apilar pantallas
              context,
              MaterialPageRoute(builder: (context) => const Vista()),
            );
          }
        },
        builder: (context, state) {
          if (state is NavegacionInitial) {
            return Center(
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
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ingrese su correo',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ingrese su usuario',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ingrese su contraseña',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () => context.read<NavegacionCubit>().navegar(),
                    child: const Text('Registrar'),
                  ),
                ],
              ),
            );
          } else if (state is NavegacionLoading) {
            return const Loading();
          } else if (state is NavegacionSuccess) {
            return const Vista(); // Esto debería ser temporal, ya que el listener navega
          }
          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
