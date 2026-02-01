import "package:flutter_bloc/flutter_bloc.dart";
import "auth_state.dart";

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String login, String password) {
    emit(AuthLoading()); // 1. Биринчи "Loading" (Жүктөө) сигналын берет. Экранда тегерекче айлана баштайт.
    if (login == 'admin' && password == '123') {
      emit(AuthSuccess());// 2. Эгер маалымат туура болсо, "Success" сигналын берет. UI муну угуп, кийинки баракка өткөрөт.
    } else {
      emit(AuthError("Логин же сыр сөз ката!"));// 3. Эгер ката болсо, ката билдирүүсүн жөнөтөт. UI муну кызыл жазуу менен чыгарат.
    }
  }
}