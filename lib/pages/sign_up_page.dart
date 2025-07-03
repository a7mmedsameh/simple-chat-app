import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_10/cubits/signup_cubit/sign_up_cubit.dart';
import 'package:project_10/cubits/signup_cubit/sign_up_states.dart';
import 'package:project_10/helpers/show_snack_bar_helper.dart';
import 'package:project_10/pages/chat_page.dart';
import 'package:project_10/constants/constants.dart';
import 'package:project_10/widgets/custom_button.dart';
import 'package:project_10/widgets/custom_logo_and_text.dart';
import 'package:project_10/widgets/custom_text_form_field.dart';
import 'package:project_10/widgets/sign_in_hint_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String id = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            ChatPage.id,
            arguments: state.email,
          );
        } else if (state is SignUpFailureState) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: Colors.white,
          inAsyncCall: state is SignUpLoadingState,
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
                      'Sign up',
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
                      textButton: 'Sign Up',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(
                            context,
                          ).signUp(email!, password!);
                        }
                      },
                    ),
                    const SignInHintText(),
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
