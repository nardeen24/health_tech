import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/features/doctors/cubit/doctor_cubit.dart';
import 'package:health_tech/features/doctors/cubit/doctor_state.dart';
import 'package:health_tech/features/doctors/widget/card_doctor.dart';
import 'package:health_tech/features/home/see_all_screen.dart';
import 'package:health_tech/features/home/widgets/header_widget.dart';
import 'package:health_tech/features/specializ-circle/specializ_circle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorCubit>().getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Doctor Speciality",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      const Text(
                        "See All",
                        style: TextStyle(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SpecializCircle(
                        label: "Gastroenterology",
                        image: "assets/images/dentist_image.png",
                        onTap: () => _navigateToDoctorsBySpec(
                          context,
                          "Gastroenterology",
                        ),
                      ),
                      SpecializCircle(
                        label: "Ophthalmology",
                        image: "assets/images/ophthalmology_image.png",
                        onTap: () =>
                            _navigateToDoctorsBySpec(context, "Ophthalmology"),
                      ),
                      SpecializCircle(
                        label: "Cardiology",
                        image: "assets/images/cardiologist_image.png",
                        onTap: () =>
                            _navigateToDoctorsBySpec(context, "Cardiology"),
                      ),
                      SpecializCircle(
                        label: "General",
                        image: "assets/images/dentist_image.png",
                        onTap: () => _navigateToDoctorsBySpec(context, ""),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Top Doctors",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SeeAllScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: ColorManager.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  BlocBuilder<DoctorCubit, DoctorState>(
                    builder: (context, state) {
                      if (state is DoctorLoading) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (state is DoctorError) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Error: ${state.message}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      }
                      if (state is DoctorSuccess) {
                        final topDoctors = state.doctors.take(2).toList();
                        return Column(
                          children: topDoctors
                              .map(
                                (doctor) => Padding(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  child: CardDoctor(doctor: doctor),
                                ),
                              )
                              .toList(),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDoctorsBySpec(BuildContext context, String specialization) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SeeAllScreen(specialization: specialization),
      ),
    );
  }
}
