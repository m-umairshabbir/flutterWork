import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/Bloc/TodoBloc/todo_bloc.dart';
import 'package:todo_bloc_app/Screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>TodoBloc())
        ], child:const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    ));
  }
}
