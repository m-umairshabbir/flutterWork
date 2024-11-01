import 'package:bloc/bloc.dart';
import 'package:bloc_favouriteapp/Bloc/my_fav_event.dart';
import 'package:bloc_favouriteapp/Bloc/my_fav_state.dart';
import 'package:bloc_favouriteapp/Repository/fav_repo.dart';
import 'package:bloc_favouriteapp/model/fav_item_model.dart';

class MyFavBloc extends Bloc<MyFavEvent,MyFavState>{
  MyFavRepo myFavRepo;
  List<FavItemModel> favItemList=[];
  List<FavItemModel> tempFavItemList=[];

   MyFavBloc(this.myFavRepo):super(const MyFavState()){
     on<FetchMyFavList>(fetchList);
     on<IsFavourite>(isFav);
     on<PickedList>(pickedList);
     on<UnPickedList>(unPickedList);
     on<DeleteItem>(deleteItem);
   }

   void fetchList(FetchMyFavList event,Emitter<MyFavState> emit)async{
    favItemList = await myFavRepo.fetchItem();
     emit(state.copyWith(myFavList:List.from(favItemList), listStatus:ListStatus.success));
   }
   void isFav(IsFavourite event,Emitter<MyFavState> emit)async{
     final index=favItemList.indexWhere((element)=>element.id==event.item.id);
     if(event.item.isFav){
       if(tempFavItemList.contains(favItemList[index])){
         tempFavItemList.remove(favItemList[index]);
         tempFavItemList.add(event.item);
       }
     }
     favItemList[index]=event.item;
     emit(state.copyWith(myFavList:List.from(favItemList),tempMyFavList:List.from(tempFavItemList) ));
   }
   void pickedList(PickedList event,Emitter<MyFavState> emit)async{
    tempFavItemList.add(event.item);
    emit(state.copyWith(tempMyFavList:List.from(tempFavItemList)));
   }
   void unPickedList(UnPickedList event,Emitter<MyFavState> emit)async{
     tempFavItemList.remove(event.item);
     emit(state.copyWith(tempMyFavList:List.from(tempFavItemList)));
   }
   void deleteItem(DeleteItem event,Emitter<MyFavState> emit)async{
     for(int i=0;i<tempFavItemList.length;i++){
       favItemList.remove(tempFavItemList[i]);
     }
     tempFavItemList.clear();
     emit(state.copyWith(
         myFavList:List.from(favItemList),
         tempMyFavList:List.from(tempFavItemList),
     ));
   }

}