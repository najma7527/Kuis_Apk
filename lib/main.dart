import 'package:flutter/material.dart';
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
      title: 'Kuis Sederhana',
      theme: ThemeData(primarySwatch: Colors.blue),
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
      appBar: AppBar(title: const Text("Kuis Sederhana"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.quiz, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              "Selamat Datang!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Total soal: ${questions.length} pertanyaan",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(questions: questions),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Mulai Kuis"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ambil 5 soal acak
                final randomQuestions = getRandomQuestions(5);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuizScreen(questions: randomQuestions),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Kuis Cepat (5 Soal)"),
            ),
          ],
        ),
      ),
    );
  }
}
