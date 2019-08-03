import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => NotLoggedIn();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    print("sesuatu ====================");
    if (event is TryLoginUser) {
      yield IsLoggingIn(username: event.username, password: event.password);
      final res = await fetchLogin(username: event.username, password: event.password);
      print('666666');
      print('$res');
      if (res['error'] == 'null') {
        print('kdaf');
        yield LoggedIn(username: event.username, token: res['token']);
      } else {
        print('sdfs');
        yield NotLoggedIn();
      }
    } else if (event is TryLogoutUser) {
      yield NotLoggedIn();
    }
  }

  Future fetchLogin({String username, String password}) async {
    Client client = Client();
    var body = json.encode({"user": username, "pass": password});

    String url = 'http://sys.delica.co.id/api/index.php/login';
    print(body);
    final response = await client.post(Uri.encodeFull(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body);
    if (response.statusCode != 200) {
      print(response.body);
      throw Exception("Login is not Valid");
    } else {
      final result = json.decode(response.body);
      print(result);
      return result;
    }
  }
}
