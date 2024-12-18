import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    Future.delayed(const Duration(seconds: 2), () {
      if (authController.user.value != null) {
        Get.offAllNamed('/navigation');
      } else {
        Get.offAllNamed('/login');
      }
    });

    return const Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 1,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Carregando...",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
