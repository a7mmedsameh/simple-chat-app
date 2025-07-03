import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_10/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:project_10/cubits/sign_in_cubit/sign_in_states.dart';
import 'package:project_10/helpers/show_snack_bar_helper.dart';
import 'package:project_10/pages/chat_page.dart';
import 'package:project_10/constants/constants.dart';
import 'package:project_10/widgets/custom_button.dart';
import 'package:project_10/widgets/custom_logo_and_text.dart';
import 'package:project_10/widgets/custom_text_form_field.dart';
import 'package:project_10/widgets/sign_up_hint_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static String id = 'LoginPage';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            ChatPage.id,
            arguments: state.email,
          );
        } else if (state is SignInFailureState) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: Colors.white,
          inAsyncCall: state is SignInLoadingState,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const CustomLogoAndText(),
                    const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      onchange: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      onchange: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      textButton: 'Sign In',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignInCubit>(
                            context,
                          ).signIn(email!, password!);
                        }
                      },
                    ),
                    const SignUpHintText(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
