import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_http_bloc_project/Bloc/posts_bloc.dart';
import 'package:get_http_bloc_project/Ui/posts/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PostBloc()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Get HTTP Bloc Project',
          home: PostsScreen(),
        ));
  }
}
