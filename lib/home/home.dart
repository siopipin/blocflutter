import 'package:bloctest/counter/counter_page.dart';
import 'package:bloctest/home/bloc/bloc.dart';
import 'package:bloctest/home/bloc/login_bloc.dart';
import 'package:bloctest/home/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController cname = new TextEditingController();
  TextEditingController cpass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.vpn_key)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.check_box_outline_blank)),
              ],
            ),
            title: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                String toDisplay = '';
                if (state is IsLoggingIn) {
                  toDisplay = '...';
                } else {
                  toDisplay = '${state.username}';
                }
                return Text(toDisplay);
              },
            ),
          ),
          body: TabBarView(
            children: [
              BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoggedIn) {
                  return logoutPage();
                } else if(state is NotLoggedIn) {
                  return loginPage();
                } else {
                  return Center(child: CircularProgressIndicator(),);
                }
              },
            ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginPage() {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Center(
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  leading: Icon(Icons.people_outline),
                  title: TextField(
                    controller: cname,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: TextField(
                    controller: cpass,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                ),
              ),
              Container(
                  child: RaisedButton(
                onPressed: () {
                  loginBloc.dispatch(
                      TryLoginUser(username: cname.text, password: cpass.text));
                },
                child: Text("Login"),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutPage() {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            loginBloc.dispatch(TryLogoutUser());
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
