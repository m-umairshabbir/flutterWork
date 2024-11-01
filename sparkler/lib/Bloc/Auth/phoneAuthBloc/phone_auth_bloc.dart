import 'package:bloc/bloc.dart';
import 'package:sparkler/Bloc/Auth/phoneAuthBloc/phone_auth_event.dart';
import 'package:sparkler/Bloc/Auth/phoneAuthBloc/phone_auth_state.dart';
import 'package:sparkler/Repos/AuthRepo/PhoneAuthRepo/SignUp/phone_signup_repo.dart';

class PhoneSignUpBloc extends Bloc<PhoneSignUpEvent,PhoneSignUpState>{
  PhoneSignUpBloc():super(const PhoneSignUpState()){
    on<OnPhoneSignUpPressed>(_onPhoneSignUpPressed);
  }



  void _onPhoneSignUpPressed(OnPhoneSignUpPressed event , Emitter<PhoneSignUpState> emit ){
    emit(state.copyWith(status: PhoneAuthStatus.loading));
    try{
      PhoneSignUpRepo _phoneRepo=PhoneSignUpRepo(phone: event.phone);

    }
  }
}