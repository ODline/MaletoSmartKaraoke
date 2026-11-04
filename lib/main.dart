import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaletoApp());
}

class MaletoApp extends StatelessWidget {
  const MaletoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Memaksa tampilan landscape untuk layar TV
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    
    return MaterialApp(
      title: 'Maleto Smart Karaoke',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A1128), // Warna Dark Navy
        primaryColor: const Color(0xFFFFD700), // Warna Emas
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'MALETO SMART KARAOKE',
              style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your Voice. Your Stage.',
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Colors.white70),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton('Normal Mode', Icons.mic),
                const SizedBox(width: 30),
                _buildMenuButton('Practice Mode', Icons.analytics),
                const SizedBox(width: 30),
                _buildMenuButton('Competition Mode', Icons.star),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Desain tombol yang akan menyala (highlight) saat disorot remote TV
  Widget _buildMenuButton(String title, IconData icon) {
    return InkWell(
      onTap: () {},
      focusColor: const Color(0xFFFFD700).withOpacity(0.4), // Efek nyala emas saat disorot remote
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
