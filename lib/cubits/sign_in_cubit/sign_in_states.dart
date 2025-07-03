class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final String email;
  SignInSuccessState({required this.email});
}

class SignInFailureState extends SignInState {
  final String errorMessage;
  SignInFailureState({required this.errorMessage});
}
