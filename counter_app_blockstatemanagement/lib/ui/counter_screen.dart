import 'package:counter_app_blockstatemanagement/Bloc/counter_bloc.dart';
import 'package:counter_app_blockstatemanagement/Bloc/counter_event.dart';
import 'package:counter_app_blockstatemanagement/Bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: const TextStyle(fontSize: 60),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    }, child: const Text("Increment")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                }, child: const Text("Decrement"))
              ],
            )
          ],
        ));
  }
}
