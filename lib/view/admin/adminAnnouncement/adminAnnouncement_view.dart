import 'package:flutter/material.dart';

class AdminAnnouncement extends StatefulWidget {
  const AdminAnnouncement({super.key});

  @override
  _AdminAnnouncementState createState() => _AdminAnnouncementState();
}

class _AdminAnnouncementState extends State<AdminAnnouncement> {
  final List<String> _announcements = [];
  final TextEditingController _controller = TextEditingController();

  void _addAnnouncement() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _announcements.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _deleteAnnouncement(int index) {
    setState(() {
      _announcements.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duyurular'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field to add announcements
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Duyuru Yazınız',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Button to add announcements
            ElevatedButton(
              onPressed: _addAnnouncement,
              child: const Text('Duyuru Ekle'),
            ),
            const SizedBox(height: 20),
            // Display announcements
            Expanded(
              child: _announcements.isEmpty
                  ? const Center(
                      child: Text('Henüz duyuru eklenmedi.'),
                    )
                  : ListView.builder(
                      itemCount: _announcements.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(_announcements[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteAnnouncement(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
