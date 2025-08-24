import 'package:flutter/material.dart';
import 'kuis_data.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizScreen({super.key, required this.questions});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex;
  bool showResult = false;

  Question get currentQuestion => widget.questions[currentQuestionIndex];

  void answerQuestion(int index) {
    setState(() {
      selectedAnswerIndex = index;
      if (index == currentQuestion.correctAnswerIndex) {
        score++;
      }
    });

    // Otomatis lanjut setelah 1 detik
    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestionIndex < widget.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswerIndex = null;
        });
      } else {
        setState(() {
          showResult = true;
        });
      }
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      selectedAnswerIndex = null;
      showResult = false;
    });
  }

  Color getOptionColor(int index) {
    if (selectedAnswerIndex == null) return Colors.blue;

    if (index == currentQuestion.correctAnswerIndex) {
      return Colors.green;
    } else if (index == selectedAnswerIndex) {
      return Colors.red;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      return _buildResultScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Soal ${currentQuestionIndex + 1}/${widget.questions.length}",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.questions.length,
            ),
            const SizedBox(height: 20),

            // Pertanyaan
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Pilihan Jawaban
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: selectedAnswerIndex == null
                          ? () => answerQuestion(index)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: getOptionColor(index),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        currentQuestion.options[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Skor Sementara
            Text(
              "Skor: $score",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    final percentage = (score / widget.questions.length * 100).round();

    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Kuis")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
              const SizedBox(height: 20),
              Text(
                "Skor Akhir:",
                style: TextStyle(fontSize: 24, color: Colors.grey[700]),
              ),
              Text(
                "$score/${widget.questions.length} ($percentage%)",
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                _getResultMessage(percentage),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke home
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                ),
                child: const Text("Selesai"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getResultMessage(int percentage) {
    if (percentage >= 80) return "Luar biasa! Kamu jenius! 🎯";
    if (percentage >= 60) return "Bagus! Hampir sempurna! 👍";
    if (percentage >= 40) return "Lumayan! Terus belajar! 📚";
    return "Jangan menyerah! Coba lagi! 💪";
  }
}
