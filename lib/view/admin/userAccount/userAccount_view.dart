import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  // Simulated list of user registration requests
  final List<Map<String, String>> _registrationRequests = [
    {'name': 'Ali Yılmaz', 'email': 'ali@example.com', 'phone': '123-456-7890', 'address': 'İstanbul, Türkiye'},
    {'name': 'Ayşe Demir', 'email': 'ayse@example.com', 'phone': '987-654-3210', 'address': 'Ankara, Türkiye'},
    {'name': 'Mehmet Kaya', 'email': 'mehmet@example.com', 'phone': '555-333-2222', 'address': 'İzmir, Türkiye'},
  ];

  // Function to approve a registration request
  void _approveRequest(int index) {
    setState(() {
      _registrationRequests.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kayıt isteği onaylandı.')),
    );
  }

  // Function to reject a registration request
  void _rejectRequest(int index) {
    setState(() {
      _registrationRequests.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kayıt isteği reddedildi.')),
    );
  }

  // Function to show detailed information about a user
  void _showUserDetails(Map<String, String> user) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ad: ${user['name']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('E-posta: ${user['email']}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Telefon: ${user['phone']}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Adres: ${user['address']}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      // Perform approval action here
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Onayla'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      // Perform rejection action here
                    },
                    icon: const Icon(Icons.close),
                    label: const Text('Reddet'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanıcılar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _registrationRequests.isEmpty
            ? const Center(
                child: Text('Kayıt isteği bulunmamaktadır.'),
              )
            : ListView.builder(
                itemCount: _registrationRequests.length,
                itemBuilder: (context, index) {
                  final request = _registrationRequests[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(request['name'] ?? ''),
                      subtitle: Text(request['email'] ?? ''),
                      onTap: () => _showUserDetails(request), // Show details on tap
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () => _approveRequest(index),
                            tooltip: 'Onayla',
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.red),
                            onPressed: () => _rejectRequest(index),
                            tooltip: 'Reddet',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
