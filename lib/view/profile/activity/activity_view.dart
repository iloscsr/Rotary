import 'package:flutter/material.dart';

class ActivityView extends StatefulWidget {
  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> with SingleTickerProviderStateMixin {
  // Etkinlik kategorileri
  final Map<String, List<String>> categories = {
    'Online': ['Eğitim', 'Toplantı', 'Zorunlu', 'Gönüllü'],
    'Yüz Yüze': ['Eğitim', 'Gezi', 'Yemek', 'Toplantı', 'Zorunlu', 'Gönüllü'],
  };

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.keys.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Etkinlikler"),
        bottom: TabBar(
          controller: _tabController,
          tabs: categories.keys.map((categoryType) {
            return Tab(
              text: categoryType,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.keys.map((categoryType) {
          return ListView.builder(
            itemCount: categories[categoryType]!.length,
            itemBuilder: (context, index) {
              String subCategory = categories[categoryType]![index];
              return Card(
                child: ListTile(
                  title: Text(subCategory),
                  onTap: () {
                    // Detay sayfasına yönlendirme
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityDetailPage(
                          categoryName: subCategory,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class ActivityDetailPage extends StatelessWidget {
  final String categoryName;

  ActivityDetailPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryName Detayları"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Etkinlik fotoğrafı
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Etkinlik Fotoğrafı',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Etkinlik adı
            Text(
              "Etkinlik Adı: $categoryName",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Etkinlik Bilgisi: Etkinlik bilgisi ........",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Etkinlik tarihi ve saati
            Text(
              "Tarih: 01.01.2025",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Saat: 10:00",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Katılımcı sayısını belirleme butonu
            ElevatedButton(
              onPressed: () {
                _showParticipantDialog(context);
              },
              child: Text("Katılımcı Sayısını Belirle"),
            ),
          ],
        ),
      ),
    );
  }

  void _showParticipantDialog(BuildContext context) {
    int participantCount = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Kaç kişi katılacaksınız?"),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      if (participantCount > 0) {
                        setState(() {
                          participantCount--;
                        });
                      }
                    },
                  ),
                  Text(
                    "$participantCount",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      setState(() {
                        participantCount++;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("İptal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (participantCount == 0) {
                      // Katılımcı sayısı 0 ise hata mesajı göster
                      Navigator.of(context).pop();
                      _showErrorDialog(context);
                    } else {
                      Navigator.of(context).pop();
                      _showAddToCalendarDialog(context, participantCount);
                    }
                  },
                  child: Text("Katıl"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hata"),
          content: Text("Lütfen katılımcı sayısını belirtin."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
  }

  void _showAddToCalendarDialog(BuildContext context, int participantCount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Etkinlik Takviminize Eklensin mi?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Hayır"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Burada etkinliği takvime ekleme işlemi yapılabilir.
                print("Etkinlik takvime eklendi, Katılımcı sayısı: $participantCount");
              },
              child: Text("Evet"),
            ),
          ],
        );
      },
    );
  }
}
