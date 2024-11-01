import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Bloc/ComplexJsonBloc/user_event.dart';

import '../Bloc/ComplexJsonBloc/user_bloc.dart';
import '../Bloc/ComplexJsonBloc/user_state.dart';

class UsersApiScreen extends StatefulWidget {
  const UsersApiScreen({super.key});

  @override
  State<UsersApiScreen> createState() => _UsersApiScreenState();
}

class _UsersApiScreenState extends State<UsersApiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserBloc>().add(FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data from api"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {

            return ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (context, index) {
                  final item = state.userList[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  item.phone.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.address!.city.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),

                                      Text(item.address!.street
                                          .toString()),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(item.address!.suite.toString())

                                ])
                          ],
                        ),
                      ),
                    ),
                  );

                });
          },
        ),
      ),
    );
  }
}
