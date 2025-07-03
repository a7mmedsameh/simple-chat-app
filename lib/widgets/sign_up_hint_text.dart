
import 'package:flutter/material.dart';
import 'package:project_10/pages/sign_up_page.dart';

class SignUpHintText extends StatelessWidget {
  const SignUpHintText({
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
            'Don\'t have an account? ',
            style: TextStyle(color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                SignUpPage.id,
              );
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(color: Color(0xffc4e9e7)),
            ),
          ),
        ],
      ),
    );
  }
}
