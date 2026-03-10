import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_login/features/auth/cubit/auth_bloc.dart';
import 'package:register_login/features/auth/cubit/auth_event.dart';
import 'package:register_login/features/auth/cubit/auth_state.dart';
import 'package:register_login/features/auth/view/register_page.dart';
import '../../../core/constants/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  /// ЛОГО
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primaryBlue,
                    child: const Icon(
                      Icons.school,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// TITLE
                  const Text(
                    "Доорго кош келиңиз!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Сынак тапшыруу үчүн платформага кириңиз",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// ЛОГИН
                  _buildInput(
                    label: "Логин",
                    hint: "Логин жазыңыз",
                    value: state.login,
                    errorText: _loginError(state.login),
                    onChanged: (value) {
                      context.read<AuthBloc>().add(LoginChanged(value));
                    },
                  ),

                  const SizedBox(height: 20),

                  /// PASSWORD
                  _buildInput(
                    label: "Сыр сөз",
                    hint: "Сыр сөз жазыңыз",
                    value: state.password,
                    isObscure: true,
                    errorText: _passwordError(state.password),
                    onChanged: (value) {
                      context.read<AuthBloc>().add(PasswordChanged(value));
                    },
                  ),

                  const SizedBox(height: 35),

                  /// КИРҮҮ БАСМАСЫ
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: _formValid(state)
                                ? () {
                                    context
                                        .read<AuthBloc>()
                                        .add(LoginSubmitted());
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              disabledBackgroundColor:
                                  AppColors.primaryBlue.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Кирүү",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),

                  const SizedBox(height: 20),

                  /// REGISTER
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Аккаунт жокпу? Катталыңыз",
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// LOGIN VALIDATION
  static String? _loginError(String value) {
    if (value.isEmpty) return null;

    final latin = RegExp(r'^[a-zA-Z]+$');

    if (!latin.hasMatch(value)) {
      return "Логинде латын тамгалары гана болушу керек";
    }

    if (value.length < 3 || value.length > 16) {
      return "Логиндин узундугу 3төн 16га чейин болушу керек";
    }

    return null;
  }

  /// PASSWORD VALIDATION
  static String? _passwordError(String value) {
    if (value.isEmpty) return null;

    if (value.length < 8 || value.length > 16) {
      return "Сыр сөз 8ден 16га чейин болушу керек";
    }

    return null;
  }

  /// FORM CHECK
  static bool _formValid(AuthState state) {
    return _loginError(state.login) == null &&
        _passwordError(state.password) == null &&
        state.login.isNotEmpty &&
        state.password.isNotEmpty;
  }

  /// INPUT FIELD
  static Widget _buildInput({
    required String label,
    required String hint,
    required String value,
    required String? errorText,
    required Function(String) onChanged,
    bool isObscure = false,
  }) {
    final bool showError = value.isNotEmpty && errorText != null;

    return TextField(
      onChanged: onChanged,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,

        labelStyle: TextStyle(
          color: showError ? Colors.red : AppColors.primaryBlue,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: showError ? Colors.red : Colors.grey.shade400,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: showError ? Colors.red : AppColors.primaryBlue,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),

        errorText: showError ? errorText : null,

        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}