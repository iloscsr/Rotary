import 'package:flutter/material.dart';
// import 'package:rotary/view/admin/adminActivity/adminActivity_view.dart';
// import 'package:rotary/view/admin/admin_view.dart';
import 'package:rotary/view/main_view.dart';
// import 'view/profile/profile_view.dart'; // Profil sayfasına yönlendirme

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rotary Uygulaması',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: MainView(), // Profil sayfasını açıyoruz
    );
  }
}
