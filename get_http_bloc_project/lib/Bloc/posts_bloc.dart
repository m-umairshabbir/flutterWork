import 'package:bloc/bloc.dart';
import 'package:get_http_bloc_project/Bloc/posts_event.dart';
import 'package:get_http_bloc_project/Bloc/posts_state.dart';
import 'package:get_http_bloc_project/Models/posts_model/post-model.dart';
import 'package:get_http_bloc_project/Repositories/post_repository/post_repo.dart';

import '../Utils/enums/post_enums.dart';

class PostBloc extends Bloc<PostsEvents,PostStates>{

  List<PostModel> tempPostList=[];
  PostRepository postRepository=PostRepository();
   PostBloc():super(const PostStates()){
     on<PostFetched>(fetchPostApi);
     on<SearchItem>(_filterList);
  }
  void fetchPostApi(PostFetched event,Emitter<PostStates> emit)async{
    await postRepository.fetchPost().then((value){
       emit(state.copyWith(postStatus: PostStatus.success,message:'success',postList: value));

     }).onError((error,stackTrace){
       emit(state.copyWith(postStatus: PostStatus.failure,message: error.toString()));
     });
  }
  void _filterList(SearchItem event,Emitter<PostStates> emit)async{
     if(event.stSearch.isEmpty){
       emit(state.copyWith(tempPostList: [],searchMessage:''));
     }else{
       // below line will be used when we will be dealing with numbers or id instead of email
       //tempPostList=state.postList.where((element)=>element.id.toString()==event.stSearch.toString()).toList();

       tempPostList=state.postList.where((element)=>element.email.toString().toLowerCase().contains(event.stSearch.toLowerCase())).toList();

       if(tempPostList.isEmpty){
         emit(state.copyWith(tempPostList: tempPostList,searchMessage: "No Results Found"));
       }else{
         emit(state.copyWith(tempPostList: tempPostList,searchMessage: ''));
       }
     }

  }
}