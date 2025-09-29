
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dioformulario/blocs/home_bloc.dart'; 
import 'package:dioformulario/blocs/home_state.dart'; 

import 'views/Loading_view.dart';
import 'views/failure_view.dart';
import 'views/Initial_view.dart';
import 'views/exito.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Exito()),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const LoadingView();
            } else if (state is HomeFailure) {
              return const FailureView();
            } else {
              return const InitialView();
            }
          },
        ),
      ),
    );
  }
}