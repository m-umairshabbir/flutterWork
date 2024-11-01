import 'package:bloc_favouriteapp/Bloc/my_fav_bloc.dart';
import 'package:bloc_favouriteapp/Bloc/my_fav_event.dart';
import 'package:bloc_favouriteapp/Bloc/my_fav_state.dart';
import 'package:bloc_favouriteapp/model/fav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyFavBloc>().add(FetchMyFavList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Favourite App"),
        actions: [BlocBuilder<MyFavBloc, MyFavState>(
          builder: (context, state) {
            return Visibility(
              visible: state.tempMyFavList.isNotEmpty,
              child: IconButton(onPressed: () {
                context.read<MyFavBloc>().add(DeleteItem());
              },
                  icon: const Icon(Icons.delete, color: Colors.red,)),
            );
          },
        )
        ],
      ),
      body: BlocBuilder<MyFavBloc, MyFavState>(builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          case ListStatus.failure:
            return const Center(
              child: Text('No favourite data found'),
            );
          case ListStatus.success:
            return ListView.builder(
                itemCount: state.myFavList.length,
                itemBuilder: (context, index) {
                  final item = state.myFavList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Card(
                      child: ListTile(
                        leading: Checkbox(
                            value: state.tempMyFavList.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if (value!) {
                                context
                                    .read<MyFavBloc>()
                                    .add(PickedList(item: item));
                              } else {
                                context
                                    .read<MyFavBloc>()
                                    .add(UnPickedList(item: item));
                              }
                            }),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavItemModel itemModel = FavItemModel(
                                value: item.value,
                                id: item.id,
                                isFav: item.isFav ? false : true,
                              );
                              context
                                  .read<MyFavBloc>()
                                  .add(IsFavourite(item: itemModel));
                            },
                            icon: Icon(
                              item.isFav
                                  ? Icons.favorite
                                  : Icons.favorite_outline_sharp,
                              color: item.isFav ? Colors.pink : Colors.grey,
                            )),
                      ),
                    ),
                  );
                });
        }
      }),
    );
  }
}
