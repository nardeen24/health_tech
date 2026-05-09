import 'package:flutter/material.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';

class CardDoctor extends StatelessWidget {
  const CardDoctor({
    super.key,
    required this.doctorImage,
    required this.doctorName,
    required this.doctorSpecialize,
  });

  final String doctorImage;
  final String doctorName;
  final String doctorSpecialize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                doctorImage,
                width: 100,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        doctorName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    doctorSpecialize,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      const Text(
                        "4.8",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  PraimaryButtom(onpressed: () {}, text: "Make Appointment"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
