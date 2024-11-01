import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/PostBloc/post_api_bloc.dart';
import '../Bloc/PostBloc/post_api_event.dart';
import '../Bloc/PostBloc/post_api_state.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostApiBloc>().add(PostFetch());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    PostApiBloc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostApiBloc, PostApiState>(
        builder: (context, state) {
          if (state.status == PostStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == PostStatus.failure) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state.status == PostStatus.success) {
            return ListView.builder(
              itemCount: state.postList.length,
              itemBuilder: (context, index) {
                final post = state.postList[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:ListTile(
                      leading: Text(post.userId.toString()+','+post.id.toString()),
                      title: Text(post.title.toString()),
                      subtitle: Text(post.body.toString()),
                    )

                  ),
                );
              },
            );
          }
          return const Center(child: Text('No posts found.'));
        },
      ),
    );
  }
}
