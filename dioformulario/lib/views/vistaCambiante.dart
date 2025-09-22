import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dioformulario/blocs/app_bloc.dart';
import '../blocs/bloc_event.dart';

class Vistacambiante extends StatefulWidget {
  const Vistacambiante({super.key});

  @override
  State<Vistacambiante> createState() => _VistaState();
}

class _VistaState extends State<Vistacambiante> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BlocBloc>().add(BlocSearchPressed());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocBloc, BlocState>(
      builder: (context, state) {
        if (state is BlocInitial) {
          return Column(
            children: [
              Text('infomacion 1', style: TextStyle(fontSize: 18)),
              Text('infomacion 2', style: TextStyle(fontSize: 18)),
              Text('infomacion 3', style: TextStyle(fontSize: 18)),
              Text('infomacion 4', style: TextStyle(fontSize: 18)),
            ],
          );
        } else if (state is BlocLoading) {
          return Center(
            child: SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                strokeWidth: 8,
              ),
            ),
          );
        } else if (state is BlocSuccess) {
          final usuarios = state.usuarios;

          return Column(
            children: usuarios
                .map(
                  (usuario) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre: ${usuario.nombre}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Correo: ${usuario.correo}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Contraseña: ${usuario.contra}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                )
                .toList(),
          );
        } else if (state is BlocFailure) {
          return Center(
            child: Text(
              'ERROR',
              style: TextStyle(
                color: Colors.red,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black12, offset: Offset(5, 5))],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
