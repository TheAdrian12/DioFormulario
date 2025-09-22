import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:dioformulario/blocs/bloc_event.dart';
import 'package:dioformulario/models/usuario.dart';

part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<BlocSearchPressed>((event, emit) async {
      emit(BlocLoading());
      await Future.delayed(const Duration(seconds: 2));
      try {
        final url = Uri.parse(
          "https://mocki.io/v1/5afa5340-c502-45cb-9ced-a34a9bb646c6",
        );
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = jsonDecode(response.body);
          final Usuario usuario = Usuario.fromJson(data);

          emit(BlocSuccess([usuario]));
        } else {
          emit(BlocFailure());
        }
      } catch (e) {
        emit(BlocFailure());
      }
    });
  }
}
