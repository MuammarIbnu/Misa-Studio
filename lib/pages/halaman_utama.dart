import 'package:flutter/material.dart';
import 'kalkulasi.dart';
import 'pemesanan.dart';
import 'tentangkami.dart';
import 'portofolio.dart';
import 'package:misa_studio/widgets/menubutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Contoh project images (bisa diganti dari projects_data)
  final List<String> images = List.generate(
    11,
    (index) => 'assets/images/anas${index + 1}.png',
  );

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      _currentPage = (_currentPage + 1) % images.length;

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

      _autoSlide();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Misa Studio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 25),
            const Text(
              'Find Your Dream House',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Kami membantu mewujudkan rumah impian Anda dengan desain dan perhitungan yang tepat.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // ================== PAGEVIEW OTOMATIS ==================
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return AnimatedScale(
                    scale: _currentPage == index ? 1 : 0.95,
                    duration: const Duration(milliseconds: 400),
                    child: Image.asset(images[index], fit: BoxFit.contain),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // ================== LOGO DENGAN ANIMASI ==================
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.8, end: 1),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Opacity(opacity: (value - 0.8) / 0.2, child: child),
                );
              },
              child: Image.asset(
                'assets/images/logo.png',
                width: 400,
                height: 200,
              ),
            ),

            const Spacer(),

            // ================== MENU BUTTON BAR ==================
            MenuButtonBar(
              onPortfolio: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PortfolioPage()),
                );
              },
              onKalkulasi: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => KalkulasiBangunanPage()),
                );
              },
              onPemesanan: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PemesananPage()),
                );
              },
              onTentangKami: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TentangKamiPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
