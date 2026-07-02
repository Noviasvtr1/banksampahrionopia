import 'package:flutter/material.dart';
import 'hadiah.dart';
import 'jadwal.dart'; // Impor halaman JadwalPage
import 'kalkulator.dart'; // Impor halaman KalkulatorSampah
import 'edukasi.dart'; // Impor halaman EdukasiPage
import 'layanan.dart'; // Impor halaman LayananPage

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: Colors.purple, // Ganti warna AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ikon Profil dan Username
              Row(
                children: [
                  CircleAvatar(
                    radius: 40, // Ukuran ikon profil
                    backgroundImage: AssetImage('assets/images/pp.jpeg'), // Ganti dengan ikon profil Anda
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rio', // Ganti dengan username pengguna
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const Text(
                        'Jumlah Poin: 999999', // Ganti dengan jumlah poin pengguna
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.card_giftcard, color: Colors.white), // Ganti warna ikon
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HadiahPage()), // Ganti dengan HadiahPage
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Tombol-tombol dalam Card
              Expanded(
                child: ListView(
                  children: [
                    // Tombol Jadwal Penjemputan
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: const Text('Jadwal Penjemputan'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JadwalPage()),
                          );
                        },
                      ),
                    ),
                    // Tombol Kalkulator Sampah
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: const Text('Kalkulator Sampah'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => KalkulatorSampah()),
                          );
                        },
                      ),
                    ),
                    // Tombol Edukasi
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: const Text('Edukasi dan Informasi'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EdukasiPage()),
                          );
                        },
                      ),
                    ),
                    // Tombol Layanan
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: const Text('Layanan Pelanggan'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LayananPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}