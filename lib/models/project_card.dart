import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final List<String> imagePaths;
  final String description;

  const ProjectCard({
    super.key,
    required this.title,
    required this.imagePaths,
    required this.description,
  });

  void _openGallery(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            child: SizedBox(
              width: 600,
              child: PageView(
                children:
                    imagePaths
                        .map(
                          (path) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(path, fit: BoxFit.contain),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openGallery(context),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio:
                      3 / 4, // você pode ajustar para 3/4 ou 4/3 se preferir
                  child: Image.asset(
                    imagePaths.first,
                    fit:
                        BoxFit
                            .contain, // ou BoxFit.fitWidth se quiser preencher horizontalmente
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
