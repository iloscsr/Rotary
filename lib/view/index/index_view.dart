import 'package:flutter/material.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Özetle Rotary"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tablo düzeni
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // İlk satır: Fotoğraf ve açıklama
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // İlk sütun
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/1.jpg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Rotary’nin Tanımı",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      // İkinci sütun
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/2.jpg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Amacı",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // İlk satırın açıklamaları
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // İlk sütun açıklaması
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: const Text(
                            "Her Rotary kulübü, hizmet idealini kendi kişisel, mesleki ve toplum hayatının doyurucu bir hedefi olarak kabul eden iş ve meslek sahibi kişilerden oluşur.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // İkinci sütun açıklaması
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: const Text(
                            "Günlük yaşamda değerli girişimlerin temeli sayılan Hizmet ideali’ni teşvik etmek ve geliştirmek; özellikle de aşağıda belirtilen dört alanda kişileri özendirip, onlara destek vermektir.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // İkinci satır: Fotoğraf ve açıklama
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Üçüncü sütun
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/3.jpg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Kuruluşu",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Dördüncü sütun
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/4.jpg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Dörtlü Özdenetim",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // İkinci satırın açıklamaları
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Üçüncü sütun açıklaması
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: const Text(
                            "Rotary, genç bir avukat olan Paul Harris ve 3 yakın arkadaşının 23 Şubat 1905 tarihinde yaptıkları toplantıda almış oldukları ortak kararla bir iş adamları kulübü kurmuştur.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Dördüncü sütun açıklaması
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: const Text(
                            "Dörtlü özdenetim kuralı, ilk olarak 1932 yılında Herbert J.Taylor tarafından söylenmiştir.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
