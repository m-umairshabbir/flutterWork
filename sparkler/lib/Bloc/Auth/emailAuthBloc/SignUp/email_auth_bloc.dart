import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkler/Bloc/Auth/emailAuthBloc/SignUp/email_auth_event.dart';
import 'package:sparkler/Bloc/Auth/emailAuthBloc/SignUp/email_auth_state.dart';
import 'package:sparkler/Repos/AuthRepo/EmailAuthRepo/SignUp/email_auth_repo.dart';



class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final EmailSignUpRep _authRepository=EmailSignUpRep();

  SignUpBloc() : super(const SignUpState()) {
    on<SignUpButtonPressed>(_onSignUpButtonPressed);
  }

  void _onSignUpButtonPressed(SignUpButtonPressed event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.loading)); // Emit loading state
    try {
      await _authRepository.emailSignUp(event.email, event.password); // Call the repository method
      emit(state.copyWith(status: SignUpStatus.success)); // Emit success state
    } catch (e) {
      emit(state.copyWith(status: SignUpStatus.failure, error: e.toString())); // Emit failure state
    }
  }
}
