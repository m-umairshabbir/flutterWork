import 'package:equatable/equatable.dart';

class FavItemModel extends Equatable{

  final String value;
  final String id;
  final bool isDeleting;
  final bool isFav;

  const FavItemModel(
      {
        required this.value,
        required this.id,
        this.isDeleting = false,
        this.isFav = false
      }
      );

  FavItemModel copyWith({String? id,String? value,bool? isDeleting,bool? isFav}){
    return FavItemModel(
      value: value ?? this.value,
      id: id ??this.id,
      isDeleting: isDeleting ?? this.isDeleting,
      isFav: isFav ?? this.isFav,
    );
  }

  @override
  List<Object?> get props => [id,value,isFav,isDeleting];

}