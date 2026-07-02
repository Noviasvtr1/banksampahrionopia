import 'package:flutter/material.dart';

class HadiahPage extends StatelessWidget {
  // Daftar hadiah dan gambar
  final List<Map<String, dynamic>> hadiahList = [
    {
      'nama': 'Voucher 50K',
      'gambar': 'assets/images/voucher.PNG',
      'deskripsi': 'Voucher belanja senilai 50.000 yang dapat digunakan di berbagai toko mitra pilihan. Cocok untuk berbelanja kebutuhan sehari-hari atau barang favorit Anda.',
      'poin': 500,
    },
    {
      'nama': 'Botol Minum',
      'gambar': 'assets/images/botol.PNG',
      'deskripsi': 'Botol minum eco-friendly yang dapat digunakan kembali, stylish, dan tahan lama. Ideal untuk mengurangi penggunaan botol plastik sekali pakai.',
      'poin': 300,
    },
    {
      'nama': 'Paket Donasi',
      'gambar': 'assets/images/donasi.PNG',
      'deskripsi': 'Kontribusi Anda untuk mendukung program lingkungan dan pengelolaan sampah. Donasi ini akan disalurkan ke program-program pelestarian lingkungan.',
      'poin': 700,
    },
    {
      'nama': 'Totebag',
      'gambar': 'assets/images/totebag.PNG',
      'deskripsi': 'Tas tote ramah lingkungan yang dibuat dari bahan daur ulang. Cocok untuk kebutuhan sehari-hari dan membantu mengurangi penggunaan kantong plastik.',
      'poin': 250,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Hadiah'),
        backgroundColor: Colors.purple, // Warna AppBar yang sama
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0), // Menambahkan padding di sekitar ListView
          itemCount: hadiahList.length + 1, // Menambahkan satu untuk tulisan REWARD
          itemBuilder: (context, index) {
            if (index == 0) {
              // Menampilkan tulisan REWARD di atas daftar hadiah
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding yang pas
                decoration: BoxDecoration(
                  color: Colors.purple[200],
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                alignment: Alignment.center, // Center alignment
                child: Text(
                  'REWARD',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24, // Ukuran font yang lebih besar
                    fontFamily: 'Roboto', // Ganti dengan font yang diinginkan
                  ),
                ),
              );
            }

            final hadiah = hadiahList[index - 1]; // Mengambil hadiah berdasarkan index
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Gambar hadiah
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(hadiah['gambar']!), // Mengambil gambar dari daftar
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nama hadiah
                          Text(
                            hadiah['nama']!, // Mengambil nama dari daftar
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          // Deskripsi hadiah
                          Text(
                            hadiah['deskripsi']!, // Mengambil deskripsi dari daftar
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Poin
                          Text(
                            'Poin: ${hadiah['poin']}', // Mengambil poin dari daftar
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Tombol tukar
                          ElevatedButton(
                            onPressed: () {
                              // Aksi saat tombol ditekan
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${hadiah['nama']} ditukar!')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple[200], // Mengubah warna tombol menjadi pink
                            ),
                            child: Text('Tukar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}