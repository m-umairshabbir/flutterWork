import '../model/fav_item_model.dart';

class MyFavRepo {

  Future<List<FavItemModel>>  fetchItem()async{
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavItemModel> _generateList(int length){
    return List.generate(length, (index)=>FavItemModel(value:'Task $index' , id:index.toString() ));
  }
}
