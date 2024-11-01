import 'package:block_learning2/bloc/SwitchSliderBloc//switch_bloc.dart';
import 'package:block_learning2/bloc/SwitchSliderBloc//switch_event.dart';
import 'package:block_learning2/bloc/SwitchSliderBloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Controller"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Notifications",
                    style: TextStyle(fontSize: 30),
                  ),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous,current)=>previous.isEnabled!=current.isEnabled,
                    builder: (context, state) {
                      return Switch(
                          value: state.isEnabled,
                          onChanged: (newValue) {
                            context
                                .read<SwitchBloc>()
                                .add(EnableOrDisableNotification());
                          });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous,current)=>previous.slider!=current.slider,
                  builder: (context, state) {
                return Slider(
                    value: state.slider,
                    onChanged: (newValue) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderHandler(slider: newValue));
                    });
              }),
            ],
          )),
    );
  }
}
