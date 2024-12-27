import 'package:flutter/material.dart';

class EstablishmentView extends StatelessWidget {
  const EstablishmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kuruluş"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Fotoğraf ve açıklama düzeni
              Column(
                children: [
                  // Tek Fotoğraf
                  Image.asset(
                    'assets/images/3.jpg',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Rotary'nin Kuruluşu",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Rotary, genç bir avukat olan Paul Harris ve 3 yakın arkadaşının 23 Şubat 1905 tarihinde yaptıkları toplantıda almış oldukları ortak kararla, çeşitli iş kollarından seçilen işadamlarının oluşturacağı bir işadamları kulübünü hayata geçirdiler. Bu toplantı aynı zamanda dünyanın ilk gönüllü hizmet kuruluşu olan Rotary’nin de doğuşudur.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
