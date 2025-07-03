
import 'package:flutter/material.dart';
import 'package:project_10/pages/sign_in_page.dart';

class SignInHintText extends StatelessWidget {
  const SignInHintText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, SignInPage.id);
            },
            child: const Text(
              'Sign In',
              style: TextStyle(color: Color(0xffc4e9e7)),
            ),
          ),
        ],
      ),
    );
  }
}
