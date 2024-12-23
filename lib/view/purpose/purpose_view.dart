import 'package:flutter/material.dart';

class PurposeView extends StatelessWidget {
  const PurposeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Amaç"),
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
                    'assets/images/2.jpg',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Rotary'nin Amacı",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Rotary’nin amacı, günlük yaşamda değerli girişimlerin temeli sayılan Hizmet ideali’ni teşvik etmek ve geliştirmek; özellikle de aşağıda belirtilen dört alanda kişileri özendirip, onlara destek vermektir:\n\n"
                    "1. Tanışıklığın bir hizmet fırsatı sayılarak geliştirilmesi;\n\n"
                    "2. İş ve meslek hayatında yüksek ahlak standartlarının teşviki; topluma yararlı iş ve mesleklerin değerinin tanınması ve takdir edilmesi; her üyenin kendi iş ve mesleğini topluma bir hizmet fırsatı sayarak yüceltmesi;\n\n"
                    "3. Her üyenin, Hizmet ideali’ni iş, meslek ve kişisel hayatında uygulaması;\n\n"
                    "4. Hizmet idealinde birleşmiş iş ve meslek sahipleri arasında dünya çapında dostluk ilişkileri kurmak suretiyle, uluslararası toplum hizmeti anlayışının, iyi niyet ve barışın geliştirilmesidir.\n\n"
                    "Bu esaslara göre Rotary;\n\n"
                    "- Bir anlayış ve yaşam biçimidir.\n"
                    "- Toplumsaldır ve gizli hiçbir yönü yoktur.\n"
                    "- Uluslararası tanışıklığı geliştirir.\n"
                    "- Dostluk ve arkadaşlığın gelişmesine olanak verir.\n"
                    "- İş ve meslek adamları arasında bilgi alışverişine fırsat sağlar.\n"
                    "- İş ve meslek adamlarına birbirine destek olma olanağı verir.\n"
                    "- Dostluk ve arkadaşlık ortamı içinde daha insancıl bir toplum yaratır.\n"
                    "- Üyelerin liderlik yeteneklerini geliştirerek yapıcı çalışmalarla topluma yararlı olmalarını sağlar.\n"
                    "- Dünya devletleri arasında ilişkilerin gelişmesine ve evrensel barışın sağlanmasına aracı olur.\n\n"
                    "Rotaryenler; karışıklığın olduğu yerde düzen, çirkinliğin olduğu yerde güzellik, yalnızlığın ve yanlış anlamanın olduğu yerde mutluluk ve sağlık yaratmak için uğraşır.\n\n"
                    "Rotary; dostluk havası içinde ve tarafsız bir ortamda dini, ırkı ve siyasi görüşü farklı kişilerin bir araya gelmesini sağlamaya çalışan bir kuruluştur. Buna göre düşünce ve görüşler farklı olsa dahi insanlar arasında sık sık bölünmelere neden olan partizanca faaliyetlerden kaçınılarak birleşmiş yararlar için işbirliği ve anlayışın gelişmesine de yardım eder.\n\n"
                    "Rotaryenler; olanak olan her yerde ve her yönde hizmet verirler.\n\n"
                    "Rotaryen; İşini yalnızca bir geçim kaynağı olarak düşünmeyen kişidir. Rotaryen için işi ve mesleği yaşamını sürdürmesi ve diğer insanlara hizmet vermesini sağlayan bir araçtır.\n\n"
                    "Bunun yanında her Rotaryen’den ülkesine ve inançlarına sadık olması beklenir. Zira siyasi ve dini görüşler kişinin yalnız kendisini ilgilendiren bir husustur.\n\n"
                    "Rotary’nin temel yaklaşımı, insanlar ve uluslararası ortak değer yargıları oluşturmak, insanları birbirine yaklaştırmak ve evrensel barışa katkı sağlamaktır.\n\n"
                    "Her ülkede bireyler, her şeyi devletten beklemeden ülke sorunlarına sahip çıkarak hizmet verenlere destek olurlar. Bu, çoğu kez kişisel hareket tarzında değil, kişilerin bir araya geldikleri Sivil Toplum Örgütleri eliyle gerçekleşir.\n\n"
                    "Rotary, diğer sivil toplum örgütlerinden farkı olarak bir yardım derneği ya da yalnız bir dostluk topluluğu değildir. Rotary’nin öngördüğü yardım sadaka veya iane şeklinde yapılmaz.\n\n"
                    "Rotary, 1915’te kurulan Kwanis, 1917 de kurulan Lions ve 1919 da kurulan Optimist ve Zonta gibi organizasyonlara örnek olmuş, Birleşmiş Milletler Eğitim, Bilim ve Kültür Organizasyonu UNESCO’nun kurulmasına zemin hazırlamış bir organizasyondur.\n\n"
                    "Rotary Kulüpleri ve Rotaryenlerin, Rotary’nin amacına ulaşmak yolunda başardıkları ve planladıkları her çalışma Rotary’nin önerdiği Programlar içinde yer bulur.",
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
