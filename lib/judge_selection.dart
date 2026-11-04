import 'package:flutter/material.dart';

class JudgeSelectionScreen extends StatefulWidget {
  const JudgeSelectionScreen({super.key});

  @override
  State<JudgeSelectionScreen> createState() => _JudgeSelectionScreenState();
}

class _JudgeSelectionScreenState extends State<JudgeSelectionScreen> {
  // Daftar 20 Juri Virtual sesuai Cetak Biru
  final List<String> judges = [
    'Aham Dhanar', 'Ari Lastra', 'Anan Hermanto', 'Judira', 'Rosana',
    'Bina Citra Lestari', 'Maida Estania', 'Tita Diani Jaya', 'Agnes Mova', 'Arman Maulendra',
    'Aril Nohan', 'Kaka Slan', 'Anggita', 'Bebi Romara', 'Afgani',
    'Isyana Sarasti', 'Sherina Munara', 'Vidi Aldara', 'Nino Randa', 'Giran Ganesa'
  ];

  // Menyimpan juri yang dipilih (Maksimal 3)
  List<int> selectedJudges = [];

  void toggleSelection(int index) {
    setState(() {
      if (selectedJudges.contains(index)) {
        selectedJudges.remove(index); // Batal pilih
      } else {
        if (selectedJudges.length < 3) {
          selectedJudges.add(index); // Pilih juri baru
        } else {
          // Tampilkan peringatan jika sudah 3
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Anda hanya dapat memilih maksimal 3 juri!'),
              backgroundColor: Colors.redAccent,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1128), // Background Dark Navy
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
                  'PILIH 3 JURI VIRTUAL',
                  style: TextStyle(color: Color(0xFFFFD700), fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'Terpilih: ${selectedJudges.length} / 3',
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // 5 kolom ke samping (cocok untuk TV)
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8, // Proporsi kotak juri
                ),
                itemCount: judges.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedJudges.contains(index);
                  return InkWell(
                    onTap: () => toggleSelection(index),
                    focusColor: Colors.white24,
                    borderRadius: BorderRadius.circular(15),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFFD700) : Colors.black45,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.white30,
                          width: isSelected ? 3 : 1,
                        ),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(color: const Color(0xFFFFD700).withOpacity(0.6), blurRadius: 15),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Placeholder untuk foto/avatar juri nanti
                          Icon(
                            Icons.person,
                            size: 60,
                            color: isSelected ? Colors.black : Colors.white54,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            judges[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            // Tombol Mulai Kompetisi (Hanya aktif jika 3 juri dipilih)
            ElevatedButton(
              onPressed: selectedJudges.length == 3 ? () {
                // Nanti ini akan diarahkan ke halaman Competition Player
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mulai Kompetisi!'), backgroundColor: Colors.green),
                );
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                disabledBackgroundColor: Colors.grey[800],
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                'MULAI KOMPETISI',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
