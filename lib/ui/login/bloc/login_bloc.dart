import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        // Giả lập quá trình xác thực
        await Future.delayed(Duration(seconds: 2));

        if (event.email == "test@gmail.com" && event.password == "123456") {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(error: "Sai tài khoản hoặc mật khẩu"));
        }
      } catch (e) {
        emit(LoginFailure(error: "Đăng nhập thất bại"));
      }
    });
  }
}
