import 'package:flutter/material.dart';
import 'package:ribamar_portifolio/models/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projetos',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: isMobile ? 1 : 3,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ProjectCard(
                title: 'Controle Financeiro',
                imagePaths: [
                  'assets/saldo_zen_inicio.jpg',
                  'assets/saldo_zen_logo.jpg',
                ],
                description:
                    'App de controle financeiro. Tenha controle total das suas finanças.',
              ),
              ProjectCard(
                title: 'App para Lojistas',
                imagePaths: [
                  'assets/impulsiona_commerx_inicio.jpg',
                  'assets/impulsiona_commerx_logo.jpg',
                  'assets/impulsiona_commerx_login.jpg',
                ],
                description:
                    'App para lojistas gerenciarem suas vendas e clientes.',
              ),
              ProjectCard(
                title: 'App/Site para Açougue',
                imagePaths: [
                  'assets/acougue_inicio.jpg',
                  'assets/acougue_logo.jpg',
                ],
                description:
                    'App/Site para açougue com funcionalidades de pedidos online.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
