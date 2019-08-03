import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  String username = '';
}

class NotLoggedIn extends LoginState {
  @override
  String toString() {
    return "LoginState.NotLoggedIn";
  }
}

class IsLoggingIn extends LoginState{
  String password;

  IsLoggingIn({username, password}) {
    this.username = username;
    this.password = password;
  }

  @override
  String toString() {
  return "LoginState.IsLoggingIn: $username, $password";
   }
}

class LoggedIn extends LoginState {
  String token;

  LoggedIn({username, token}) {
    this.token = token;
    this.username = username;
  }

  @override
  String toString() {
  return "LoginState.IsLoggingIn: $username, $token";
   }
}

