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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
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

              if (state.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Кирүү ийгиликтүү!"),
                    backgroundColor: Colors.green,
                  ),
                );

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),

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
                      'Доорго кош келңиз!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    const Text(
                      'Сынак тапшыруу үчүн платформага кириңиз',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.grayText,
                      ),
                    ),
                    const SizedBox(height: 30),

                    TextField(
                      onChanged: (value) {
                        context.read<AuthBloc>().add(LoginChanged(value));
                      },
                      decoration: InputDecoration(
                        hintText: 'Логин',
                        errorText: state.loginError.isEmpty
                            ? null
                            : state.loginError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        context.read<AuthBloc>().add(PasswordChanged(value));
                      },
                      decoration: InputDecoration(
                        hintText: 'Сыр сөз',
                        errorText: state.passwordError.isEmpty
                            ? null
                            : state.passwordError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed:
                                  (state.loginError.isEmpty &&
                                      state.passwordError.isEmpty &&
                                      state.login.isNotEmpty &&
                                      state.password.isNotEmpty)
                                  ? () {
                                      context.read<AuthBloc>().add(
                                        LoginSubmitted(),
                                      );
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue,

                                disabledBackgroundColor: AppColors.primaryBlue
                                    .withOpacity(0.6),

                                disabledForegroundColor: Colors.white
                                    .withOpacity(0.8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
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

                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text("Аккаунт жокпу? Катталыңыз"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
