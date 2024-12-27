import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AnnouncementsScreen extends StatefulWidget {
  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> announcements = [];

  @override
  void initState() {
    super.initState();
    _fetchAnnouncements();
  }

  void _fetchAnnouncements() async {
    try {
      final data = await _apiService.getAnnouncements();
      setState(() {
        announcements = data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Duyurular yüklenemedi')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Duyurular')),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final announcement = announcements[index];
          return ListTile(
            title: Text(announcement['title']),
            subtitle: Text(announcement['description']),
            trailing: ElevatedButton(
              onPressed: () {
                _apiService.participateInEvent(
                  announcement['id'],
                  !announcement['isParticipating'],
                );
                setState(() {
                  announcement['isParticipating'] =
                      !announcement['isParticipating'];
                });
              },
              child: Text(announcement['isParticipating']
                  ? 'Katılımdan Çık'
                  : 'Katıl'),
            ),
          );
        },
      ),
    );
  }
}
