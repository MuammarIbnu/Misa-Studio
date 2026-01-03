import 'package:flutter/material.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Kami')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Usaha Kami',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'Kami adalah Konsultan untuk membantu mewujudkan rumah impian pelanggan kami (Sobat Misa).'
                'Kami memeliki pengalaman untuk mendampingi dan memberikan masukan terhadap perencanaan, pembangunan, serta pengawasan rumah impian anda.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              Text(
                'Alamat Kami',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'Jl. Poros Pinrang-Rappang, Kel. Fakkie, Kec. Tiroang, Kab. Pinrang, Sulawesi Selatan, Indonesia',
                textAlign: TextAlign.center,
              ),
              Text(
                'Jl. Sapta Taruna No.1, Pondok Pinang, Kebayoran Baru, Jakarta Selatan, Indonesia',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              Text(
                'Apa yang Kami Kerjakan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'Kami memberikan masukan "desain" yang sesuai dengan keinginan pelanggan dengan tetap mempertimbangkan unsur-unsur Arsitektur dan Struktur bangunan',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              Text(
                'Tujuan Aplikasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'Aplikasi ini dibuat untuk mempermudah pelanggan untuk menjangkau kami, '
                'mengatur konsultasi, mempermudah alur pemesanan serta '
                'memberikan pengalaman digital yang lebih baik bagi pelanggan.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
