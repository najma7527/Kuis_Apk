class QuizShuffler {
  static (List<String>, int) shuffleOptions(
    List<String> options,
    int correctIndex,
  ) {
    final correctAnswer = options[correctIndex];

    final shuffledOptions = List<String>.from(options);
    shuffledOptions.shuffle();

    final newCorrectIndex = shuffledOptions.indexOf(correctAnswer);

    return (shuffledOptions, newCorrectIndex);
  }
}
