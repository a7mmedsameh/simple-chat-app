import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_10/cubits/sign_in_cubit/sign_in_states.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitialState());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccessState(email: email));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(SignInFailureState(errorMessage: 'Invalid email or password.'));
      } else if (e.code == 'invalid-email') {
        emit(
          SignInFailureState(
            errorMessage: 'Please enter a valid email address.',
          ),
        );
      }
    } catch (e) {
      emit(
        SignInFailureState(
          errorMessage: 'there was an error, try again later.',
        ),
      );
    }
  }
}
