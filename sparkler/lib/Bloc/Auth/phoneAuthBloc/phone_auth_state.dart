import 'package:equatable/equatable.dart';

enum PhoneAuthStatus{initial,loading,failure,success}
class PhoneSignUpState extends Equatable{

  final PhoneAuthStatus status;
  final String error;

  const PhoneSignUpState(
      {
        this.status=PhoneAuthStatus.initial,
        this.error='',
      }
      );

  PhoneSignUpState copyWith({
    PhoneAuthStatus? status,
    String? error,
  }) {
    return PhoneSignUpState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [status,error];

}