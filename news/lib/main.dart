import 'package:flutter/material.dart';
import 'package:news/Bloc/PhotoBloc/photo_api_bloc.dart';
import 'package:news/Bloc/PostBloc/post_api_bloc.dart';
import 'package:news/Screens/data.dart';
import 'package:news/Screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Screens/photos_api_screen.dart';
import 'package:news/Screens/snackbar_practice.dart';
import 'package:news/Screens/users_api_screen.dart';

import 'Bloc/ComplexJsonBloc/user_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_)=>PostApiBloc()),
        BlocProvider(create: (_)=>PhotoApiBloc()),
        BlocProvider(create: (_)=>UserBloc()),

      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/5',
        routes: {
          '/':(context)=>const HomeScreen(),
          '/2':(context)=>const PostListScreen(),
          '/3':(context)=>const PhotoScreen(),
          '/4':(context)=>const SnackBarPractice(),
          '/5':(context)=>const UsersApiScreen(),
        },
      ),
    );
  }
}
