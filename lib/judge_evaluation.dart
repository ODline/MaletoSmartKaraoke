import 'package:flutter/material.dart';

class JudgeEvaluationScreen extends StatelessWidget {
  final List> selectedJudgesData;

  const JudgeEvaluationScreen({super.key, required this.selectedJudgesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1128),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10),
                const Text(
                  'EVALUASI JURI KELOMPOK',
                  style: TextStyle(color: Color(0xFFFFD700), fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedJudgesData.length,
                itemBuilder: (context, index) {
                  final judge = selectedJudgesData[index];
                  return Card(
                    color: Colors.black54,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFFFD700), width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(20),
                      leading: const Icon(Icons.face, size: 50, color: Color(0xFFFFD700)),
                      title: Text(
                        judge['name']!,
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Komentar: "Penampilan yang luar biasa dan penuh penghayatan!"\nVonis: YES (Lolos)',
                          style: const TextStyle(color: Colors.greenAccent, fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                // Kembali ke menu utama setelah kompetisi selesai
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('KEMBALI KE MENU UTAMA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
