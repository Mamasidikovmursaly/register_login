import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginChanged extends AuthEvent {
  final String login;
  const LoginChanged(this.login);

  @override
  List<Object?> get props => [login];
}

class PasswordChanged extends AuthEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends AuthEvent {
  const LoginSubmitted();
}

class NameChanged extends AuthEvent {
  final String name;
  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class SurnameChanged extends AuthEvent {
  final String surname;
  const SurnameChanged(this.surname);

  @override
  List<Object?> get props => [surname];
}

class PhoneChanged extends AuthEvent {
  final String phone;
  const PhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class ConfirmPasswordChanged extends AuthEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}

class RegisterSubmitted extends AuthEvent {
  const RegisterSubmitted();
}

class LoginEvent extends AuthEvent {
  final String login;
  final String password;
  const LoginEvent(this.login, this.password);

  @override
  List<Object?> get props => [login, password];
}
