import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kuis_data.dart';
import 'kuis_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Fungsi untuk mendapatkan nama pengguna dari registrasi
  Future<String> _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName') ??
        'Pemain'; // Default ke 'Pemain' jika tidak ada
  }

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
                  decoration: TextDecoration.none,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${questions.length} Pertanyaan Menantang",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.blue[200],
                decoration: TextDecoration.none,
              ),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () async {
                // Dapatkan nama dari registrasi
                final userName = await _getUserName();

                // Navigasi langsung ke halaman kuis
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuizScreen(questions: questions, userName: userName),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(171, 26, 8, 187),
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
              onPressed: () async {
                // Dapatkan nama dari registrasi
                final userName = await _getUserName();
                final randomQuestions = getRandomQuestions(5);

                // Navigasi langsung ke halaman kuis
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      questions: randomQuestions,
                      userName: userName,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(171, 26, 8, 187),
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
              child: const Text("Kuis Cepat (5 Soal)"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
