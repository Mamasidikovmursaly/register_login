import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: AppColors.primaryBlue,
              child: Icon(Icons.school,size: 60,color: Colors.white,),
            ),
            SizedBox(height: 20,),
            Image.asset(
              'images/assets/imalem.png',
              width: 150,
              height: 50,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8,),
            Text(
              'doorgo kosh kelding',
              style: TextStyle(color: AppColors.grayText),
            ),
            SizedBox(height: 15,),
            Text(
              'Logo',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Syr Soz',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'sddffbdf',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'register');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )),
                 child: Text(
                  'kiruu',
                  style: TextStyle(color: Colors.white,fontSize: 18),
                )),
            ),
            TextButton(
              onPressed: (){}, 
              child: Text(
                'akountunuz',
                style: TextStyle(color: AppColors.primaryBlue),
              ))
          ],
        ),
      ),
    );
  }
}