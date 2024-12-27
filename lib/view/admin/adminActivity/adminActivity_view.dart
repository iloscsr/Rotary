import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AdminActivity extends StatefulWidget {
  const AdminActivity({super.key});

  @override
  _AdminActivityState createState() => _AdminActivityState();
}

class _AdminActivityState extends State<AdminActivity> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  final TextEditingController _participantController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  XFile? _image;
  DateTime _eventDate = DateTime.now();
  bool _isRequired = false; // Participation required
  bool _isOnline = false; // Online event
  String _category = 'Yemek'; // Default category

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  void _saveEvent() {
    if (_formKey.currentState?.validate() ?? false) {
      // You can handle the saving logic here (e.g., saving to a database or a state)
      final eventName = _nameController.text;
      final eventInfo = _infoController.text; // This variable holds the event information
      final participantLimit = int.tryParse(_participantController.text) ?? 0;
      final category = _categoryController.text;
      final eventTime = _eventDate;
      final isOnline = _isOnline;
      final isRequired = _isRequired;

      // Using the variables (for example, display them in the confirmation dialog)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Etkinlik Kaydedildi'),
            content: Text(
              'Etkinlik adı: $eventName\n'
              'Kategori: $category\n'
              'Tarih: $eventTime\n'
              'Bilgi: $eventInfo\n'
              'Katılımcı Sayısı: $participantLimit\n'
              'Etkinlik Türü: ${isOnline ? "Online" : "Yüz Yüze"}\n'
              'Katılım Zorunluluğu: ${isRequired ? "Zorunlu" : "Gönüllü"}', // Display the additional information
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  // Show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _eventDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _eventDate) {
      setState(() {
        _eventDate = picked;
      });
    }
  }

  // Show time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_eventDate),
    );
    if (picked != null) {
      setState(() {
        _eventDate = DateTime(
          _eventDate.year,
          _eventDate.month,
          _eventDate.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etkinlikler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Event name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Etkinlik Adı',
                  prefixIcon: Icon(Icons.event),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Etkinlik adı boş olamaz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Event information
              TextFormField(
                controller: _infoController,
                decoration: const InputDecoration(
                  labelText: 'Etkinlik Bilgisi',
                  prefixIcon: Icon(Icons.info),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Etkinlik bilgisi boş olamaz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Event photo
              Row(
                children: [
                  _image == null
                      ? const Text('Etkinlik Fotoğrafı Seçilmedi')
                      : Image.file(File(_image!.path), height: 100, width: 100),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: _pickImage,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Event date and time
              Row(
                children: [
                  Text(
                    'Tarih: ${_eventDate.toLocal()}'.split(' ')[0],
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Saat: ${_eventDate.hour}:${_eventDate.minute}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.access_time),
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Participation required
              Row(
                children: [
                  const Text('Katılım Zorunlu'),
                  Switch(
                    value: _isRequired,
                    onChanged: (value) {
                      setState(() {
                        _isRequired = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Participant limit
              TextFormField(
                controller: _participantController,
                decoration: const InputDecoration(
                  labelText: 'Katılımcı Sayısı',
                  prefixIcon: Icon(Icons.group),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Katılımcı sayısı boş olamaz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Category selection
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'Etkinlik Kategorisi',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                items: ['Yemek', 'Gezi', 'Eğitim', 'Toplantı'].map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Event type (online or in-person)
              Row(
                children: [
                  const Text('Etkinlik Türü'),
                  RadioListTile<bool>(
                    title: const Text('Yüz Yüze'),
                    value: false,
                    groupValue: _isOnline,
                    onChanged: (value) {
                      setState(() {
                        _isOnline = value!;
                      });
                    },
                  ),
                  RadioListTile<bool>(
                    title: const Text('Online'),
                    value: true,
                    groupValue: _isOnline,
                    onChanged: (value) {
                      setState(() {
                        _isOnline = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Save button
              ElevatedButton(
                onPressed: _saveEvent,
                child: const Text('Etkinlik Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
