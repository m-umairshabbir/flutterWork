import 'package:equatable/equatable.dart';

enum SignUpStatus { initial, loading, success, failure }

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String error;

  const SignUpState({
    this.status = SignUpStatus.initial,
    this.error = '',
  });

  SignUpState copyWith({
    SignUpStatus? status,
    String? error,
  }) {
    return SignUpState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, error];
}
