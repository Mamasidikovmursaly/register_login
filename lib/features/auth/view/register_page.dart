import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:register_login/core/constants/app_colors.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Контроллерлор маалыматты алуу үчүн
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController(
    text: '+996',
  );
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Логотип
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.school,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Катталуу',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Төмөндөгү маалыматты толтуруңуз',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Аты
              _buildTextField(
                label: 'Аты',
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.length < 3 || value.length > 16) {
                    return 'Атыңыздын узундугу 3төн 16га чейин болушу керек';
                  }
                  return null;
                },
              ),

              // Фамилия
              _buildTextField(
                label: 'Фамилия',
                controller: _surnameController,
                validator: (value) {
                  if (value == null || value.length < 3 || value.length > 16) {
                    return 'Фамилияңыздын узундугу 3төн 16га чейин болушу керек';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  // Жазып жатканда дароо текшерип туруу үчүн:
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(13),
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Телефон номери',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  // КАТАНЫ ТЕКШЕРҮҮ:
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Номерди жазыңыз';
                    }
                    // Эгер номер +996 менен башталбаса же 13 символдон аз болсо ката берет
                    if (!RegExp(r'^\+996\d{9}$').hasMatch(value)) {
                      return 'Номер +996XXXXXXXXX форматында болушу керек';
                    }
                    return null; // Ката жок болсо null кайтарат
                  },
                ),
              ),
              SizedBox(height: 8),

              // Логин
              _buildTextField(
                label: 'Логин',
                controller: _loginController,
                validator: (value) {
                  if (value == null || value.length < 3 || value.length > 16) {
                    return 'Логиндин узундугу 3төн 16га чейин болушу керек';
                  }
                  return null;
                },
              ),

              // Сыр сөз
              _buildTextField(
                label: 'Сыр сөз',
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 8 || value.length > 16) {
                    return 'Сыр сөздүн узундугу 8 ден 16га чейин болушу керек';
                  }
                  return null;
                },
              ),

              // Сыр сөздү кайра жазыңыз
              _buildTextField(
                label: 'Сыр сөздү кайрадан жазыңыз',
                controller: _confirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Сыр сөздөр дал келиши керек';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              // Катталуу баскычы (Сүрөттө көрүнбөйт, бирок логика үчүн керек)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Эгер формадагы бардык validator'лор 'null' кайтарса гана true болот
                    if (_formKey.currentState!.validate()) {
                      // Каттоо логикасын улантуу
                      print("Баары туура!");
                    } else {
                      // Экранда кызыл каталар пайда болот
                      print("Каталарды оңдоңуз");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Катталуу',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Aккаунт жокбу? Катталыңыз',
                style: TextStyle(color: AppColors.primary),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Кайталанма TextField виджети
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool obscureText = false,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
        ),
        validator: validator,
        autovalidateMode:
            AutovalidateMode.onUserInteraction, // Жазып жатканда текшерүү
      ),
    );
  }
}
