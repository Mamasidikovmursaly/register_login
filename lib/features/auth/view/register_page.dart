import "package:flutter/material.dart";
import "../../../core/constants/app_colors.dart";

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. AppBar - артка кайтуу иконкасы менен
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent, // Скроллдо түс өзгөрбөйт
        leading: IconButton(
          splashColor: Colors.transparent, // Көлөкө калбашы үчүн
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // 2. Негизги бөлүк
      body: SingleChildScrollView(
        // Эгер экран жылбасын десеңиз NeverScrollable калтырыңыз
        physics: const NeverScrollableScrollPhysics(), 
        child: Padding(
          // vertical боштукту 0 кылдык, мазмун эң өйдө жайгашат
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0.0),
          child: Column(
            children: [
              // 1. Логотип (Скриншоттогудай көк тегерек жана ак иконка)
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primaryBlue,
                child: const Icon(
                  Icons.school, 
                  size: 60, // Иконканы чоңойттук
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),

              // 2. Башкы тексттер
              const Text(
                'Катталуу',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Төмөндөгү маалыматты толтуруңуз',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // 3. Маалымат толтуруучу талаалар (TextFields)
              const TextField(
                decoration: InputDecoration(
                  labelText: "Аты",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Фамилия',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                // Телефон номери жашыруун болбошу керек (obscureText алып салынды)
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Телефон номери',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Логин',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Сыр сөз',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Сыр сөздү кайрадан жазыңыз',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // 4. Катталуу баскычы
              SizedBox(
                width: double.infinity,
                height: 55, // Бир аз бийиктик коштук
                child: ElevatedButton(
                  onPressed: () {
                    // Каттоо логикасы ушул жерге жазылат
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Катталуу",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // 5. Төмөнкү өтүү баскычы
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Аккаунтуңуз барбы? Кириңиз',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

