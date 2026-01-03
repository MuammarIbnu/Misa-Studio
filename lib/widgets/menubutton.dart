import 'package:flutter/material.dart';

class MenuButtonBar extends StatelessWidget {
  final VoidCallback onPortfolio;
  final VoidCallback onKalkulasi;
  final VoidCallback onPemesanan;
  final VoidCallback onTentangKami;

  const MenuButtonBar({
    super.key,
    required this.onPortfolio,
    required this.onKalkulasi,
    required this.onPemesanan,
    required this.onTentangKami,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.home_work, size: 28),
          onPressed: onPortfolio,
        ),
        IconButton(
          icon: const Icon(Icons.calculate, size: 28),
          onPressed: onKalkulasi,
        ),
        IconButton(
          icon: const Icon(Icons.assignment, size: 28),
          onPressed: onPemesanan,
        ),
        IconButton(
          icon: const Icon(Icons.info_outline, size: 28),
          onPressed: onTentangKami,
        ),
      ],
    );
  }
}