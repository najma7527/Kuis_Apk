import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blue_quiz_sederhana/kuis_screen.dart';
import 'package:blue_quiz_sederhana/kuis_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameInputScreen extends StatefulWidget {
  final List<Question> questions;
  final bool isQuickQuiz;

  const NameInputScreen({
    super.key,
    required this.questions,
    this.isQuickQuiz = false,
  });

  @override
  State<NameInputScreen> createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Load saved name jika ada
    _loadSavedName();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _loadSavedName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedName = prefs.getString('userName') ?? '';
      setState(() {
        _nameController.text = savedName;
      });
    } catch (e) {
      print('Error loading saved name: $e');
    }
  }

  void _startQuiz() async {
    if (_formKey.currentState!.validate()) {
      final userName = _nameController.text.trim();

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', userName);
      } catch (e) {
        print('Error saving name: $e');
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              QuizScreen(questions: widget.questions, userName: userName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1E3C),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
            colors: [Color(0xFF1A3B6C), Color(0xFF0A1E3C), Color(0xFF051224)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
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
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                // Title
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                  ).createShader(bounds),
                  child: Text(
                    "MASUKKAN NAMA ANDA",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Subtitle
                Text(
                  widget.isQuickQuiz
                      ? "Kuis Cepat - ${widget.questions.length} Soal"
                      : "Seluruh Soal - ${widget.questions.length} Soal",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.blue[200],
                  ),
                ),

                const SizedBox(height: 40),

                // Form Input
                Form(
                  key: _formKey,
                  child: Container(
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
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Nama Anda',
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.blue[200],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color(0xFF00B4DB),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFF2C5282),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Silakan masukkan nama Anda';
                            }
                            if (value.trim().length < 2) {
                              return 'Nama minimal 2 karakter';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Start Button
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                            ),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00B4DB).withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _startQuiz,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: Text(
                              'MULAI KUIS',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
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

                const SizedBox(height: 20),

                // Skip Button (Optional)
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          questions: widget.questions,
                          userName: 'Pemain', // Default name
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Lewati dan main sebagai "Pemain"',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 71, 180, 253),
                      fontSize: 14,
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
}
