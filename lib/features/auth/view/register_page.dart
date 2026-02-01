import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0,),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primaryBlue,
                child: const Icon(Icons.school,
                size: 60,
                color:Colors.white),
              ),
              const SizedBox(height: 15,),
              const Text(
                'katalu',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
                color: Colors.black),
              ),
              const SizedBox(height: 8,),
              const Text(
                'totmndogu malymst',
                style: TextStyle(fontSize: 14,
                color: Colors.grey),
              ),
              const SizedBox(height: 15,),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Aty',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'cdsfgsgfdb',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                 labelText: 'shfdsfd',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'sdgfdshfdafga',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'ttttt',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'sdgdfgdbdfs',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10)
                    )),
                   child: Text('katalu',
                   style: TextStyle(color: Colors.white,
                   fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
              TextButton(
                onPressed: () {}, 
                child: Text('akaun',
                style: TextStyle(color: AppColors.primaryBlue),))
            ],
          ), 
        ),
      ),
    );
  }
}
