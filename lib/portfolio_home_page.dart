import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ribamar_portifolio/sections/hero_section.dart';
import 'package:ribamar_portifolio/sections/projects_section.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;

    void _launchWhatsApp() async {
      const url = 'https://wa.me/5561993397747';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      }
    }

    void _showPixDialog(BuildContext context) {
      const pixKey = '4a338bbd-fea8-4d18-82fb-92b47ead1bde'; // sua chave Pix

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: const Color(0xFF1C1C1E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                'Apoie com um Pix',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/qrcode-pix.png', // Caminho do QR Code
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SelectableText(
                    'Escaneie com seu app de banco\nou copie a chave abaixo:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  SelectableText(
                    pixKey,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () async {
                      await Clipboard.setData(
                        const ClipboardData(text: pixKey),
                      );
                      Navigator.pop(context); // fecha o diálogo
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Chave Pix copiada para a área de transferência!',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    icon: const Icon(Icons.copy, color: Colors.white),
                    label: const Text(
                      'Copiar chave Pix',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Fechar',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.chat),
                    onPressed: _launchWhatsApp,
                    label: const Text('Fale comigo via WhatsApp'),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    onPressed: () => _showPixDialog(context),
                    icon: const Icon(Icons.pix),
                    label: const Text('Pague-me um Café'),
                  ),
                ],
              ),
            ),
            const ProjectsSection(),
            Container(
              width: double.infinity,
              color: Colors.indigo.shade900,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: const Text(
                '© 2025 Ribamar Alves — Desenvolvedor Flutter Web & Mobile',
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
