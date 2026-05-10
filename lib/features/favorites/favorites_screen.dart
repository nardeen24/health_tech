import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/features/doctors/cubit/doctor_cubit.dart';
import 'package:health_tech/features/doctors/widget/card_doctor.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      // ✅ بنعرض الـ favorites من الـ DoctorCubit مش من global list
      body: BlocBuilder<DoctorCubit, dynamic>(
        builder: (context, state) {
          final cubit = context.read<DoctorCubit>();
          final favorites = cubit.favoriteDoctors;

          if (favorites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 60, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'No favorites yet',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Tap the heart icon on any doctor to add them',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: favorites.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return CardDoctor(doctor: favorites[index]);
            },
          );
        },
      ),
    );
  }
}
