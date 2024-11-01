import 'package:equatable/equatable.dart';

abstract class PhoneSignUpEvent extends Equatable{
  @override
  List<Object> get props=>[];
}

class OnPhoneSignUpPressed extends PhoneSignUpEvent{
 final String phone ;
  OnPhoneSignUpPressed({required this.phone});
}