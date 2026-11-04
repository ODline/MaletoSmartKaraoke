import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MicClientScreen extends StatefulWidget {
  const MicClientScreen({super.key});

  @override
  State<MicClientScreen> createState() => _MicClientScreenState();
}

class _MicClientScreenState extends State<MicClientScreen> {
  bool isConnected = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    // Memaksa tampilan portrait (berdiri) khusus untuk handphone
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1128), // Background Dark Navy
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Maleto Mic', style: TextStyle(color: Color(0xFFFFD700))),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onTap: () {
            // Mengembalikan orientasi ke bebas saat keluar
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.portraitUp,
            ]);
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isConnected ? 'TERHUBUNG KE TV' : 'BELUM TERHUBUNG',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isConnected ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                if (!isConnected) {
                  // Simulasi koneksi (nanti diganti dengan scan QR)
                  setState(() => isConnected = true);
                } else {
                  // Simulasi mematikan/menyalakan suara
                  setState(() => isMuted = !isMuted);
                }
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isConnected 
                      ? (isMuted ? Colors.redAccent : const Color(0xFFFFD700))
                      : Colors.grey[800],
                  boxShadow: [
                    if (isConnected && !isMuted)
                      BoxShadow(
                        color: const Color(0xFFFFD700).withOpacity(0.5),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                  ],
                ),
                child: Icon(
                  isConnected ? (isMuted ? Icons.mic_off : Icons.mic) : Icons.qr_code_scanner,
                  size: 100,
                  color: isConnected ? Colors.black : Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              isConnected 
                  ? (isMuted ? 'Ketuk untuk mengaktifkan suara' : 'Ketuk untuk Mute')
                  : 'Ketuk untuk Scan QR Code di TV',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
