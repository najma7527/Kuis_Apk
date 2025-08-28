import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'kuis_data.dart';
import 'utils/quiz_shuffler.dart';
import 'utils/notification_helper.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  final String userName;

  const QuizScreen({
    super.key,
    required this.questions,
    this.userName = 'Pemain',
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex;
  bool showResult = false;
  List<String> currentOptions = [];
  int currentCorrectIndex = 0;
  DateTime? _quizStartTime;

  @override
  void initState() {
    super.initState();
    _quizStartTime = DateTime.now();
    _loadCurrentQuestion();
  }

  void _loadCurrentQuestion() {
    final question = widget.questions[currentQuestionIndex];
    final (shuffledOptions, correctIndex) = QuizShuffler.shuffleOptions(
      question.options,
      question.correctAnswerIndex,
    );

    setState(() {
      currentOptions = shuffledOptions;
      currentCorrectIndex = correctIndex;
    });
  }

  Future<void> _updateAchievements(
    int score,
    int totalQuestions,
    String category,
    int completionTimeInSeconds,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    // Update total quizzes completed
    final totalQuizzesCompleted =
        (prefs.getInt('totalQuizzesCompleted') ?? 0) + 1;
    await prefs.setInt('totalQuizzesCompleted', totalQuizzesCompleted);

    // Update perfect scores
    if (score == totalQuestions) {
      final perfectScores = (prefs.getInt('perfectScores') ?? 0) + 1;
      await prefs.setInt('perfectScores', perfectScores);
    }

    // Update categories completed
    final categoriesCompleted =
        prefs.getStringList('categoriesCompleted') ?? [];
    if (!categoriesCompleted.contains(category)) {
      categoriesCompleted.add(category);
      await prefs.setStringList('categoriesCompleted', categoriesCompleted);
    }

    // Update consecutive correct answers
    final currentConsecutive = prefs.getInt('consecutiveCorrectAnswers') ?? 0;
    final newConsecutive = currentConsecutive + score;
    await prefs.setInt('consecutiveCorrectAnswers', newConsecutive);

    // Update fastest completion time (if applicable)
    final fastestTimeKey = 'fastestTime_$category';
    final currentFastestTime = prefs.getInt(fastestTimeKey);
    if (currentFastestTime == null ||
        completionTimeInSeconds < currentFastestTime) {
      await prefs.setInt(fastestTimeKey, completionTimeInSeconds);
    }
  }

  void answerQuestion(int index) async {
    setState(() {
      selectedAnswerIndex = index;

      if (index == currentCorrectIndex) {
        score++;
        NotificationHelper.showCorrectNotification(
          context,
          currentOptions[currentCorrectIndex],
          widget.userName,
        );
      } else {
        NotificationHelper.showWrongNotification(
          context,
          currentOptions[currentCorrectIndex],
          widget.userName,
        );
      }
    });

    Future.delayed(const Duration(milliseconds: 1800), () {
      if (currentQuestionIndex < widget.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswerIndex = null;
          _loadCurrentQuestion();
        });
      } else {
        // Calculate completion time
        final completionTime = DateTime.now()
            .difference(_quizStartTime!)
            .inSeconds;

        NotificationHelper.showResultNotification(
          context,
          score,
          widget.questions.length,
          widget.userName,
        );

        // Update achievements
        _updateAchievements(
          score,
          widget.questions.length,
          widget.questions[0].category,
          completionTime,
        );

        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            showResult = true;
          });
        });
      }
    });
  }

  Color getOptionColor(int index) {
    if (selectedAnswerIndex == null) return const Color(0xFF2C5282);

    if (index == currentCorrectIndex) {
      return const Color(0xFF48BB78);
    } else if (index == selectedAnswerIndex) {
      return const Color(0xFFF56565);
    }
    return const Color(0xFF2C5282);
  }

  IconData getOptionIcon(int index) {
    if (selectedAnswerIndex == null) return Icons.circle_outlined;

    if (index == currentCorrectIndex) {
      return Icons.check_circle;
    } else if (index == selectedAnswerIndex) {
      return Icons.cancel;
    }
    return Icons.circle_outlined;
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      return _buildResultScreen();
    }

    final question = widget.questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF0A1E3C),
      appBar: AppBar(
        title: Text(
          "SOAL ${currentQuestionIndex + 1}/${widget.questions.length}",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1A3B6C),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A3B6C), Color(0xFF0A1E3C)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFF2C5282),
                ),
                child: Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) => Container(
                        width:
                            constraints.maxWidth *
                            ((currentQuestionIndex + 1) /
                                widget.questions.length),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage("assets/1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  question.category,
                  style: GoogleFonts.poppins(
                    color: Colors.blue[100],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3A8A),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  question.questionText,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: currentOptions.length,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: selectedAnswerIndex == null
                              ? () => answerQuestion(index)
                              : null,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: getOptionColor(index),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  getOptionIcon(index),
                                  color: Colors.white,
                                  size: 24,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    currentOptions[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A3B6C),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skor Saat Ini:",
                      style: GoogleFonts.poppins(
                        color: Colors.blue[100],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "$score",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    final percentage = (score / widget.questions.length * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFF0A1E3C),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A3B6C), Color(0xFF0A1E3C)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    percentage >= 60 ? Icons.emoji_events : Icons.school,
                    size: 60,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  percentage >= 60 ? "SELAMAT!" : "TERIMA KASIH!",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E3A8A),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "SKOR AKHIR",
                        style: GoogleFonts.poppins(
                          color: Colors.blue[100],
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "$score/${widget.questions.length}",
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "($percentage%)",
                        style: GoogleFonts.poppins(
                          color: Colors.blue[200],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  _getResultMessage(percentage, widget.userName),
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.blue[100],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF667EEA).withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "SELESAI",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getResultMessage(int percentage, String userName) {
    if (percentage >= 90)
      return "Luar biasa! $userName Kamu benar-benar menguasai materi! 🎯";
    if (percentage >= 75) return "Hebat! Hasil yang sangat memuaskan! ⭐";
    if (percentage >= 60)
      return "Bagus! semangat $userName! ayo belajar lagi untuk hasil yang lebih baik! 👍";
    if (percentage >= 40) return "Lumayan! Terus belajar dan berlatih! 📚";
    return "Jangan menyerah $userName! Setiap kegagalan adalah pelajaran yang menjadikan kamu lebih baik! 💪";
  }
}
