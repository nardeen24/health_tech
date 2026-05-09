import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/features/home/widgets/card_doctor.dart';
import 'package:health_tech/features/home/see_all_screen.dart';
import 'package:health_tech/features/home/widgets/header_widget.dart';
import 'package:health_tech/features/specializ-circle/specializ_circle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // (Header)
            HeaderWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  //             Doctor Speciality
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Doctor Speciality",
                        style: const TextStyle(
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
                        label: "Dentist",
                        image: "assets/images/dentist_image.png",
                      ),
                      SpecializCircle(
                        label: "Dentist",
                        image: "assets/images/ophthalmology_image.png",
                      ),
                      SpecializCircle(
                        label: "Dentist",
                        image: "assets/images/cardiologist_image.png",
                      ),
                      SpecializCircle(
                        label: "Dentist",
                        image: "assets/images/dentist_image.png",
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Doctors",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SeeAllScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                            color: ColorManager.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),
                  CardDoctor(
                    doctorName: "Dr. Ahmed",
                    doctorSpecialize: "Dentist",
                    doctorImage: "assets/images/doctor1.png",
                  ),
                  SizedBox(height: 13),
                  CardDoctor(
                    doctorName: "Dr. Omar",
                    doctorSpecialize: "Cardiology",
                    doctorImage: "assets/images/doctor2.png",
                  ),
                ],
              ),
            ),

            // MainNavigation(),
          ],
        ),
      ),
    );
  }
}
