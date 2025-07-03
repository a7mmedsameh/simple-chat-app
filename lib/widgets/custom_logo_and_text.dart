import 'package:flutter/material.dart';
import 'package:project_10/constants/constants.dart';

class CustomLogoAndText extends StatelessWidget {
  const CustomLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 70),
      child: Column(
        children: [
          Image.asset(kLogo, height: 100),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Scholar Chat',
                style: TextStyle(
                  fontFamily: 'Pacifico-Regular',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
