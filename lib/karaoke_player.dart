import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class KaraokePlayerScreen extends StatefulWidget {
  const KaraokePlayerScreen({super.key});

  @override
  State<KaraokePlayerScreen> createState() => _KaraokePlayerScreenState();
}

class _KaraokePlayerScreenState extends State<KaraokePlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Sementara kita menggunakan splash.mp4 sebagai simulasi video lagu karaoke
    _controller = VideoPlayerController.asset('assets/splash.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true); // Video akan berulang
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Lapisan Background (Video Lagu Karaoke)
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(color: Color(0xFFFFD700)),
          ),
          
          // 2. Lapisan Atas (Tombol Kembali & Judul Mode)
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context), // Kembali ke Home
                  focusColor: Colors.white30,
                  borderRadius: BorderRadius.circular(50),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 40),
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'NORMAL MODE',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                  ),
                ),
              ],
            ),
          ),
          
          // 3. Lapisan Bawah (Status Mikrofon Smartphone)
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFFFD700), width: 2),
              ),
              child: Row(
                children: const [
                  Icon(Icons.mic_off, color: Colors.redAccent, size: 30),
                  SizedBox(width: 10),
                  Text(
                    'Mic: Disconnected',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
