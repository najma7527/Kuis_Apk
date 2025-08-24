// BANK SOAL KUIS - SIMPAN SEMUA PERTANYAAN DI SINI
class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

// KUMPULAN SOAL KUIS
List<Question> questions = [
  // Soal Matematika
  Question(
    questionText: "2 + 2 × 2 = ?",
    options: ["6", "8", "4", "10"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Apa hasil dari 5²?",
    options: ["25", "10", "15", "20"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Berapa ¼ dari 100?",
    options: ["25", "50", "75", "100"],
    correctAnswerIndex: 0,
  ),

  // Soal Umum
  Question(
    questionText: "Apa ibu kota Indonesia?",
    options: ["Jakarta", "Bandung", "Surabaya", "Medan"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Siapa presiden pertama Indonesia?",
    options: ["Soekarno", "Soeharto", "Habibie", "Megawati"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Bulan apa Indonesia merdeka?",
    options: ["Agustus", "Juni", "April", "Desember"],
    correctAnswerIndex: 0,
  ),

  // Soal Bahasa Inggris
  Question(
    questionText: "What is the capital of France?",
    options: ["Paris", "London", "Berlin", "Madrid"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Synonym of 'happy'?",
    options: ["Joyful", "Sad", "Angry", "Tired"],
    correctAnswerIndex: 0,
  ),

  // Soal Sains
  Question(
    questionText: "Planet terdekat dari Matahari?",
    options: ["Merkurius", "Venus", "Bumi", "Mars"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Air terdiri dari unsur...",
    options: ["H₂O", "O₂", "CO₂", "N₂"],
    correctAnswerIndex: 0,
  ),
];

// Fungsi untuk mendapatkan soal acak (opsional)
List<Question> getRandomQuestions(int count) {
  questions.shuffle(); // Acak urutan soal
  return questions.take(count).toList();
}
