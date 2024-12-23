import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İletişim"),
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
                      'assets/images/4.jpg', // Fotoğrafınızı buraya ekleyin
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20), // Fotoğraf ile buton arasına boşluk
                  // Giriş butonu
                  ElevatedButton(
                    onPressed: () {
                      _showContactModal(context);
                    },
                    child: const Text("İletişim Formu"),
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

  void _showContactModal(BuildContext context) {
    // Form alanları için kontrolörler
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final messageController = TextEditingController();

    // Alt modal (pop-up) pencere
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
                'İletişim Formu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // E-posta girişi
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email adresiniz',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              // Ad soyad girişi
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Adınız',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              // Mesaj girişi
              TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: 'Mesajınız',
                  prefixIcon: Icon(Icons.comment),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              // Gönder butonu
              ElevatedButton(
                onPressed: () {
                  print(
                      'Form Gönderildi: ${emailController.text}, ${nameController.text}, ${messageController.text}');
                  Navigator.pop(context); // Modalı kapat
                },
                child: const Text('Gönder'),
              ),
              const SizedBox(height: 10),
              // Kapat butonu
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Modalı kapat
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Kapat'),
              ),
            ],
          ),
        );
      },
    );
  }
}
