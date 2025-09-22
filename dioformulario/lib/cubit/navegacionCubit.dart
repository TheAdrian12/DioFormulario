import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navegacionState.dart';

class NavegacionCubit extends Cubit<NavegacionState> {
  NavegacionCubit() : super(NavegacionInitial());

  void navegar() async {
    emit(NavegacionLoading());

    await Future.delayed(Duration(seconds: 3));

    emit(NavegacionSuccess());
  }
}
