import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CounterBloc extends Bloc<String, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(
    String namaevent,
  ) async* {
    switch (namaevent) {
      case 'naik':
        yield currentState + 1;
        break;
      case 'turun':
        yield currentState - 1;
        break;
      case 'reset':
        yield 0;
        break;
    }
  }
}
