import 'package:misa_studio/models/project.dart';

final List<Project> projects = [
  Project(
    title: 'Anas Home',
    location: 'Pinrang, Sulawesi Selatan, Indonesia',
    images: List.generate(11, (index) => 'assets/images/anas${index + 1}.png'),
  ),
  Project(
    title: 'Project MR',
    location: 'Pinrang, Sulawesi Selatan, Indonesia',
    images: List.generate(11, (index) => 'assets/images/rs${index + 1}.png'),
  ),
  Project(
    title: 'SKY POOL & LOUNGE',
    location: 'Pare-Pare, Sulawesi Selatan, Indonesia',
    images: List.generate(7, (index) => 'assets/images/sky${index + 1}.png'),
  ),
];