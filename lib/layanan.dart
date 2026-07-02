import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LayananPage(),
  ));
}

class LayananPage extends StatefulWidget {
  @override
  _LayananPageState createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {
  List<bool> _isExpanded = [false, false, false];
  final TextEditingController _questionController = TextEditingController();

  // Daftar pertanyaan dan jawaban
  final List<String> _questions = [
    'Bagaimana cara menukar poin dengan hadiah?',
    'Bagaimana cara menghubungi layanan pelanggan?',
    'Apa saja jenis sampah yang bisa disetorkan??',
  ];

  final List<String> _answers = [
    'klik ikon hadiah disamping informasi poin',
    'Anda dapat menghubungi layanan pelanggan melalui telepon, email, atau chat langsung di aplikasi kami.',
    'Plastik,Kertas,Logam,kaca',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layanan Pelanggan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kotak FAQ
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: List.generate(_questions.length, (index) {
                  return ExpansionTile(
                    title: Text(_questions[index]),
                    trailing: Icon(
                      _isExpanded[index]
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _isExpanded[index] = expanded;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _answers[index],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            // Kotak ajukan pertanyaan
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ajukan Pertanyaan:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _questionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Tulis pertanyaan Anda di sini...',
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Logika untuk mengirim pertanyaan
                      String question = _questionController.text;
                      if (question.isNotEmpty) {
                        // Kirim pertanyaan ke server atau lakukan tindakan lain
                        print('Pertanyaan dikirim: $question');
                        _questionController.clear();
                      }
                    },
                    child: Text('Kirim'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}