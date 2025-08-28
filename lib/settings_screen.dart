// File: settings_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_screen.dart';
import 'help_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool _soundEffects = true;
  // bool _notifications = true;
  // bool _darkMode = true;

  @override
  void initState() {
    super.initState();
    // _loadSettings();
  }

  // void _loadSettings() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _soundEffects = prefs.getBool('soundEffects') ?? true;
  //     _notifications = prefs.getBool('notifications') ?? true;
  //     _darkMode = prefs.getBool('darkMode') ?? true;
  //   });
  // }

  void _saveSettings(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<void> _resetSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // setState(() {
    //   _soundEffects = true;
    //   _notifications = true;
    //   _darkMode = true;
    // });
  }

  Future<void> _shareApp() async {
    await Share.share(
      'Yuk coba aplikasi Blue Quiz!\n\nDownload di: https://play.google.com/store/apps/details?id=com.example.bluequiz',
      subject: 'Bagikan Aplikasi Blue Quiz',
    );
  }

  Future<void> _contactUs() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'info@bluequiz.com',
      query: 'subject=Feedback Blue Quiz&body=Halo tim Blue Quiz,',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak bisa membuka aplikasi email')),
      );
    }
  }

  // 👉 Navigasi ke halaman Tentang
  void _goToAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutScreen()),
    );
  }

  // 👉 Navigasi ke halaman Bantuan
  void _goToHelp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HelpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1E3C),
      appBar: AppBar(
        title: Text(
          "PENGATURAN",
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3A8A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildActionItem(
                      Icons.share,
                      "Bagikan Aplikasi",
                      _shareApp,
                    ),
                    const Divider(color: Colors.blueGrey),
                    _buildActionItem(Icons.email, "Hubungi Kami", _contactUs),
                    const Divider(color: Colors.blueGrey),
                    _buildActionItem(Icons.help, "Bantuan", _goToHelp),
                    const Divider(color: Colors.blueGrey),
                    _buildActionItem(Icons.info, "Tentang", _goToAbout),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
    IconData icon,
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[100]),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(color: Colors.blue[100], fontSize: 12),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue,
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[100]),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.blue,
        size: 16,
      ),
      onTap: onTap,
    );
  }
}
