import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rotary/view/admin/adminActivity/adminActivity_view.dart';
import 'package:rotary/view/admin/adminAnnouncement/adminAnnouncement_view.dart';
import 'package:rotary/view/admin/adminOpinion/adminOpinion_view.dart';
import 'package:rotary/view/admin/userAccount/userAccount_view.dart';

void main() {
  runApp(const AdminPage());
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image; // image değişkenini burada tanımlıyoruz
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController(); // New controller for address

  String _email = "admin@gmail.com";
  String _phone = "+1 234 567 890";
  String _address = "İstanbul";

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _image != null
                            ? FileImage(File(_image!.path))
                            : NetworkImage('https://via.placeholder.com/100') as ImageProvider,
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
                        'Admin',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Görevi: Yönetici'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profil Bilgilerini Görüntüleme ve Düzenleme Butonları
              ListTile(
                title: const Text('E-posta Adresi'),
                subtitle: Text(_email),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
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
                    );
                  },
                ),
              ),
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
                            controller: _addressController, // Correct controller for address
                            decoration: const InputDecoration(
                              labelText: 'Yeni Adres',
                              prefixIcon: Icon(Icons.location_on),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                _updateAddress(); // Correct function for address
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
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminActivity()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminAnnouncement()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminOpinion()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserAccount()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              label: 'Etkinlikler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Kullanıcılar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ballot),
              label: 'Görüşler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Duyurular',
            ),
          ],
        ),
      ),
    );
  }
}