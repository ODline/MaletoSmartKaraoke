import 'package:flutter/material.dart';
import 'youtube_player_screen.dart';

class SongSelectionScreen extends StatelessWidget {
  final String selectedMode;

  const SongSelectionScreen({super.key, required this.selectedMode});

  @override
  Widget build(BuildContext context) {
    final List> songs = [
      {'title': 'Kangen', 'artist': 'Dewa 19', 'ytId': '2X-1t6y32Z8'},
      {'title': 'Pupus', 'artist': 'Dewa 19', 'ytId': '9597_3840h0'},
      {'title': 'Aku Cinta Kau dan Dia', 'artist': 'Dewa 19', 'ytId': 'dQw4w9WgXcQ'},
      {'title': 'Separuh Nafas', 'artist': 'Dewa 19', 'ytId': '3JZ_D3ELwOQ'},
    ];

    void showSongOptions(BuildContext context, Map<String, String> song) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF0A1128),
          title: Text(song['title']!, style: const TextStyle(color: Color(0xFFFFD700))),
          content: Text('Pilih tindakan untuk lagu ${song['artist']}?', style: const TextStyle(color: Colors.white75)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('"${song['title']}" ditambahkan ke Antrean!'), backgroundColor: Colors.blueAccent),
                );
              },
              child: const Text('Tambah ke Antrean', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Mengunduh "${song['title']}"...'), backgroundColor: Colors.orangeAccent),
                );
              },
              child: const Text('Download', style: TextStyle(color: Colors.orangeAccent)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD700)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YoutubePlayerScreen(
                      videoId: song['ytId']!,
                      songTitle: song['title']!,
                    ),
                  ),
                );
              },
              child: const Text('Putar Sekarang', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    }

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
                    onTap: () => showSongOptions(context, songs[index]),
                    focusColor: const Color(0xFFFFD700).withOpacity(0.3),
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
                        trailing: const Icon(Icons.play_circle_fill, color: Color(0xFFFFD700), size: 40),
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
