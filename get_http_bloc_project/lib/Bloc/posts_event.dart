import 'package:equatable/equatable.dart';

abstract class PostsEvents extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostFetched extends PostsEvents{}
class SearchItem extends PostsEvents{
  final String stSearch;
  SearchItem(this.stSearch);

}