import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_http_bloc_project/Bloc/posts_bloc.dart';
import 'package:get_http_bloc_project/Bloc/posts_event.dart';
import 'package:get_http_bloc_project/Bloc/posts_state.dart';
import 'package:get_http_bloc_project/Utils/enums/post_enums.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post API's"),
        backgroundColor: Colors.black.withOpacity(0.9),
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Text(state.message.toString());
          case PostStatus.success:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: TextFormField(
                      onTapOutside: (context) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onChanged: (value) {
                        context.read<PostBloc>().add(SearchItem(value));
                      },
                      decoration: const InputDecoration(
                          labelText: 'Search',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(
                            child: Text(state.searchMessage.toString()),
                          )
                        : ListView.builder(
                            itemCount: state.tempPostList.isEmpty
                                ? state.postList.length
                                : state.tempPostList.length,
                            itemBuilder: (context, index) {
                              if (state.tempPostList.isNotEmpty) {
                                final item = state.tempPostList[index];
                                return ListTile(
                                  title: Text(item.email.toString()),
                                  subtitle: Text(item.body.toString()),
                                );
                              } else {
                                final item = state.postList[index];
                                return ListTile(
                                  title: Text(item.email.toString()),
                                  subtitle: Text(item.body.toString()),
                                );
                              }
                            }),
                  ),
                ],
              ),
            );
        }
      }),
    );
  }
}
