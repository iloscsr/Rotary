import 'package:flutter/material.dart';
import 'package:rotary/view/we/establishment/establishment_view.dart';
import 'package:rotary/view/we/founder/founder_view.dart';
import 'package:rotary/view/we/purpose/purpose_view.dart';

class WeView extends StatelessWidget {
  const WeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // Adjust the height as needed
        child: AppBar(
          bottom: const TabBar(
        tabs: [
          Text("Kurucu"),
          Text("Kuruluş"),
          Text("Amaç"),
        ],
          ),
          title: const Text('Biz'),
        ),
      ),
      body: const TabBarView(
        children: [
        FounderView(),
        EstablishmentView(),
        PurposeView(),
        ],
      ),
      ),
    );
  }
}