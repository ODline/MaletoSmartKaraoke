import 'package:flutter/material.dart';

class JudgeEvaluationScreen extends StatelessWidget {
  final List> selectedJudgesData;

  const JudgeEvaluationScreen({super.key, required this.selectedJudgesData});

  @override
  Widget build(BuildContext context) {
    // Simulasi hasil berdasarkan kepribadian (Nanti dinamis dari AI)
    final List<String> verdicts = ['YES', 'YES', 'NO'];
    final List<String> comments = [
      'Gaya bernyanyi kamu masuk banget. Evaluasi sesuai karakter saya: ${selectedJudgesData[0]['trait']}',
      'Secara teknis aman. Pendekatan saya: ${selectedJudgesData[1]['trait']}',
      'Belum cukup untuk standar saya. Pandangan saya: ${selectedJudgesData[2]['trait']}'
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A1128),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('HASIL EVALUASI JURI', style: TextStyle(color: Color(0xFFFFD700), fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  bool isYes = verdicts[index] == 'YES';
                  return Expanded(
                    child: Card(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(side: const BorderSide(color: Color(0xFFFFD700), width: 1), borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.face, size: 80, color: Colors.white54), // Slot foto/avatar juri
                            const SizedBox(height: 10),
                            Text(selectedJudgesData[index]['name']!, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            Text(selectedJudgesData[index]['trait']!, style: const TextStyle(color: Color(0xFFFFD700), fontSize: 14)),
                            const SizedBox(height: 15),
                            Text('"${comments[index]}"', style: const TextStyle(color: Colors.white70, fontSize: 16, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                              decoration: BoxDecoration(color: isYes ? Colors.green : Colors.redAccent, borderRadius: BorderRadius.circular(30)),
                              child: Text(verdicts[index], style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              decoration: BoxDecoration(color: const Color(0xFFFFD700), borderRadius: BorderRadius.circular(15)),
              child: const Text('FINAL VERDICT: 2 YES — 1 NO', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text('KEMBALI KE MENU UTAMA', style: TextStyle(color: Colors.white70, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
