import 'package:equatable/equatable.dart';

import '../../Models/ComplexJsonModel/UserModel.dart';

class UserState extends Equatable{

  List<UserModel> userList;

   UserState({this.userList=const[]});

   UserState copyWith({List<UserModel>? userList}){
     return UserState(userList: userList ?? this.userList);
   }
  @override
  // TODO: implement props
  List<Object?> get props => [userList];
}