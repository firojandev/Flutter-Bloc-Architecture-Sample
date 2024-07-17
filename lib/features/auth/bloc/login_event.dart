import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];

}

class LoginPostEvent extends LoginEvent {
  final String userId;
  final String password;
  final String token;

  LoginPostEvent(this.userId, this.password, this.token);

  @override
  List<Object> get props => [userId,password,token];


}
