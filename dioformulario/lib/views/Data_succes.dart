import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs-2/load_bloc.dart';
import '../blocs-2/load_event.dart';
import '../blocs-2/load_state.dart';
import 'failure_view.dart';
import 'loading_view.dart';

class DataSucces extends StatelessWidget {
  const DataSucces({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadBloc()..add(LoadDataPressed()),
      child: BlocBuilder<LoadBloc, LoadState>(
        builder: (context, state) {
          if (state is LoadLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadSuccess) {
            final usuario = state.usuario;
            return Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 104, 117, 189),
                      const Color.fromARGB(255, 117, 137, 203),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.white),
                      title: Text(
                        usuario.nombre,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: const Text(
                        "Usuario Premium",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Divider(color: Colors.white54, thickness: 1),
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.white),
                      title: Text(
                        usuario.correo,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.lock, color: Colors.white),
                      title: Text(
                        usuario.contra,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is LoadFailure) {
            return const FailureView();
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }
}
