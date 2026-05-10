import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';

class AppointmentConfirmedScreen extends StatelessWidget {
  const AppointmentConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Booking',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 60),
              ),

              const SizedBox(height: 24),

              const Text(
                'Appointment confirmed',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 48),

              PraimaryButtom(
                text: 'submit',
                onpressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/mainNavigation',
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
