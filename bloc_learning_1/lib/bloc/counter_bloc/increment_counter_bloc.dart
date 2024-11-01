
import 'package:bloc/bloc.dart';
import 'package:bloc_learning_1/bloc/counter_bloc/increment_counter_event.dart';
import 'package:bloc_learning_1/bloc/counter_bloc/increment_counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(const CounterState()){
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(IncrementEvent event , Emitter<CounterState> emit){
    emit(state.copyWith( state.counter+1));
  }
  void _decrement(DecrementEvent event,Emitter<CounterState> emit){
    emit(state.copyWith(state.counter-1));
  }
}