import 'package:bloctest/counter/bloc/counter_bloc.dart';
import 'package:bloctest/counter/counter_page.dart';
import 'package:bloctest/home/bloc/login_bloc.dart';
import 'package:bloctest/home/home.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());

} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: BlocProvider<LoginBloc> (
        builder: (context) => LoginBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
