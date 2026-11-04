import 'package:flutter/material.dart';
import 'judge_evaluation.dart';

class JudgeSelectionScreen extends StatefulWidget {
  const JudgeSelectionScreen({super.key});

  @override
  State<JudgeSelectionScreen> createState() => _JudgeSelectionScreenState();
}

class _JudgeSelectionScreenState extends State<JudgeSelectionScreen> {
  final List<String> judges = [
    'Aham Dhanar', 'Ari Lastra', 'Anan Hermanto', 'Judira', 'Rosana',
    'Bina Citra Lestari', 'Maida Estania', 'Tita Diani Jaya', 'Agnes Mova', 'Arman Maulendra',
    'Aril Nohan', 'Kaka Slan', 'Anggita', 'Bebi Romara', 'Afgani',
    'Isyana Sarasti', 'Sherina Munara', 'Vidi Aldara', 'Nino Randa', 'Giran Ganesa'
  ];

  List<int> selectedJudges = [];

  void toggleSelection(int index) {
    setState(() {
      if (selectedJudges.contains(index)) {
        selectedJudges.remove(index);
      } else {
        if (selectedJudges.length < 3) {
          selectedJudges.add(index);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Maksimal 3 juri!'), backgroundColor: Colors.redAccent),
          );
        }
      }
    });
  }

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
                IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30), onTap: () => Navigator.pop(context)),
                const SizedBox(width: 10),
                const Text('PILIH 3 JURI VIRTUAL', style: TextStyle(color: Color(0xFFFFD700), fontSize: 28, fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('Terpilih: ${selectedJudges.length} / 3', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemCount: judges.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedJudges.contains(index);
                  return InkWell(
                    onTap: () => toggleSelection(index),
                    focusColor: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFFD700) : Colors.black45,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: isSelected ? Colors.white : Colors.white24, width: isSelected ? 3 : 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.face, size: 50, color: isSelected ? Colors.black : Colors.white54),
                          const SizedBox(height: 5),
                          Text(
                            judges[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: isSelected ? Colors.black : Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: selectedJudges.length == 3 ? () {
                List> chosenJudges = selectedJudges.map((i) => {'name': judges[i], 'trait': 'Karakter Juri'}).toList();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => JudgeEvaluationScreen(selectedJudgesData: chosenJudges)));
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                disabledBackgroundColor: Colors.grey[800],
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('MULAI KOMPETISI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
