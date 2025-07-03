import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_10/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:project_10/cubits/signup_cubit/sign_up_cubit.dart';
import 'package:project_10/firebase_options.dart';
import 'package:project_10/pages/chat_page.dart';
import 'package:project_10/pages/sign_in_page.dart';
import 'package:project_10/pages/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(create: (context) => SignInCubit()),
        BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        routes: {
          SignInPage.id: (context) => const SignInPage(),
          SignUpPage.id: (context) => const SignUpPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: SignInPage.id,
      ),
    );
  }
}
