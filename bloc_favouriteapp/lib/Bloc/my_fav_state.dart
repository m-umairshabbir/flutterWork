import 'package:bloc_favouriteapp/model/fav_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, failure, success }

class MyFavState extends Equatable {
  final List<FavItemModel> myFavList;
  final List<FavItemModel> tempMyFavList;
  final ListStatus listStatus;
  const MyFavState(
      {this.tempMyFavList=const[],this.listStatus = ListStatus.loading, this.myFavList = const []});

  MyFavState copyWith({List<FavItemModel>? tempMyFavList,List<FavItemModel>? myFavList, ListStatus? listStatus}) {
    return MyFavState(
      listStatus: listStatus ?? this.listStatus,
      tempMyFavList: tempMyFavList ?? this.tempMyFavList,
      myFavList: myFavList ?? this.myFavList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [myFavList,listStatus,tempMyFavList];
}
