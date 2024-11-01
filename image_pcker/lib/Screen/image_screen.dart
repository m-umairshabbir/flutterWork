import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/imageBloc/image_bloc.dart';
import '../bloc/imageBloc/image_event.dart';
import '../bloc/imageBloc/image_state.dart';

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
      body: Center(
        child: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state.file == null) {
              // When no image is picked, show camera and gallery icons
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Camera Icon
                  InkWell(
                    onTap: () {
                      context.read<ImageBloc>().add(CameraCapture());
                    },
                    child:const  CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  // Gallery Icon
                  InkWell(
                    onTap: () {
                      context.read<ImageBloc>().add(GalleryPicker());
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child:  Icon(
                        Icons.photo,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              // When an image is picked, show the image
              return Expanded(
                child: Image.file(
                  File(state.file!.path),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
