import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String login, String password) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (login == "1111" && password == "1111") {
      emit(AuthSuccess());
    } else {
      emit(AuthError("Логин же сыр сөз туура эмес"));
    }
  }

  Future<void> register(
      String name,
      String surname,
      String phone,
      String login,
      String password,
      ) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(AuthSuccess());
  }
}
