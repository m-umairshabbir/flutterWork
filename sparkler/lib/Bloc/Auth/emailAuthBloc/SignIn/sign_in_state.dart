import 'package:equatable/equatable.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState extends Equatable {
  final SignInStatus status;
  final String error;

  const SignInState({
    this.status = SignInStatus.initial,
    this.error = '',
  });

  SignInState copyWith({
    SignInStatus? status,
    String? error,
  }) {
    return SignInState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, error];
}
