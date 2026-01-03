import 'package:flutter/material.dart';

class KalkulasiBangunanPage extends StatefulWidget {
  const KalkulasiBangunanPage({super.key});

  @override
  State<KalkulasiBangunanPage> createState() => _KalkulasiBangunanPageState();
}

class _KalkulasiBangunanPageState extends State<KalkulasiBangunanPage> {
  final TextEditingController luasTanahController = TextEditingController();
  final TextEditingController jumlahLantaiController = TextEditingController();

  List<TextEditingController> lantaiControllers = [];
  List<double> rekapPerLantai = [];
  double totalLuas = 0.0;
  String? errorMessage;

  double? parseLuasTanah(String input) {
    input = input.replaceAll(' ', '').toLowerCase();
    if (input.contains('x')) {
      final parts = input.split('x');
      if (parts.length == 2) {
        final panjang = double.tryParse(parts[0]);
        final lebar = double.tryParse(parts[1]);
        if (panjang != null && lebar != null) return panjang * lebar;
      }
    } else if (input.contains('*')) {
      final parts = input.split('*');
      if (parts.length == 2) {
        final panjang = double.tryParse(parts[0]);
        final lebar = double.tryParse(parts[1]);
        if (panjang != null && lebar != null) return panjang * lebar;
      }
    } else {
      return double.tryParse(input);
    }
    return null;
  }

  void generateLantaiControllers(int jumlahLantai) {
    lantaiControllers =
        List.generate(jumlahLantai, (index) => TextEditingController());
  }

  void hitungBangunan() {
    final luasTanah = parseLuasTanah(luasTanahController.text);
    final jumlahLantai = int.tryParse(jumlahLantaiController.text);

    if (luasTanah == null || jumlahLantai == null || jumlahLantai <= 0) {
      setState(() {
        errorMessage = 'Mohon masukkan luas tanah valid dan jumlah lantai';
        rekapPerLantai.clear();
        totalLuas = 0.0;
      });
      return;
    }

    rekapPerLantai.clear();
    totalLuas = 0.0;
    errorMessage = null;

    for (int i = 0; i < jumlahLantai; i++) {
      double? inputLuas = double.tryParse(lantaiControllers[i].text);
      if (inputLuas == null || inputLuas <= 0) {
        errorMessage = 'Mohon masukkan luas valid untuk lantai ${i + 1}';
        break;
      }

      double maxLuas;
      if (i == 0) {
        maxLuas = luasTanah * 0.6;
        if (inputLuas > maxLuas) {
          errorMessage =
          'Jumlah ruang terbuka hijau terlalu kecil dan tidak memenuhi standar. Maksimal: ${maxLuas.toStringAsFixed(2)} m²';
          break;
        }
      } else {
        maxLuas = rekapPerLantai[i - 1] * 1.0; // max 100% dari lantai sebelumnya
        if (inputLuas > maxLuas) {
          errorMessage =
          'Luas lantai ${i + 1} melebihi kemampuan perhitungan struktur dan beban standar. Maksimal: ${maxLuas.toStringAsFixed(2)} m²';
          break;
        }
      }

      rekapPerLantai.add(inputLuas);
      totalLuas += inputLuas;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulasi Bangunan Aman')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: luasTanahController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Luas Tanah (m²) atau Panjang x Lebar',
                border: OutlineInputBorder(),
                hintText: 'Contoh: 200 atau 10x20',
              ),
              onChanged: (_) {
                final lantai = int.tryParse(jumlahLantaiController.text) ?? 0;
                if (lantai > 0) generateLantaiControllers(lantai);
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: jumlahLantaiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah Lantai',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                final lantai = int.tryParse(value) ?? 0;
                if (lantai > 0) generateLantaiControllers(lantai);
                setState(() {});
              },
            ),
            const SizedBox(height: 12),
            if (lantaiControllers.isNotEmpty)
              Column(
                children: List.generate(lantaiControllers.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: TextField(
                      controller: lantaiControllers[index],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: index == 0
                            ? 'Lantai 1 (max 60% luas tanah)'
                            : 'Lantai ${index + 1} (max 100% dari lantai sebelumnya)',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  );
                }),
              ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: hitungBangunan,
              child: const Text('Hitung Luas Bangunan'),
            ),
            const SizedBox(height: 20),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            if (rekapPerLantai.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rekap Luas Bangunan Per Lantai:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...rekapPerLantai.asMap().entries.map((entry) {
                    return Text(
                        'Lantai ${entry.key + 1}: ${entry.value.toStringAsFixed(2)} m²');
                  }),
                  const SizedBox(height: 10),
                  Text(
                    'Total Luas Bangunan: ${totalLuas.toStringAsFixed(2)} m²',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}