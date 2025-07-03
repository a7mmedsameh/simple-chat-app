
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_10/helpers/show_snack_bar_helper.dart';
import 'package:project_10/pages/sign_in_page.dart';

class CustomIconButtonForSignOut extends StatelessWidget {
  const CustomIconButtonForSignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        try {
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, SignInPage.id);
        } on Exception {
          showSnackBar(
            context,
            'there was an error, try again later.',
          );
          return;
        }
      },
      icon: const Icon(Icons.logout, color: Colors.white),
    );
  }
}
