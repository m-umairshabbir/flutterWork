import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_pcker/Utils/image_picker_utils.dart';
import 'package:image_pcker/bloc/ToDoBloc/todo_bloc.dart';
import 'package:image_pcker/Screen/todo_screen.dart';
import 'bloc/imageBloc/image_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ImageBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc()),
      ],
      child:const MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}
