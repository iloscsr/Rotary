import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rotary/view/main_view.dart';
import 'dart:io'; // Dosya işlemleri için import
import 'activity/activity_view.dart'; // ActivityView import
import 'announcement/announcement_view.dart'; // AnnouncementView import
import 'calendar/calendar_view.dart'; // CalendarView import
import 'opinion/opinion_view.dart'; // OpinionView import

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Profil resmini değiştirmek için fonksiyon
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _email = "ilos@gmail.com";
  String _phone = "+1 234 567 890";
  String _address = "İstanbul";

  void _updateEmail() {
    setState(() {
      _email = _emailController.text;
    });
    _emailController.clear();
  }

  void _updatePhone() {
    setState(() {
      _phone = _phoneController.text;
    });
    _phoneController.clear();
  }

  void _updateAddress() {
    setState(() {
      _address = _addressController.text;
    });
    _addressController.clear();
  }

  void _goToEventsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ActivityView()), // ActivityView yönlendirmesi
    );
  }

  void _openCalendar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalendarView()), // CalendarView yönlendirmesi
    );
    //Get.to(CalendarView());
  }

  void _openAnnouncementsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnnouncementsPage()), // AnnouncementsPage yönlendirmesi
    );
  }

  void _openOpinionPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OpinionView()), // OpinionView yönlendirmesi
    );
  }

  void _goBackToMainView() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        //centerTitle: false,
        actions: [Icon(Icons.calendar_month)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Geri Dönüş Butonu

              // Profil Resmi ve Düzenleme
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : const NetworkImage('https://via.placeholder.com/100'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.blue, size: 30),
                          onPressed: _pickImage,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'ilayda cosar',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Görevi: Yönetici'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profil Bilgilerini Görüntüleme ve Düzenleme Butonları
              ProfileListTile(title: "Eposta",subtitle: _email,),
              ProfileListTile(title: "Adres",subtitle: _address,),
              ProfileListTile(title: "Telefon",subtitle: _phone,),

              /*
              const SizedBox(height: 10),
              ListTile(
                title: const Text('Telefon Numarası'),
                subtitle: Text(_phone),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Telefon Numarası Düzenle'),
                          content: TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Yeni Telefon Numarası',
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                _updatePhone();
                                Navigator.pop(context);
                              },
                              child: const Text('Güncelle'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('İptal'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text('Adres'),
                subtitle: Text(_address),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Adresi Düzenle'),
                          content: TextFormField(
                            controller: _addressController,
                            decoration: const InputDecoration(
                              labelText: 'Yeni Adres',
                              prefixIcon: Icon(Icons.location_on),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                _updateAddress();
                                Navigator.pop(context);
                              },
                              child: const Text('Güncelle'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('İptal'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 3) {
            _openCalendar();
          } else if (index == 1) {
            _goToEventsPage(); // Etkinlikler sekmesinde ActivityView yönlendirilmesi yapılır
          } else if (index == 0) {
            _openAnnouncementsPage(); // Duyurular sekmesinde AnnouncementsPage yönlendirilmesi yapılır
          } else if (index == 2) {
            _openOpinionPage(); // Görüşler sekmesine yönlendirme
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Duyurular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Etkinlikler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ballot),
            label: 'Görüşler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Takvim',
          ),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required  this.subtitle, required this.title,
  }) ;

  final String subtitle;
  final String title;
  final bool isEditable = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(title),
      subtitle: Text(subtitle),
      trailing: IconButton(
        icon: const Icon(Icons.edit, color: Colors.blue),
        onPressed: () {/*
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('E-posta Düzenle'),
                content: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Yeni E-posta',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _updateEmail();
                      Navigator.pop(context);
                    },
                    child: const Text('Güncelle'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('İptal'),
                  ),
                ],
              );
            },
          );*/
        },
      ),
    );
  }
}
