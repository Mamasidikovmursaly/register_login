import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    
    on<NameChanged>((event, emit) {
      emit(state.copyWith(
        name: event.name,
        nameError: event.name.isEmpty ? 'Атыңызды жазыңыз' : '',
        isSuccess: false, // Жаңы жазып жатканда ийгилик статусун өчүрөбүз
      ));
    });

    on<SurnameChanged>((event, emit) {
      emit(state.copyWith(
        surname: event.surname,
        surnameError: event.surname.isEmpty ? 'Фамилияңызды жазыңыз' : '',
        isSuccess: false,
      ));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
        phone: event.phone,
        phoneError: event.phone.length < 9 ? 'Телефон номери туура эмес' : '',
        isSuccess: false,
      ));
    });

    on<LoginChanged>((event, emit) {
      emit(state.copyWith(
        login: event.login,
        loginError: event.login.length < 4 ? 'Логин өтө кыска' : '',
        isSuccess: false,
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: event.password,
        passwordError: event.password.length < 6 ? 'Сыр сөз өтө кыска' : '',
        isSuccess: false,
      ));
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(
        confirmPassword: event.confirmPassword,
        confirmPasswordError: event.confirmPassword != state.password ? 'Сыр сөздөр дал келбейт' : '',
        isSuccess: false,
      ));
    });

    on<RegisterSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: ''));
      try {
        await Future.delayed(const Duration(seconds: 2)); // API чакырууну симуляциялоо
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: 'Ката кетти, кайра аракет кылыңыз'));
      }
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: ''));
      try {
        await Future.delayed(const Duration(seconds: 2));
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: 'Логин же сыр сөз туура эмес'));
      }
    });
  }
}