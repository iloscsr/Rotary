import 'package:flutter/material.dart';

class AdminOpinion extends StatefulWidget {
  const AdminOpinion({super.key});

  @override
  _AdminOpinionState createState() => _AdminOpinionState();
}

class _AdminOpinionState extends State<AdminOpinion> {
  final List<String> _opinions = [];
  final TextEditingController _controller = TextEditingController();

  void _addOpinion() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _opinions.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _deleteOpinion(int index) {
    setState(() {
      _opinions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Görüşler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field to add opinions
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Görüş Yazınız',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Button to add opinions
            ElevatedButton(
              onPressed: _addOpinion,
              child: const Text('Görüş Ekle'),
            ),
            const SizedBox(height: 20),
            // Display opinions
            Expanded(
              child: _opinions.isEmpty
                  ? const Center(
                      child: Text('Henüz görüş eklenmedi.'),
                    )
                  : ListView.builder(
                      itemCount: _opinions.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(_opinions[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteOpinion(index),
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
