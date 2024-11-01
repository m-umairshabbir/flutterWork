import 'dart:io';

import 'package:block_learning2/bloc/ImagePickerBlock/image_picker_bloc.dart';
import 'package:block_learning2/bloc/ImagePickerBlock/image_picker_event.dart';
import 'package:block_learning2/bloc/ImagePickerBlock/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: const Text('Image Picker App'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
              if (state.file == null) {
                return InkWell(
                  onTap: () {
                    context.read<ImageBloc>().add(CameraImageCapture());
                  },
                  child: const Icon(Icons.camera),
                );
              } else {
                return Image.file(File(state.file!.path.toString()));
              }
            }),
            const SizedBox(
              width: 30,
            ),
            BlocBuilder<ImageBloc,ImageState>(builder: (context,state){
              if(state.file==null){
                return
              }
            })
          ],
        ),
      ),
    );
  }
}
