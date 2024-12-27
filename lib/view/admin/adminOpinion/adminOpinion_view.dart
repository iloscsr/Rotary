import 'package:flutter/material.dart';

class AdminOpinion extends StatelessWidget {
  const AdminOpinion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Görüşler'),
      ),
      body: const Center(
        child: Text('Görüşler Sayfası'),
      ),
    );
  }
}