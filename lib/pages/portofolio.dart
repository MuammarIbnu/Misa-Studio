import 'package:flutter/material.dart';
import 'package:misa_studio/data/projects_data.dart';
import 'package:misa_studio/models/project.dart';
import 'package:misa_studio/widgets/portofolioitem.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portofolio')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final Project project = projects[index];
          return ProjectCard(
            project: project,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PortfolioDetail(project: project),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PortfolioDetail extends StatelessWidget {
  final Project project;

  const PortfolioDetail({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: PhotoViewGallery.builder(
        itemCount: project.images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(project.images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }
}
