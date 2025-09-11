import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1E3C),
      appBar: AppBar(
        title: Text(
          "BANTUAN",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1A3B6C),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cara Bermain",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildInstructionStep(
                      1,
                      "Pilih mode kuis: Seluruh soal, kuis cepat (5 soal), atau berdasarkan kategori",
                    ),
                    _buildInstructionStep(2, "Baca pertanyaan dengan seksama"),
                    _buildInstructionStep(
                      3,
                      "Pilih jawaban yang menurut Anda benar",
                    ),
                    _buildInstructionStep(
                      4,
                      "Lihat notifikasi yang muncul untuk mengetahui jawaban benar/salah",
                    ),
                    _buildInstructionStep(
                      5,
                      "Lanjut ke soal berikutnya hingga selesai",
                    ),
                    _buildInstructionStep(
                      6,
                      "Lihat skor akhir dan persentase jawaban benar",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Tips",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3A8A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "• Baca setiap pertanyaan dengan teliti\n"
                  "• Perhatikan kategori soal untuk membantu pemahaman\n"
                  "• Jika tidak yakin, tebaklah - tidak ada penalti untuk jawaban salah\n"
                  "• Latihan secara teratur akan meningkatkan skor Anda",
                  style: GoogleFonts.poppins(
                    color: Colors.blue[100],
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionStep(int step, String instruction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3A8A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blue[800],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step.toString(),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              instruction,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
