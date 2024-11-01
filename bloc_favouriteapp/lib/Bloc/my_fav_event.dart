import 'package:bloc_favouriteapp/model/fav_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class MyFavEvent extends Equatable{

  const MyFavEvent();
  @override
  List<Object> get props=>[];
}

class FetchMyFavList extends MyFavEvent{}

class IsFavourite extends MyFavEvent{

  final FavItemModel item;
  const IsFavourite({required this.item});

}
class PickedList extends MyFavEvent{
  final FavItemModel item;
  const PickedList({required this.item});
}
class UnPickedList extends MyFavEvent{
  final FavItemModel item;
  const UnPickedList({required this.item});
}
class DeleteItem extends MyFavEvent{}