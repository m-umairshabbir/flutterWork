
import 'package:equatable/equatable.dart';
import 'package:news/Bloc/PostBloc/post_api_bloc.dart';

abstract class PostApiEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class PostFetch extends PostApiEvent{}
