// File: achievements_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  late Map<String, dynamic> achievements;
  int totalQuizzesCompleted = 0;
  int perfectScores = 0;
  int consecutiveCorrectAnswers = 0;
  int fastestQuizTime = 0;
  Set<String> categoriesCompleted = {};
  int totalQuizzes = 0;

  @override
  void initState() {
    super.initState();
    _loadAchievements();
  }

  void _loadAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      totalQuizzesCompleted = prefs.getInt('totalQuizzesCompleted') ?? 0;
      perfectScores = prefs.getInt('perfectScores') ?? 0;
      consecutiveCorrectAnswers =
          prefs.getInt('consecutiveCorrectAnswers') ?? 0;
      fastestQuizTime = prefs.getInt('fastestQuizTime') ?? 0;
      categoriesCompleted =
          prefs.getStringList('categoriesCompleted')?.toSet() ?? {};
      totalQuizzes = prefs.getInt('totalQuizzes') ?? 0;
    });
  }

  List<Achievement> _getAchievements() {
    return [
      Achievement(
        id: 'beginner',
        title: "Pemula",
        description: "Selesaikan 1 kuis",
        icon: Icons.star,
        achieved: totalQuizzesCompleted >= 1,
        progress: totalQuizzesCompleted >= 1 ? 1.0 : totalQuizzesCompleted / 1,
      ),
      Achievement(
        id: 'expert',
        title: "Ahli",
        description: "Dapatkan skor 100%",
        icon: Icons.emoji_events,
        achieved: perfectScores >= 1,
        progress: perfectScores >= 1 ? 1.0 : perfectScores / 1,
      ),
      Achievement(
        id: 'genius',
        title: "Jenius",
        description: "Jawab 10 soal benar berturut-turut",
        icon: Icons.lightbulb,
        achieved: consecutiveCorrectAnswers >= 10,
        progress: consecutiveCorrectAnswers >= 10
            ? 1.0
            : consecutiveCorrectAnswers / 10,
      ),
      Achievement(
        id: 'speedster',
        title: "Cepat",
        description: "Selesaikan kuis dalam 1 menit",
        icon: Icons.speed,
        achieved: fastestQuizTime > 0 && fastestQuizTime <= 60,
        progress: fastestQuizTime > 0 && fastestQuizTime <= 60 ? 1.0 : 0.0,
      ),
      Achievement(
        id: 'explorer',
        title: "Penjelajah",
        description: "Coba semua kategori",
        icon: Icons.explore,
        achieved: categoriesCompleted.length >= 5, // Asumsi ada 5 kategori
        progress: categoriesCompleted.length >= 5
            ? 1.0
            : categoriesCompleted.length / 5,
      ),
      Achievement(
        id: 'veteran',
        title: "Veteran",
        description: "Selesaikan 10 kuis",
        icon: Icons.military_tech,
        achieved: totalQuizzesCompleted >= 10,
        progress: totalQuizzesCompleted >= 10
            ? 1.0
            : totalQuizzesCompleted / 10,
      ),
    ];
  }

  int get _completedAchievementsCount {
    return _getAchievements()
        .where((achievement) => achievement.achieved)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    final achievements = _getAchievements();
    final completedCount = _completedAchievementsCount;
    final totalCount = achievements.length;

    return Scaffold(
      backgroundColor: const Color(0xFF0A1E3C),
      appBar: AppBar(
        title: Text(
          "PENCAPAIAN",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1A3B6C),
        elevation: 0,
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.pop(context),
        // ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
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
                      "Total Pencapaian: $completedCount/$totalCount",
                      style: GoogleFonts.poppins(
                        color: Colors.blue[100],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: completedCount / totalCount,
                      backgroundColor: Colors.blueGrey,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Kuis Diselesaikan: $totalQuizzesCompleted",
                      style: GoogleFonts.poppins(
                        color: Colors.blue[100],
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Skor Sempurna: $perfectScores",
                      style: GoogleFonts.poppins(
                        color: Colors.blue[100],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: achievements.map((achievement) {
                    return _buildAchievementCard(achievement);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementCard(Achievement achievement) {
    return Container(
      decoration: BoxDecoration(
        color: achievement.achieved
            ? const Color(0xFF1E3A8A)
            : Colors.blueGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: achievement.achieved
                ? Colors.blue.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                achievement.icon,
                size: 40,
                color: achievement.achieved ? Colors.blue[100] : Colors.grey,
              ),
              if (!achievement.achieved && achievement.progress > 0)
                CircularProgressIndicator(
                  value: achievement.progress,
                  backgroundColor: Colors.grey[800],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 3,
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            achievement.title,
            style: GoogleFonts.poppins(
              color: achievement.achieved ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              achievement.description,
              style: GoogleFonts.poppins(
                color: achievement.achieved ? Colors.blue[100] : Colors.grey,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          if (achievement.achieved)
            Icon(Icons.check_circle, color: Colors.green[300], size: 20)
          else
            Icon(Icons.lock, color: Colors.grey[500], size: 20),
        ],
      ),
    );
  }
}

class Achievement {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final bool achieved;
  final double progress;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.achieved,
    required this.progress,
  });
}
