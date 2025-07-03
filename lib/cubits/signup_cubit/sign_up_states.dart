class SignUpState {}


class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final String email;
  SignUpSuccessState({required this.email});
}

class SignUpFailureState extends SignUpState {
  final String errorMessage;
  SignUpFailureState({required this.errorMessage});
}
