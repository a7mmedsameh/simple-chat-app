import 'package:flutter/material.dart';
import 'package:project_10/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textButton, required this.onTap});
  final String textButton;
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            textButton,
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
