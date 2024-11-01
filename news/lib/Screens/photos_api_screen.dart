import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Bloc/PhotoBloc/photo_api_event.dart';

import '../Bloc/PhotoBloc/photo_api_bloc.dart';
import '../Bloc/PhotoBloc/photo_api_state.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PhotoApiBloc>().add(PhotoFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo Api'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: BlocBuilder<PhotoApiBloc, PhotoApiState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.photoList.length,
                  itemBuilder: (context, index) {
                    final item=state.photoList[index];
                    return Card(
                      child: ListTile(
                        leading:  CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(item.url.toString()),

                        ),


                        title: Text(item.title.toString()),
                      ),
                    );
                  },
                );
              },
            )));
  }
}
