import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dioformulario/blocs/app_bloc.dart';
import 'package:dioformulario/cubit/navegacionCubit.dart';
import 'package:dioformulario/views/Initial_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BlocBloc()),
        BlocProvider(create: (_) => NavegacionCubit()),
      ],
      child: MaterialApp(home: Inicial()),
    );
  }
}
