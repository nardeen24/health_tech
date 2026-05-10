import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  const HeaderWidget({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: height * 0.26,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            decoration: const BoxDecoration(
              color: ColorManager.primaryColor,
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
                      "Hi, $userName",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Welcome in HealthTech",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
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
            bottom: 14,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search By Name, Locations",
                  prefixIcon: Icon(Icons.search, color: Color(0xFF1A4578)),
                  suffixIcon: Icon(Icons.tune, color: Color(0xFF1A4578)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
