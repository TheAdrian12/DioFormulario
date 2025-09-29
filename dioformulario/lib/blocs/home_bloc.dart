import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoginPressed>((event, emit) async {
      emit(HomeLoading());

      final dio = Dio();
      final url = "https://jsonplaceholder.typicode.com/posts";

      try {
        final response = await dio.post(
          url,
          data: {
            "correo": event.correo,
            "usuario": event.usuario,
            "contra": event.contra
          },
          options: Options(headers: {"Content-Type": "application/json"}),
        );

        if (response.statusCode == 201) {
          emit(HomeSuccess());
        } else {
          emit(HomeFailure());
        }
      } catch (e) {
        emit(HomeFailure());
      }
    });
  }
}