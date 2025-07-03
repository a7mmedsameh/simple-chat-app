import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_10/cubits/signup_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  Future<void> signUp(String email, String password) async {
    emit(SignUpLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccessState(email: email));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          SignUpFailureState(
            errorMessage: 'The password provided is too weak.',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignUpFailureState(
            errorMessage: 'The account already exists for that email.',
          ),
        );
      } else {
        emit(SignUpFailureState(errorMessage: 'invalid email or password.'));
      }
    } catch (e) {
      emit(
        SignUpFailureState(
          errorMessage: 'there was an error, try again later.',
        ),
      );
    }
  }
}
