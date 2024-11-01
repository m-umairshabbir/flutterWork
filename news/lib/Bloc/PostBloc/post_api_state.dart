
import 'package:equatable/equatable.dart';

import '../../Models/PostModel/post_model.dart';

enum PostStatus{loading,success,failure}

class PostApiState extends Equatable {

  final List<PostModel> postList;
  final PostStatus status;
  final String message;

  const PostApiState( {
    this.postList = const [],
    this.message = '',
    this.status=PostStatus.loading,});

  PostApiState copyWith(
      { List<PostModel>? postList, String? state, String? message,PostStatus? status}) {
    return PostApiState(
        postList: postList ?? this.postList, message: message ?? this.message,status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postList, message,status];

}
