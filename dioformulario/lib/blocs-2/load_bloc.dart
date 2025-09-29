import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../models/usuario.dart';
import 'load_event.dart';
import 'load_state.dart';

class LoadBloc extends Bloc<LoadEvent, LoadState> {
  LoadBloc() : super(LoadInitial()) {
    on<LoadDataPressed>((event, emit) async {
      emit(LoadLoading());

      final dio = Dio();
      final url = "https://raw.githubusercontent.com/TheAdrian12/DioFormulario/refs/heads/main/usuario.json";

      try {
        final response = await dio.get(url);
        Map<String, dynamic> objectMap = jsonDecode(response.data);

        if (response.statusCode == 200) {
          Usuario usuario = Usuario.fromJson(objectMap);
          emit(LoadSuccess(usuario));
        } else {
          emit(LoadFailure());
        }
      } catch (e) {
        emit(LoadFailure());
      }
    });
  }
}