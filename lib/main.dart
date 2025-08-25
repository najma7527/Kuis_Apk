import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kuis_screen.dart';
import 'kuis_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool Blue Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0A1E3C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A3B6C),
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A3B6C), Color(0xFF0A1E3C), Color(0xFF051224)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[900]!.withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(Icons.quiz, size: 100, color: Colors.white),
              ),
              const SizedBox(height: 30),

              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                ).createShader(bounds),
                child: Text(
                  "BLUE QUIZ",
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "${questions.length} Pertanyaan Menantang",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.blue[200],
                ),
              ),

              const SizedBox(height: 50),

              _buildGradientButton(
                context: context,
                text: "MULAI KUIS",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(questions: questions),
                    ),
                  );
                },
                colors: const [Color(0xFF00B4DB), Color(0xFF0083B0)],
              ),

              const SizedBox(height: 20),

              _buildGradientButton(
                context: context,
                text: "KUIS CEPAT (5 SOAL)",
                onPressed: () {
                  final randomQuestions = getRandomQuestions(5);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          QuizScreen(questions: randomQuestions),
                    ),
                  );
                },
                colors: const [Color(0xFF667EEA), Color(0xFF764BA2)],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    required List<Color> colors,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: colors[0].withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
