import 'package:flutter/material.dart';
import 'daftar.dart'; // Pastikan untuk mengimpor halaman daftar
import 'profil.dart'; // Pastikan untuk mengimpor halaman profil

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false; // Variabel untuk mengontrol visibilitas password
  final TextEditingController _usernameController = TextEditingController(); // Controller untuk username
  final TextEditingController _passwordController = TextEditingController(); // Controller untuk password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon Akun
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),

                // Kotak untuk Username
                TextField(
                  controller: _usernameController, // Menggunakan controller
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Kotak untuk Password
                TextField(
                  controller: _passwordController, // Menggunakan controller
                  obscureText: !_isPasswordVisible, // Mengatur visibilitas password
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible; // Toggle visibilitas
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol Login
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk login
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    // Di sini Anda bisa menambahkan logika untuk memverifikasi username dan password
                    // Misalnya, Anda bisa memeriksa dengan API atau database

                    if (username == 'rio' && password == '123456') { // Contoh validasi
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilPage()), // Navigasi ke halaman profil
                      );
                    } else {
                      // Tampilkan pesan kesalahan jika login gagal
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Username atau password salah')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  child: const Text('Login Now'),
                ),
                const SizedBox(height: 20), // Jarak antara tombol login dan daftar

                // Tombol Daftar
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DaftarPage()), // Ganti dengan nama halaman daftar Anda
                    );
                  },
                  child: const Text(
                    'Belum punya akun? Daftar di sini ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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