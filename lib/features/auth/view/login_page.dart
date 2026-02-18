import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_login/features/auth/view/register_page.dart';
import '../../../core/constants/app_colors.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state is AuthSuccess) {
                // 1. Ийгиликтүү билдирүү чыгаруу
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Кирүү ийгиликтүү!"),
                    backgroundColor: Colors.green,
                  ),
                );

                // 2. КИЙИНКИ БАРАККА ӨТҮҮ
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ), // HomePage'ге жиберебиз
                  (route) => false, // Логин барагын өчүрүп салат
                );
              }
            },

            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),

                    /// 🔵 ЛОГО
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

                    /// 🔹 ТЕКСТТЕР
                    const Text(
                      'Доорго кош келиңиз!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Сынак тапшыруу үчүн платформага кириниз',
                      style: TextStyle(fontSize: 14, color: AppColors.grayText),
                    ),

                    const SizedBox(height: 30),

                    
                    TextField(
                      controller: loginController,
                      decoration: InputDecoration(
                        hintText: 'Логин',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Сыр сөз',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                  
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: state is AuthLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () {
                                // Бош талааларды текшерүү (милдеттүү эмес, бирок пайдалуу)
                                if (loginController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  context.read<AuthCubit>().login(
                                    loginController.text,
                                    passwordController.text,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Талааларды толтуруңуз"),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue,
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
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Аккаунт жокпу? Катталыңыз",
                        style: TextStyle(color: Colors.blue),
                      ),
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
