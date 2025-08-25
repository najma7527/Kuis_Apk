class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String category;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    this.category = "Umum",
  });

  List<String> getShuffledOptions() {
    final shuffled = List<String>.from(options);
    shuffled.shuffle();
    return shuffled;
  }

  int getCorrectIndexAfterShuffle(List<String> shuffledOptions) {
    return shuffledOptions.indexOf(options[correctAnswerIndex]);
  }
}

List<Question> questions = [
  Question(
    questionText: "2 + 2 × 2 = ?",
    options: ["6", "8", "4", "10"],
    correctAnswerIndex: 0,
    category: "Matematika",
  ),
  Question(
    questionText: "Apa hasil dari 5²?",
    options: ["10", "25", "15", "20"],
    correctAnswerIndex: 1,
    category: "Matematika",
  ),
  Question(
    questionText: "Apa ibu kota Indonesia?",
    options: ["Bandung", "Jakarta", "Surabaya", "Medan"],
    correctAnswerIndex: 1,
    category: "Geografi",
  ),
  Question(
    questionText: "Siapa presiden pertama Indonesia?",
    options: ["Soeharto", "Habibie", "Soekarno", "Megawati"],
    correctAnswerIndex: 2,
    category: "Sejarah",
  ),
  Question(
    questionText: "Planet terdekat dari Matahari?",
    options: ["Venus", "Bumi", "Merkurius", "Mars"],
    correctAnswerIndex: 2,
    category: "Sains",
  ),
  Question(
    questionText: "What is the capital of France?",
    options: ["London", "Berlin", "Paris", "Madrid"],
    correctAnswerIndex: 2,
    category: "Bahasa",
  ),
  Question(
    questionText: "Berapa ¼ dari 100?",
    options: ["50", "25", "75", "100"],
    correctAnswerIndex: 1,
    category: "Matematika",
  ),
  Question(
    questionText: "Bulan apa Indonesia merdeka?",
    options: ["Juni", "Agustus", "April", "Desember"],
    correctAnswerIndex: 1,
    category: "Sejarah",
  ),
];

List<Question> getRandomQuestions(int count) {
  questions.shuffle();
  return questions.take(count).toList();
}
