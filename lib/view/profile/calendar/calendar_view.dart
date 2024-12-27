import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Takvim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Takvim widget'ı
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 01, 01),
              lastDay: DateTime.utc(2025, 12, 31),
              calendarFormat: CalendarFormat.month,
              onDaySelected: (selectedDay, focusedDay) {
                // Günü seçtiğinde yapılacak işlem
                print('Seçilen Gün: $selectedDay');
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false, // Format butonunu gizle
                titleCentered: true, // Başlığı ortaya al
              ),
            ),
            const SizedBox(height: 20),
            // Ekstra içerikler
            Text(
              "Takvimi kullanarak etkinliklerinizi düzenleyebilirsiniz.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
