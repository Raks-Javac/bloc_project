part of 'counter_cubit_cubit.dart';

class CounterCubitState extends Equatable {
  final int counter;
  CounterCubitState({
    required this.counter,
  });

  factory CounterCubitState.initialState() {
    return CounterCubitState(counter: 0);
  }

  @override
  String toString() => 'CounterCubitState(counter: $counter)';

  @override
  List<Object?> get props => [counter];

  CounterCubitState copyWith({
    int? counter,
  }) {
    return CounterCubitState(
      counter: counter ?? this.counter,
    );
  }
}
