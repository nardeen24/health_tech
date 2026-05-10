import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/booking/booking_screen.dart';
import 'package:health_tech/features/doctors/cubit/doctor_cubit.dart';
import 'package:health_tech/features/doctors/models/doctor_model.dart';

class CardDoctor extends StatelessWidget {
  const CardDoctor({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, dynamic>(
      builder: (context, state) {
        final cubit = context.read<DoctorCubit>();
        final isFav = cubit.isFavorite(doctor);

        Widget doctorImage;
        if (doctor.photo != null && doctor.photo!.isNotEmpty) {
          doctorImage = Image.network(
            doctor.photo!,
            width: 100,
            height: 140,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/doctors_image/d${(doctor.id % 12) + 1}.png',
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          );
        } else {
          doctorImage = Image.asset(
            'assets/doctors_image/d${(doctor.id % 12) + 1}.png',
            width: 100,
            height: 140,
            fit: BoxFit.cover,
          );
        }

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: doctorImage,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              doctor.name ?? 'Unknown',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.toggleFavorite(doctor);
                            },
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                            ),
                            color: isFav ? Colors.red : Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doctor.specialization?.name ?? 'General',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      if (doctor.degree != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          doctor.degree!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          const Text(
                            "4.8",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      if (doctor.appointPrice != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'EGP ${doctor.appointPrice}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      const SizedBox(height: 12),
                      PraimaryButtom(
                        text: 'Make Appointment',
                        onpressed: () {
                          final cubitInstance = context.read<DoctorCubit>();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: cubitInstance,
                                child: BookingScreen(doctor: doctor),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
