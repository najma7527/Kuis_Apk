// File: categories_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kuis_data.dart';
import 'category_questions_screen.dart'; // Kita akan buat screen baru

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  Map<String, int> _getCategoryCounts() {
    Map<String, int> counts = {};
    for (var question in questions) {
      counts.update(question.category, (value) => value + 1, ifAbsent: () => 1);
    }
    return counts;
  }

  List<Question> _getQuestionsByCategory(String category) {
    return questions
        .where((question) => question.category == category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final categoryCounts = _getCategoryCounts();
    final categories = categoryCounts.keys.toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0A1E3C),
      appBar: AppBar(
        title: Text(
          "KATEGORI SOAL",
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
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final count = categoryCounts[category]!;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: const Color(0xFF1E3A8A),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.category, color: Colors.white),
                  ),
                  title: Text(
                    category,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "$count soal",
                    style: GoogleFonts.poppins(color: Colors.blue[100]),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                    size: 16,
                  ),
                  onTap: () {
                    final categoryQuestions = _getQuestionsByCategory(category);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryQuestionsScreen(
                          category: category,
                          questions: categoryQuestions,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
