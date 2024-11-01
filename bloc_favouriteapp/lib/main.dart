import 'package:bloc_favouriteapp/Bloc/my_fav_bloc.dart';
import 'package:bloc_favouriteapp/Repository/fav_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>MyFavBloc(MyFavRepo()))
      ],
      child: MaterialApp(
        title: "Favourite App",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home:const FavouriteScreen(),
      ),
    );
  }
}
