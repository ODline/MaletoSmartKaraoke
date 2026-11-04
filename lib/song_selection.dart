import 'package:flutter/material.dart';
import 'karaoke_player.dart';
import 'practice_mode.dart';
import 'judge_selection.dart';

class SongSelectionScreen extends StatelessWidget {
  final String selectedMode;

  const SongSelectionScreen({super.key, required this.selectedMode});

  @override
  Widget build(BuildContext context) {
    // Simulasi daftar lagu (Bisa diganti dengan data dari API/YouTube nanti)
    final List> songs = [
      {'title': 'Aku Cinta Kau dan Dia', 'artist': 'Ahmad Dhani / Dewa 19'},
      {'title': 'Kangen', 'artist': 'Dewa 19'},
      {'title': 'Pupus', 'artist': 'Dewa 19'},
      {'title': 'Separuh Nafas', 'artist': 'Dewa 19'},
      {'title': 'Risalah Hati', 'artist': 'Dewa 19'},
      {'title': 'Cinta Kan Membawamu Kembali', 'artist': 'Dewa 19'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A1128),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 40),
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(width: 15),
                Text(
                  'PILIH LAGU - $selectedMode',
                  style: const TextStyle(color: Color(0xFFFFD700), fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Mengarahkan ke panggung yang tepat sesuai mode yang dipilih di awal
                      Widget nextScreen;
                      if (selectedMode == 'NORMAL MODE') {
                        nextScreen = const KaraokePlayerScreen();
                      } else if (selectedMode == 'PRACTICE MODE') {
                        nextScreen = const PracticeModeScreen();
                      } else {
                        nextScreen = const JudgeSelectionScreen();
                      }

                      Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
                    },
                    focusColor: const Color(0xFFFFD700).withOpacity(0.3), // Highlight remote TV
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      color: Colors.black54,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white24, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: const Icon(Icons.music_note, color: Color(0xFFFFD700), size: 40),
                        title: Text(
                          songs[index]['title']!,
                          style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          songs[index]['artist']!,
                          style: const TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                        trailing: const Icon(Icons.play_circle_fill, color: Colors.white54, size: 40),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
