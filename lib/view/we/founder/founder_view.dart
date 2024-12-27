import 'package:flutter/material.dart';

class FounderView extends StatelessWidget {
  const FounderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kurucu"),
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
                    'assets/images/5.jpg',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Paul Harris - Rotary Kurucusu",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Paul P. Harris, dünyanın ilk uluslararası hizmet kulübü olan Rotary'nin kurucusudur. 19 Nisan 1868'de Racine, Wisconsin'de doğmuştur. Annesi Cornelia Bryan Harris, babası ise George N. Harris'tir. Altı çocuklu ailenin ikinci evladıdır. Üç yaşında iken Wallingford, Vermont'a taşınmış ve büyükanne ve büyükbabasıyla büyümüştür. Jean Thomson Harris ile evlenmiş, ancak çocukları olmamıştır. Iowa Üniversitesi'nden L.L.B., Vermont Üniversitesi'nden ise L.L.D. diploması almıştır.\n\n"
                    "Harris, gazeteci, öğretmen, şirket yetkilisi ve kovboy olarak çeşitli mesleklerde çalışmış, Amerika ve Avrupa'da granit ve mermer satmak amacıyla birçok seyahat yapmıştır. 1896 yılında Chicago'ya giderek avukatlık yapmaya başlamıştır. Bir gün, arkadaşını ziyaret ederken tüccarlarla tanışmış ve burada iş adamları arasında dostluk ruhunu yeniden canlandıracak bir kulüp kurma fikri doğmuştur.\n\n"
                    "23 Şubat 1905'te, Harris ve üç arkadaşı (Silvester Schiele, Gustavus Loehr ve Hiram Shorey) ilk Rotary kulübünü kurmuşlardır. Kulüp, üyelerinin rotasyonla farklı iş yerlerinde buluşması nedeniyle \"Rotary\" adı verilmiştir. Kulüp hızla büyümüş ve Rotary'nin başka şehirlere yayılmasına karar verilmiştir.\n\n"
                    "Harris, aynı zamanda birçok yurttaşlık ve profesyonel görevde de önemli roller üstlenmiştir. Özürlü çocuklar için ulusal Easter Seal Topluluğu'nun yönetim kurulunda yer almış, Chicago Bar Birliği'nin yönetim kurulu üyeliğini yapmıştır. Gençliğe olan katkılarından dolayı Amerika İzcileri tarafından Gümüş Buffalo Ödülü ile ödüllendirilmiştir ve çeşitli ülkelerden de ödüller almıştır.\n\n"
                    "Paul Harris, yaşamı boyunca Rotary'yi tanıtmak için birçok seyahat yapmış ve Rotaryenlere konuşmalar yapmıştır. 27 Ocak 1947'de hayatını kaybettiğinde, Rotary'nin küçük bir toplantıdan 6000 kulübe dönüştüğünü görmüştür. Harris'in hizmet ve dostluk anlayışı, Rotary'nin 27.500 kulübünde 1.2 milyon üyeyi bir araya getirmeyi başarmıştır.",
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
