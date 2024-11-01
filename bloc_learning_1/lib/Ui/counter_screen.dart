import 'package:bloc_learning_1/bloc/counter_bloc/increment_counter_bloc.dart';
import 'package:bloc_learning_1/bloc/counter_bloc/increment_counter_event.dart';
import 'package:bloc_learning_1/bloc/counter_bloc/increment_counter_state.dart';
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
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Tap Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(
              builder: (context,state){
                return Text(state.counter.toString(),style: TextStyle(fontSize: 50),);
              }
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementEvent());
              }, child:const Text("Increment Tap")),
              const SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementEvent());
              }, child:const Text("Decrement Tap"))
            ],
          )
        ],
      ),
    );
  }
}
