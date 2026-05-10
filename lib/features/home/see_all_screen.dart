import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/features/doctors/cubit/doctor_cubit.dart';
import 'package:health_tech/features/doctors/cubit/doctor_state.dart';
import 'package:health_tech/features/doctors/widget/card_doctor.dart';

class SeeAllScreen extends StatefulWidget {
  final String? specialization;

  const SeeAllScreen({super.key, this.specialization});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorCubit>().getDoctors(
      specialization: widget.specialization,
    );
  }

  @override
  Widget build(BuildContext context) {
    final title =
        (widget.specialization == null || widget.specialization!.isEmpty)
        ? 'Top Doctors'
        : '${widget.specialization} Doctors';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: BlocBuilder<DoctorCubit, DoctorState>(
                builder: (context, state) {
                  if (state is DoctorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is DoctorError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 50,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Failed to load doctors\n${state.message}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<DoctorCubit>().getDoctors(
                                specialization: widget.specialization,
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is DoctorSuccess) {
                    if (state.doctors.isEmpty) {
                      return Center(
                        child: Text(
                          'No ${widget.specialization ?? ''} doctors found',
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      itemCount: state.doctors.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return CardDoctor(doctor: state.doctors[index]);
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
