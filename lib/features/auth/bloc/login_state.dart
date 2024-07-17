import 'package:edcr_sup_flutter/features/auth/data/user_model.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel userModel;

  LoginSuccessState(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
