import 'package:bloc/bloc.dart';
import 'package:edcr_sup_flutter/common/repo/repo.dart';
import 'package:edcr_sup_flutter/features/auth/bloc/login_event.dart';
import 'package:edcr_sup_flutter/features/auth/bloc/login_state.dart';
import 'package:edcr_sup_flutter/features/auth/data/user_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {

    on<LoginPostEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        UserModel? userModel = await loginRepository.postLogin(
            userId: event.userId, password: event.password, token: event.token);

        if(userModel != null && userModel.status == "True"){
          emit(LoginSuccessState(userModel!!));
        }else{
          emit(LoginErrorState("Invalid credentials!"));
        }
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
