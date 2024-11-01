import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/Bloc/ComplexJsonBloc/user_event.dart';
import 'package:news/Bloc/ComplexJsonBloc/user_state.dart';
import 'package:news/Models/ComplexJsonModel/UserModel.dart';
import 'package:news/Repositories/UserApiRepo/user_repo.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  List<UserModel> userList=[];
  UserRepo userRepo=UserRepo();
  UserBloc():super(UserState()){
    on<FetchUser>(_fetchUser);
  }


  FutureOr<void> _fetchUser(FetchUser event, Emitter<UserState> emit) async{
    userList=await userRepo.fetchData();
    emit(state.copyWith(userList: userList));
  }
}