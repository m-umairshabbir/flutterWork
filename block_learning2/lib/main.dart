import 'package:block_learning2/Ui/image_picker.dart';
import 'package:block_learning2/Ui/switch_screen.dart';
import 'package:block_learning2/Utils/image_picker_utils.dart';
import 'package:block_learning2/bloc/ImagePickerBlock/image_picker_bloc.dart';
import 'package:block_learning2/bloc/SwitchSliderBloc//switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>SwitchBloc()),
        BlocProvider(create: (context)=>ImageBloc(ImagePickerUtils())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
