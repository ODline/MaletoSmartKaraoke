import 'judge_selection.dart';
import 'practice_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'karaoke_player.dart';
import 'mic_client.dart'; // Memanggil antarmuka mikrofon

void main() {
  runApp(const MaletoApp());
}

class MaletoApp extends StatelessWidget {
  const MaletoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maleto Smart Karaoke',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A1128),
        primaryColor: const Color(0xFFFFD700),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= SPLASH SCREEN =================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Memaksa landscape untuk splash screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    
    _controller = VideoPlayerController.asset('assets/splash.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        
        Future.delayed(_controller.value.duration, () {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
            );
          }
        });
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
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
            : const CircularProgressIndicator(color: Color(0xFFFFD700)),
      ),
    );
  }
}

// ================= ROLE SELECTION (PILIH PERANGKAT) =================
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PILIH MODE PERANGKAT',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRoleButton(context, 'Layar TV', Icons.tv, true),
                const SizedBox(width: 40),
                _buildRoleButton(context, 'Mikrofon HP', Icons.smartphone, false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String title, IconData icon, bool isTV) {
    return InkWell(
      onTap: () {
        if (isTV) {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeScreen())
          );
        } else {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MicClientScreen())
          );
        }
      },
      focusColor: const Color(0xFFFFD700).withOpacity(0.4),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFFD700), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, size: 80, color: Colors.white),
            const SizedBox(height: 15),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// ================= HOME SCREEN (LAYAR TV) =================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo.png', height: 120),
            const SizedBox(height: 20),
            const Text('MALETO SMART KARAOKE', style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold, color: Color(0xFFFFD700))),
            const SizedBox(height: 10),
            const Text('Your Voice. Your Stage.', style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Colors.white70)),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton(context, 'Normal Mode', Icons.mic, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const KaraokePlayerScreen()));
                }),
                const SizedBox(width: 30),
                _buildMenuButton(context, 'Practice Mode', Icons.analytics, () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const PracticeModeScreen()));
}),,
                const SizedBox(width: 30),
                _buildMenuButton(context, 'Competition Mode', Icons.star, () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const JudgeSelectionScreen()));
}),,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon, VoidCallback onTapAction) {
    return InkWell(
      onTap: onTapAction,
      focusColor: const Color(0xFFFFD700).withOpacity(0.4),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFFD700), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 15),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
