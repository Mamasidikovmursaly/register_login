import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<NameChanged>((event, emit) {
      final name = event.name.trim();
      String error = '';
      if (name.isEmpty) {
        error = 'Атыңызды жазыңыз';
      } else if (name.length < 2) {
        error = 'Атыңыз өтө кыска';
      }
      emit(state.copyWith(name: name, nameError: error, isSuccess: false));
    });

    on<SurnameChanged>((event, emit) {
      final surname = event.surname.trim();
      String error = '';
      if (surname.isEmpty) {
        error = 'Фамилияңызды жазыңыз';
      } else if (surname.length < 2) {
        error = 'Фамилияңыз өтө кыска';
      }
      emit(
        state.copyWith(surname: surname, surnameError: error, isSuccess: false),
      );
    });

    on<PhoneChanged>((event, emit) {
      final phone = event.phone.trim();
      final phoneRegex = RegExp(r'^(?:\+996|0)?[0-9]{9}$');
      String error = '';
      if (phone.isEmpty) {
        error = 'Телефон номерин жазыңыз';
      } else if (!phoneRegex.hasMatch(phone.replaceAll(' ', ''))) {
        error = 'Телефон номери туура эмес форматта';
      }
      emit(state.copyWith(phone: phone, phoneError: error, isSuccess: false));
    });

    on<LoginChanged>((event, emit) {
      final login = event.login.trim();
      String error = '';
      if (login.isEmpty) {
        error = 'Логинди жазыңыз';
      }
      emit(state.copyWith(login: login, loginError: error, isSuccess: false));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true)); 

      try {
        print("Кирүү баскычы иштеди: ${state.login}");

        emit(state.copyWith(isLoading: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: "Ката кетти!"));
      }
    });

    on<PasswordChanged>((event, emit) {
      final password = event.password;
      String error = '';
      if (password.isEmpty) {
        error = 'Сыр сөздү жазыңыз';
      } else if (password.length < 6) {
        error = 'Сыр сөз эң аз 6 белги болушу керек';
      }
      emit(
        state.copyWith(
          password: password,
          passwordError: error,
          isSuccess: false,
        ),
      );
      if (state.confirmPassword.isNotEmpty &&
          state.confirmPassword != password) {
        emit(state.copyWith(confirmPasswordError: 'Сыр сөздөр дал келбейт'));
      } else {
        emit(state.copyWith(confirmPasswordError: ''));
      }
    });

    on<ConfirmPasswordChanged>((event, emit) {
      final confirm = event.confirmPassword;
      String error = '';
      if (confirm != state.password) {
        error = 'Сыр сөздөр дал келбейт';
      }
      emit(
        state.copyWith(
          confirmPassword: confirm,
          confirmPasswordError: error,
          isSuccess: false,
        ),
      );
    });

  
on<RegisterSubmitted>((event, emit) async {
  emit(state.copyWith(isLoading: true));

  try {
    print("Катталуу баскычы иштеди!");
    print("Аты: ${state.name}, Телефону: ${state.phone}");

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(isLoading: false, isSuccess: true));
  } catch (e) {
    emit(state.copyWith(isLoading: false, errorMessage: "Каттоодо ката кетти"));
  }
});
    
  }
}
