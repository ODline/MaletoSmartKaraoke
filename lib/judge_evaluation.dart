import 'package:flutter/material.dart';

class JudgeEvaluationScreen extends StatelessWidget {
  final List<String> selectedJudgeNames;

  const JudgeEvaluationScreen({super.key, required this.selectedJudgeNames});

  @override
  Widget build(BuildContext context) {
    // Simulasi hasil sementara (Nanti data ini akan dihasilkan otomatis oleh AI)
    final List<String> verdicts = ['YES', 'YES', 'NO'];
    final List<String> comments = [
      'Vokal kamu sangat stabil, eksekusi nada tinggi yang sempurna!',
      'Ada sedikit tempo yang meleset, tapi energi kamu luar biasa. Saya suka!',
      'Maaf, menurut saya penghayatan dan keaslian karakter kamu masih kurang.'
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A1128), // Background Dark Navy
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'HASIL EVALUASI JURI',
              style: TextStyle(color: Color(0xFFFFD700), fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  bool isYes = verdicts[index] == 'YES';
                  return Expanded(
                    child: Card(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFFFFD700), width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.person, size: 80, color: Colors.white54),
                            const SizedBox(height: 10),
                            Text(
                              selectedJudgeNames[index],
                              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '"${comments[index]}"',
                              style: const TextStyle(color: Colors.white70, fontSize: 16, fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                              decoration: BoxDecoration(
                                color: isYes ? Colors.green : Colors.redAccent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                verdicts[index],
                                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                              ),
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
            // Tampilan Final Verdict
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'FINAL VERDICT: 2 YES — 1 NO',
                style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Perintah untuk mereset dan kembali ke halaman paling awal (Home)
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('KEMBALI KE MENU UTAMA', style: TextStyle(color: Colors.white70, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
