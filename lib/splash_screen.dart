import 'package:flutter/material.dart';
import 'login_page.dart';
import 'kuis_data.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Setup animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Setup animations
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
        );

    // Start animations
    _controller.forward();

    // Navigate after delay - VERSI ALTERNATIF
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(26, 59, 108, 1),
              Color(0xFF0A1E3C),
              Color(0xFF051224),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated icon with scale and fade
              ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Icon(Icons.quiz, size: 80, color: Colors.white),
                ),
              ),

              const SizedBox(height: 30),

              // Animated title with slide and fade
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'BLUE QUIZ',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Animated subtitle with slide and fade
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    '${questions.length} Pertanyaan Menantang',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white70,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Pulsating loading indicator
              FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
                    ),
                  ),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.8),
                    ),
                    strokeWidth: 3.0,
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
