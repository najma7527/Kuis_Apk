import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'constants.dart';
import 'help_screen.dart';
import 'settings_screen.dart';
import 'dart:convert';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEditing = false;
  bool _isLoading = false;
  bool _obscurePassword = true;

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      setState(() {
        _profileImage = File(pickedFile.path);
      });

      // Simpan base64 ke SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImageBase64', base64Image);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString(SharedPrefKeys.userName) ?? 'User';
    final userEmail =
        prefs.getString(SharedPrefKeys.userEmail) ?? 'user@example.com';
    final userPassword = prefs.getString('userPassword') ?? '';
    print('Loaded password: $userPassword');
    final base64Image = prefs.getString('profileImageBase64');

    if (base64Image != null) {
      final bytes = base64Decode(base64Image);
      final tempDir = Directory.systemTemp;
      final file = await File(
        '${tempDir.path}/profile.png',
      ).writeAsBytes(bytes);

      setState(() {
        _profileImage = file;
      });
    }

    setState(() {
      _nameController.text = userName;
      _emailController.text = userEmail;
      _passwordController.text = userPassword;
      _isLoading = false;
    });

    setState(() {
      _nameController.text = userName;
      _emailController.text = userEmail;
      _passwordController.text = userPassword;
      _isLoading = false;
    });
  }

  void _saveProfile() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nama tidak boleh kosong'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefKeys.userName, _nameController.text);
    await prefs.setString('userPassword', _passwordController.text);
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _isLoading = false;
      _isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profil berhasil diperbarui'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A1E3C),
      appBar: AppBar(
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF0A1E3C),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          if (_isEditing)
            IconButton(
              icon: Icon(Icons.save, color: Colors.white),
              onPressed: _isLoading ? null : _saveProfile,
            )
          else
            IconButton(
              icon: Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFF1E3A8A),
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : null,
                          child: _profileImage == null
                              ? Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        if (_isEditing)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Wrap(
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.photo_library),
                                        title: Text("Pilih dari Galeri"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _pickImage(ImageSource.gallery);
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text("Ambil dari Kamera"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _pickImage(ImageSource.camera);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(30, 58, 138, 1),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.white), // Warna teks putih
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      labelStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFF1E3A8A).withOpacity(0.5),
                      prefixIcon: Icon(Icons.person, color: Colors.white70),
                    ),
                    enabled: _isEditing,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white54,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: _isEditing
                          ? Color.fromRGBO(30, 58, 138, 1).withOpacity(0.5)
                          : Color(0xFF1E3A8A).withOpacity(0.3),
                      prefixIcon: Icon(Icons.lock, color: Colors.white70),
                      suffixIcon: _isEditing
                          ? IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            )
                          : null,
                    ),
                    enabled: _isEditing,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white54,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFF1E3A8A).withOpacity(0.3),
                      prefixIcon: Icon(Icons.email, color: Colors.white70),
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: 30),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1E3A8A).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.settings, color: Colors.white),
                          title: Text(
                            'Pengaturan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        ListTile(
                          leading: Icon(Icons.help, color: Colors.white),
                          title: Text(
                            'Bantuan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Konfirmasi Logout"),
                            content: Text("Apakah kamu yakin ingin logout?"),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, false), // batal
                                child: Text("Batal"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(
                                  context,
                                  true,
                                ), // setuju logout
                                child: Text(
                                  "Logout",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', false);

                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                      child: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF0A1E3C),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
