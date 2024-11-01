import 'package:bloc/bloc.dart';
import 'package:news/Bloc/PostBloc/post_api_event.dart';
import 'package:news/Bloc/PostBloc/post_api_state.dart';
import 'package:news/Models/PostModel/post_model.dart';
import 'package:news/Repositories/PostRepo/post_repo.dart';

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  final PostRepository postRepository = PostRepository(); // Instantiate the repository here

  PostApiBloc() : super(const PostApiState()) {
    on<PostFetch>(_fetchApi);
  }

  void _fetchApi(PostFetch event, Emitter<PostApiState> emit) async {
    emit(state.copyWith(status: PostStatus.loading)); // Emit loading state

    try {
      final posts = await postRepository.fetchApiData(); // Fetch posts from repository
      emit(state.copyWith(postList: posts, status: PostStatus.success)); // Emit success state with posts
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure, message: e.toString())); // Emit failure state
    }
  }
}
