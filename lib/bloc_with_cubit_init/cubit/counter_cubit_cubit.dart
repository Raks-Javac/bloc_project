import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitState.initialState());

//this increments the counter state with only the value passed in the cubitstate in copywith
  void incrementCounter() {
    final newState = state.copyWith(counter: state.counter + 1);
    emit(newState);
  }

  void deCrementCounter() {
    final newState = state.copyWith(counter: state.counter - 1);
    emit(newState);
  }
}
