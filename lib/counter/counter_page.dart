import 'package:bloctest/counter/bloc/counter_bloc.dart';
import 'package:bloctest/counter/bloc/counter_event.dart';
import 'package:bloctest/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Container(
            child: Center(
              child: Text('$count', style: TextStyle(fontSize: 24.0),),
            ),
          );
        },
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                
                counterBloc.dispatch("naik");
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.dispatch('turun');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.ac_unit),
              onPressed: () {
                counterBloc.dispatch('reset');
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.ac_unit),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}