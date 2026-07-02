import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdukasiPage extends StatelessWidget {
  final String videoUrl = 'https://youtu.be/YGjRvts84QI?si=aqqh5EnJw-eiMLLC'; // Ganti dengan URL video YouTube Anda

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ID video dari URL
    String videoId = YoutubePlayer.convertUrlToId(videoUrl)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edukasi dan Informasi'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  // Navigasi ke halaman pemutar video
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(videoId: videoId),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image.network(
                      'https://img.youtube.com/vi/$videoId/0.jpg', // Thumbnail video
                      height: 200,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Klik untuk menonton video',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Text Content
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tonton dan Pelajari',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cara Pengelolaan Sampah dan Daur Ulang',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Video yang membantu kamu memahami cara mengelola sampah dengan bijak, '
                        'mendaur ulang material yang bisa digunakan kembali, dan membuat kompos dari sampah organik.',
                    style: TextStyle(fontSize: 16),
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

class VideoPlayerPage extends StatelessWidget {
  final String videoId;

  const VideoPlayerPage({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Edukasi'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
        ],
      ),
    );
  }
}