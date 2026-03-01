import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  
  final String login;
  final String loginError;
  final String password;
  final String passwordError;
  
  
  final String name;
  final String nameError;
  final String surname;
  final String surnameError;
  final String phone;
  final String phoneError;
  final String confirmPassword;
  final String confirmPasswordError;
  
  
  final String errorMessage;
  final bool isLoading;
  final bool isSuccess;

  
  const AuthState({
    this.login = '',
    this.loginError = '',
    this.password = '',
    this.passwordError = '',
    this.name = '',
    this.nameError = '',
    this.surname = '',
    this.surnameError = '',
    this.phone = '',
    this.phoneError = '',
    this.confirmPassword = '',
    this.confirmPasswordError = '',
    this.errorMessage = '',
    this.isLoading = false,
    this.isSuccess = false,
  });

  
  @override
  List<Object?> get props => [
        login,
        loginError,
        password,
        passwordError,
        name,
        nameError,
        surname,
        surnameError,
        phone,
        phoneError,
        confirmPassword,
        confirmPasswordError,
        errorMessage,
        isLoading,
        isSuccess,
      ];

  
  AuthState copyWith({
    String? login,
    String? loginError,
    String? password,
    String? passwordError,
    String? name,
    String? nameError,
    String? surname,
    String? surnameError,
    String? phone,
    String? phoneError,
    String? confirmPassword,
    String? confirmPasswordError,
    String? errorMessage,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return AuthState(
      login: login ?? this.login,
      loginError: loginError ?? this.loginError,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      name: name ?? this.name,
      nameError: nameError ?? this.nameError,
      surname: surname ?? this.surname,
      surnameError: surnameError ?? this.surnameError,
      phone: phone ?? this.phone,
      phoneError: phoneError ?? this.phoneError,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}