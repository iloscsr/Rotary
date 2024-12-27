import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Duyurular"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Duyuru Listesi
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text("Üye Bilgi Güncellemesi"),
                    subtitle: const Text("X kişisi üye oldu."),
                    trailing: const Icon(Icons.notifications),
                    onTap: () {
                      // Duyuruya tıklanınca yapılacak işlem
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
