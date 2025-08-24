class QuizShuffler {
  static (List<String>, int) shuffleOptions(
    List<String> options,
    int correctIndex,
  ) {
    // Simpan jawaban benar
    final correctAnswer = options[correctIndex];

    // Acak opsi
    final shuffledOptions = List<String>.from(options);
    shuffledOptions.shuffle();

    // Cari index yang benar setelah diacak
    final newCorrectIndex = shuffledOptions.indexOf(correctAnswer);

    return (shuffledOptions, newCorrectIndex);
  }
}
