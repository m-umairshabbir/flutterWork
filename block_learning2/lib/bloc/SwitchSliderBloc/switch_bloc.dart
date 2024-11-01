  import 'package:bloc/bloc.dart';
  import 'package:block_learning2/bloc/SwitchSliderBloc//switch_event.dart';
  import 'package:block_learning2/bloc/SwitchSliderBloc//switch_state.dart';

  class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
    SwitchBloc():super(const SwitchState()){
      on<EnableOrDisableNotification>(_enableOrDisableNotification);
      on<SliderHandler>(_sliderHandler);
    }

    void _enableOrDisableNotification(EnableOrDisableNotification event,Emitter<SwitchState> emit)
    {
      emit(state.copyWith(isEnabled:!state.isEnabled));
    }
    void _sliderHandler(SliderHandler event, Emitter<SwitchState> emit){
      emit(state.copyWith(slider:event.slider));
    }
  }