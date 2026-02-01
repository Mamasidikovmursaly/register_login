import "package:flutter/material.dart";
import "../../../core/constants/app_colors.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primaryBlue,
              child: Icon(Icons.school, size: 50, color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              'Доорго кош  келиңиз!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Сынак тапшыруу үчүн платформага кириниз',
              style: TextStyle(color: AppColors.grayText),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hintText: 'Логин',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Сыр сөз',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Кирүү',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Аккаунтуңуз жокпу? Катталыңыз',
                style: TextStyle(color: AppColors.primaryBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}