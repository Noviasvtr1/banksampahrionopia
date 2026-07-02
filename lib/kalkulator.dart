import 'package:flutter/material.dart';

class KalkulatorSampah extends StatefulWidget {
  @override
  _KalkulatorSampahState createState() => _KalkulatorSampahState();
}

class _KalkulatorSampahState extends State<KalkulatorSampah> {
  bool isPlastikChecked = false;
  bool isKertasChecked = false;
  bool isLogamChecked = false;
  bool isKacaChecked = false;

  final TextEditingController plastikController = TextEditingController();
  final TextEditingController kertasController = TextEditingController();
  final TextEditingController logamController = TextEditingController();
  final TextEditingController kacaController = TextEditingController();

  int totalPoin = 0;

  void hitungPoin() {
    int poin = 0;

    if (isPlastikChecked) {
      int jumlahPlastik = int.tryParse(plastikController.text) ?? 0;
      poin += jumlahPlastik * 10; // Plastik: 10 poin per kg
    }

    if (isKertasChecked) {
      int jumlahKertas = int.tryParse(kertasController.text) ?? 0;
      poin += jumlahKertas * 5; // Kertas: 5 poin per kg
    }

    if (isLogamChecked) {
      int jumlahLogam = int.tryParse(logamController.text) ?? 0;
      poin += jumlahLogam * 15; // Logam: 15 poin per kg
    }

    if (isKacaChecked) {
      int jumlahKaca = int.tryParse(kacaController.text) ?? 0;
      poin += jumlahKaca * 8; // Kaca: 8 poin per kg
    }

    setState(() {
      totalPoin = poin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Sampah'),
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
                const SizedBox(height: 20),

                // Checkbox dan TextField untuk Plastik
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.purple[100], // Warna ungu muda
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Plastik',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Teks hitam dan bold
                    ),
                    value: isPlastikChecked,
                    onChanged: (value) {
                      setState(() {
                        isPlastikChecked = value!;
                      });
                    },
                  ),
                ),
                if (isPlastikChecked)
                  TextField(
                    controller: plastikController,
                    decoration: InputDecoration(
                      labelText: 'Jumlah (kg)',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),

                // Checkbox dan TextField untuk Kertas
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.purple[100], // Warna ungu muda
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Kertas',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Teks hitam dan bold
                    ),
                    value: isKertasChecked,
                    onChanged: (value) {
                      setState(() {
                        isKertasChecked = value!;
                      });
                    },
                  ),
                ),
                if (isKertasChecked)
                  TextField(
                    controller: kertasController,
                    decoration: InputDecoration(
                      labelText: 'Jumlah (kg)',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),

                // Checkbox dan TextField untuk Logam
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.purple[100], // Warna ungu muda
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Logam',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Teks hitam dan bold
                    ),
                    value: isLogamChecked,
                    onChanged: (value) {
                      setState(() {
                        isLogamChecked = value!;
                      });
                    },
                  ),
                ),
                if (isLogamChecked)
                  TextField(
                    controller: logamController,
                    decoration: InputDecoration(
                      labelText: 'Jumlah (kg)',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),

                // Checkbox dan TextField untuk Kaca
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.purple[100], // Warna ungu muda
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      'Kaca',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Teks hitam dan bold
                    ),
                    value: isKacaChecked,
                    onChanged: (value) {
                      setState(() {
                        isKacaChecked = value!;
                      });
                    },
                  ),
                ),
                if (isKacaChecked)
                  TextField(
                    controller: kacaController,
                    decoration: InputDecoration(
                      labelText: 'Jumlah (kg)',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),

                // Tombol Hitung
                ElevatedButton(
                  onPressed: hitungPoin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Hitung'),
                ),
                const SizedBox(height: 20),

                // Menampilkan Total Poin
                Text(
                  'Total Poin: $totalPoin',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}