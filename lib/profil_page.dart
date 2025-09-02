import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isEditing = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load data pengguna (simulasi)
    _loadUserData();
  }

  // Fungsi untuk memuat data pengguna
  void _loadUserData() {
    // Data simulasi
    _nameController.text = 'John Doe';
    _emailController.text = 'john.doe@example.com';
  }

  // Fungsi untuk menyimpan perubahan profil
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

    // Simulasi proses penyimpanan
    await Future.delayed(Duration(seconds: 2));

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
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.blue,
        actions: [
          if (_isEditing)
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _isLoading ? null : _saveProfile,
            )
          else
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        if (_isEditing)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  // Fungsi untuk mengganti foto profil
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    enabled: _isEditing,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    enabled: false, // Email tidak bisa diubah
                  ),
                  SizedBox(height: 30),
                  ListTile(
                    leading: Icon(Icons.history, color: Colors.blue),
                    title: Text('Riwayat Kuis'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman riwayat kuis
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.blue),
                    title: Text('Pengaturan'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman pengaturan
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help, color: Colors.blue),
                    title: Text('Bantuan'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigasi ke halaman bantuan
                    },
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Fungsi logout
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('Logout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
