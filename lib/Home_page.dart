import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kuis_data.dart';
import 'screens/nama_input_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.blue[200]),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NameInputScreen(
                      questions: questions,
                      isQuickQuiz: false,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(171, 17, 5, 126),
                shadowColor: const Color.fromARGB(171, 17, 5, 126),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Mulai Kuis"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final randomQuestions = getRandomQuestions(5);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NameInputScreen(
                      questions: randomQuestions,
                      isQuickQuiz: true,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(171, 26, 8, 187),
                shadowColor: const Color.fromARGB(134, 22, 20, 163),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Kuis Cepat (5 Soal)"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
