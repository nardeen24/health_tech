import 'package:flutter/material.dart';
import 'package:health_tech/features/favorites/favorites_data.dart';
import 'package:health_tech/features/home/widgets/card_doctor.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: favoriteDoctors.isEmpty
          ? Center(child: Text('No favorites yet'))
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: favoriteDoctors.length,
              itemBuilder: (context, index) {
                final doctor = favoriteDoctors[index];
                return CardDoctor(
                  doctorImage: doctor['image']!,
                  doctorName: doctor['name']!,
                  doctorSpecialize: doctor['specialize']!,
                );
              },
            ),
    );
  }
}
