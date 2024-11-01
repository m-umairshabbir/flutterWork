import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkler/Bloc/Auth/emailAuthBloc/SignIn/sign_in_event.dart';
import 'package:sparkler/Bloc/Auth/emailAuthBloc/SignIn/sign_in_state.dart';
import '../../../../Repos/AuthRepo/EmailAuthRepo/SignIn/sign_in_repo.dart';



class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final EmailSignInRep _authRepository=EmailSignInRep();

  SignInBloc() : super(const SignInState()) {
    on<SignInButtonPressed>(_onSignInButtonPressed);
  }

  void _onSignInButtonPressed(SignInButtonPressed event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: SignInStatus.loading)); // Emit loading state
    try {
      await _authRepository.emailSignIn(event.email, event.password); // Call the repository method
      emit(state.copyWith(status: SignInStatus.success)); // Emit success state
    } catch (e) {
      emit(state.copyWith(status: SignInStatus.failure, error: e.toString())); // Emit failure state
    }
  }
}
