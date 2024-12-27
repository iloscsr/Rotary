import 'package:flutter/material.dart';

class AdminAnnouncement extends StatelessWidget {
  const AdminAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duyurular'),
      ),
      body: const Center(
        child: Text('Duyurular Sayfası'),
      ),
    );
  }
}