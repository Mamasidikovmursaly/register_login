import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_login/core/routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              _showMsg(context, "Каттоо ийгиликтүү!", Colors.green);
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              }
            }
            if (state is AuthError) {
              _showMsg(context, state.message, Colors.red);
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
                    child: const Icon(Icons.school, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text('Катталуу', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25),

                  _buildField(nameController, 'Аты'),
                  _buildField(surnameController, 'Фамилия'),
                  _buildField(phoneController, 'Телефон (мис: 776800082)', keyboardType: TextInputType.phone),
                  _buildField(loginController, 'Логин'),
                  _buildField(passwordController, 'Сыр сөз', isObscure: true),
                  _buildField(confirmPasswordController, 'Сыр сөздү кайра жазыңыз', isObscure: true),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              final name = nameController.text.trim();
                              final surname = surnameController.text.trim();
                              final phone = phoneController.text.trim();
                              final login = loginController.text.trim();
                              final password = passwordController.text.trim();
                              final confirmPass = confirmPasswordController.text.trim();

                              // 1. БОШ ТАЛААЛАР
                              if (name.isEmpty || surname.isEmpty || phone.isEmpty || login.isEmpty || password.isEmpty) {
                                _showMsg(context, "Бардык талааларды толтуруңуз!", Colors.orange);
                                return;
                              }

                              // 2. АТЫ-ЖӨНҮ (кеминде 2 тамга)
                              if (name.length < 2 || surname.length < 2) {
                                _showMsg(context, "Аты-жөнүңүздү толук жазыңыз!", Colors.red);
                                return;
                              }

                              // 3. ТЕЛЕФОН (9 символ)
                              if (phone.length < 9) {
                                _showMsg(context, "Телефон номери кеминде 9 символ болушу керек!", Colors.red);
                                return;
                              }

                              // 4. ЛОГИН (4 символ)
                              if (login.length < 4) {
                                _showMsg(context, "Логин кеминде 4 символ болушу керек!", Colors.red);
                                return;
                              }

                              // 5. СЫР СӨЗ (6 символ)
                              if (password.length < 6) {
                                _showMsg(context, "Сыр сөз кеминде 6 символ болушу керек!", Colors.red);
                                return;
                              }

                              // 6. ДАЛ КЕЛҮҮСҮ
                              if (password != confirmPass) {
                                _showMsg(context, "Сыр сөздөр бири-бирине дал келбейт!", Colors.red);
                                return;
                              }

                              context.read<AuthCubit>().register(name, surname, phone, login, password);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text("Катталуу", style: TextStyle(fontSize: 18, color: Colors.white)),
                          ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
                    child: const Text("Аккаунт барбы? Кириңиз", style: TextStyle(color: AppColors.primaryBlue)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showMsg(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color, duration: const Duration(seconds: 2)),
    );
  }

  Widget _buildField(TextEditingController controller, String hint, {bool isObscure = false, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}