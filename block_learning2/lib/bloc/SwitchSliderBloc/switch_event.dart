import 'package:equatable/equatable.dart';
abstract class SwitchEvent extends Equatable{

  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent{}
class SliderHandler extends SwitchEvent{
  final double slider;
  const SliderHandler({required this.slider});

  @override
  List<Object> get props=>[slider];
}