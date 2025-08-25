import 'package:flutter/material.dart';

class NotificationHelper {
  static void showCorrectNotification(
    BuildContext context,
    String correctAnswer,
    String userName,
  ) {
    _showNotification(
      context,
      "✅ BENAR!",
      "$userName kamu menjawab dengan tepat!",
      Colors.green,
      Icons.check_circle,
    );
  }

  static void showWrongNotification(
    BuildContext context,
    String correctAnswer,
    String userName,
  ) {
    _showNotification(
      context,
      "❌ SALAH",
      "$userName, jawaban benar: $correctAnswer , ayo belajar lebuh keras lagi",
      Colors.red,
      Icons.error,
    );
  }

  static void showResultNotification(
    BuildContext context,
    int score,
    int total,
    String userName,
  ) {
    final percentage = (score / total * 100).round();
    String title;
    String message;
    Color color;

    if (percentage >= 80) {
      title = "🎉 $userName kamu LUAR BIASA! ";
      message = "Skor: $score/$total ($percentage%)";
      color = Colors.green;
    } else if (percentage >= 70) {
      title = "👍 $userName KAMU MENJAWAB DENGAN BAGUS!";
      message = "Skor: $score/$total ($percentage%)";
      color = Colors.blue;
    } else {
      title = "💪 $userName AYO TERUS COBA!";
      message = "Skor: $score/$total ($percentage%)";
      color = Colors.orange;
    }

    _showNotification(context, title, message, color, Icons.emoji_events);
  }

  static void _showNotification(
    BuildContext context,
    String title,
    String message,
    Color color,
    IconData icon,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
