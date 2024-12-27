import 'package:flutter/material.dart';

class OpinionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Görüşler ve Öneriler"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          OpinionItem(
            title: "Baskanlik Secimi Öneri",
            detail: "Yönetim kurulu toplantisi yapilsin ve yeni baskan secilsin.",
          ),
          OpinionItem(
            title: "Aidat Ödemesi Öneri",
            detail: "Aidatların online olarak ödenmesi için bir sistem geliştirilsin.",
          ),
        ],
      ),
    );
  }
}

class OpinionItem extends StatelessWidget {
  final String title;
  final String detail;

  const OpinionItem({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 0, 0),
        ),
      ),
      subtitle: Text(
        detail,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.check_circle, color: Colors.green),
            onPressed: () {
              // Onay butonu işlevi
            },
          ),
          IconButton(
            icon: const Icon(Icons.cancel, color: Colors.red),
            onPressed: () {
              // Red butonu işlevi
            },
          ),
        ],
      ),
    );
  }
}
