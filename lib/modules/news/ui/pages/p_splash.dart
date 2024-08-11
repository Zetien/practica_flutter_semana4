import 'package:flutter/material.dart';
import 'package:news_z/theme/theme_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    // Navegar a la HomeScreen después de la animación
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white, // Color de fondo del splash
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: FadeTransition(
            opacity: _animation,
            child: Image.asset(
              'assets/images/logo.png', // Asegúrate de tener un logo en la carpeta assets
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
