import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isModalVisible = false;
  String _name = '';
  int _participants = 1;

  void _handleJoin() {
    print('$_name katılacak ve $_participants kişiyle birlikte katılacak.');
    setState(() {
      _isModalVisible = false;
    });
  }

  void _increaseParticipants() {
    if (_participants < 5) {
      setState(() {
        _participants++;
      });
    }
  }

  void _decreaseParticipants() {
    if (_participants > 1) {
      setState(() {
        _participants--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://via.placeholder.com/100'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'ilayda cosar',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Email: ilos@gmail.com'),
                      Text('Phone: +1 234 567 890'),
                      Text('Address: Teknokent, Corum/Merkez'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Announcements Section
              Text('Duyurular', style: Theme.of(context).textTheme.headlineMedium),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Announcements screen
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => AnnouncementsScreen()));
                },
                child: const Text("Duyurular"),
              ),
              const SizedBox(height: 20),

              // Participation Section
              Text('Katılım Duyuruları', style: Theme.of(context).textTheme.headlineMedium),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isModalVisible = true;
                  });
                },
                child: const Text("Katılımli Duyurular"),
              ),
              const SizedBox(height: 20),

              // Modal for Participation
              if (_isModalVisible) _buildParticipationModal(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParticipationModal(BuildContext context) {
    return Center(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Katılım Bilgileri',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'İsminizi Girin',
                ),
                onChanged: (text) {
                  setState(() {
                    _name = text;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Kaç kişiyle katılacaksınız?',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _decreaseParticipants,
                  ),
                  Text(
                    '$_participants',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _increaseParticipants,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleJoin,
                child: const Text('Katıl'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isModalVisible = false;
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red), // Corrected here
                child: const Text('İptal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
