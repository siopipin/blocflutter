import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class TryLoginUser extends LoginEvent {
  String username;
  String password;

  TryLoginUser({@required username, @required password }){
    this.username = username;
    this.password = password;
  }

  @override
  String toString() {
    return "LoginEvent.TryLoginUser: $username, $password";
  }
}

class TryLogoutUser extends LoginEvent {
  @override
  String toString() {
    return "LoginEvent.UserLogoedOut";
  }
}