import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.0.103:3000/api";

  Future<dynamic> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Giriş başarısız');
    }
  }

  Future<List<dynamic>> getAnnouncements() async {
    final url = Uri.parse('$baseUrl/announcements');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Duyurular yüklenemedi');
    }
  }

  Future<void> participateInEvent(int id, bool isParticipating) async {
    final url = Uri.parse('$baseUrl/announcements/$id/participate');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'isParticipating': isParticipating}),
    );

    if (response.statusCode != 200) {
      throw Exception('Etkinlik güncellenemedi');
    }
  }

  Future<void> sendMessage(String name, String email, String message) async {
    final url = Uri.parse('$baseUrl/contact');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'message': message,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Mesaj gönderilemedi');
    }
  }
}
