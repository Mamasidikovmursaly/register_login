import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_login/core/routes/app_routes.dart';
import 'package:register_login/features/auth/cubit/auth_event.dart';
import '../../../core/constants/app_colors.dart';
import '../cubit/auth_bloc.dart';
import '../cubit/auth_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isSuccess) {
              _showMsg(context, "Каттоо ийгиликтүү!", Colors.green);
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            }

            if (state.errorMessage.isNotEmpty) {
              _showMsg(context, state.errorMessage, Colors.red);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primaryBlue,
                    child: const Icon(
                      Icons.school,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Катталуу',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),

                  _buildAnimatedField(
                    hint: 'Аты',
                    errorText: state.nameError,
                    onChanged: (val) =>
                        context.read<AuthBloc>().add(NameChanged(val)),
                  ),
                  _buildAnimatedField(
                    hint: 'Фамилия',
                    errorText: state.surnameError,
                    onChanged: (val) =>
                        context.read<AuthBloc>().add(SurnameChanged(val)),
                  ),
                  _buildAnimatedField(
                    hint: 'Телефон номери',
                    errorText: state.phoneError,
                    keyboardType: TextInputType.phone,
                    onChanged: (val) =>
                        context.read<AuthBloc>().add(PhoneChanged(val)),
                  ),
                  _buildAnimatedField(
                    hint: 'Логин',
                    errorText: state.loginError,
                    onChanged: (val) =>
                        context.read<AuthBloc>().add(LoginChanged(val)),
                  ),
                  _buildAnimatedField(
                    hint: 'Сыр сөз',
                    errorText: state.passwordError,
                    isObscure: true,
                    onChanged: (val) =>
                        context.read<AuthBloc>().add(PasswordChanged(val)),
                  ),
                  _buildAnimatedField(
                    hint: 'Сыр сөздү кайра жазыңыз',
                    errorText: state.confirmPasswordError,
                    isObscure: true,
                    onChanged: (val) => context.read<AuthBloc>().add(
                      ConfirmPasswordChanged(val),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: _isFormValid(state)
                                ? () => context.read<AuthBloc>().add(
                                    RegisterSubmitted(),
                                  )
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,

                              disabledBackgroundColor: AppColors.primaryBlue
                                  .withOpacity(0.5),
                              disabledForegroundColor: Colors.white,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Катталуу",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.login,
                    ),
                    child: const Text(
                      "Аккаунт барбы? Кириңиз",
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool _isFormValid(AuthState state) {
    return state.name.isNotEmpty &&
        state.surname.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.login.isNotEmpty &&
        state.password.isNotEmpty &&
        state.confirmPassword.isNotEmpty &&
        state.nameError.isEmpty &&
        state.surnameError.isEmpty &&
        state.phoneError.isEmpty &&
        state.loginError.isEmpty &&
        state.passwordError.isEmpty &&
        state.confirmPasswordError.isEmpty;
  }

  Widget _buildAnimatedField({
    required String hint,
    required String errorText,
    required Function(String) onChanged,
    bool isObscure = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: onChanged,
        obscureText: isObscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,

          errorText: errorText.isEmpty ? null : errorText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryBlue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  void _showMsg(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
