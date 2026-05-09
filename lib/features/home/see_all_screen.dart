
import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/widgets/card_doctor.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),

                  Text(
                    "Top Doctors",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
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

                  SizedBox(height: 13),
                  CardDoctor(
                    doctorName: "Dr. Mona",
                    doctorSpecialize: "Cardiology",
                    doctorImage: "assets/images/doctor3.png",
                  ),
                  CardDoctor(
                    doctorName: "Dr. Omar",
                    doctorSpecialize: "Cardiology",
                    doctorImage: "assets/images/doctor2.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
