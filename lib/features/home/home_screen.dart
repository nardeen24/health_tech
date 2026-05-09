
import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/widgets/card_doctor.dart';
import 'package:health_tech/features/home/see_all_screen.dart';
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
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 220,
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A4578), // لون أزرق داكن مثل الصورة
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Aya",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Welcome in HealthTech",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage(
                            'assets/images/profile_image.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // حقل البحث (Search Bar)
                  Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 10),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search By Name, Locations",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF1A4578),
                          ),
                          suffixIcon: Icon(
                            Icons.tune,
                            color: Color(0xFF1A4578),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
