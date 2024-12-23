import 'package:flutter/material.dart';
import 'package:rotary/view/profile/profile_view.dart';

class MembersView extends StatelessWidget {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Üyeler"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Fotoğraf ve açıklama düzeni
              Column(
                children: [
                  // Fotoğrafı ortala
                  Center(
                    child: Image.asset(
                      'assets/images/4.jpg',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20), // Buton ile fotoğraf arasına boşluk ekledik
                  // Giriş butonu
                  ElevatedButton(
                    onPressed: () {
                      // Giriş alanını açan modal fonksiyonunu çağır
                      _showLoginModal(context);
                    },
                    child: const Text("Giriş Yap"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoginModal(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Giriş Yap',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Email alanı
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email adresiniz',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              // Şifre alanı
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Şifre',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              // Giriş butonu
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isEmpty || password.isEmpty) {
                    // Eğer email veya şifre boşsa alert ile uyarı göster
                    _showAlertDialog(context, "Lütfen tüm alanları doldurun!");
                  } else {
                    // Başarılı giriş sonrası ProfilePage'e git
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileView()),
                    );
                  }
                },
                child: const Text('Giriş Yap'),
              ),
              const SizedBox(height: 10),
              // İptal butonu
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Modalı kapat
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('İptal'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'ı kapat
              },
            ),
          ],
        );
      },
    );
  }
}
