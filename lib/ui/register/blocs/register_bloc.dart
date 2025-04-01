import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  void _onNameChanged(RegisterNameChanged event, Emitter<RegisterState> emit) {
    final isNameValid = event.name.isNotEmpty;
    emit(state.copyWith(
      name: event.name,
      isNameValid: isNameValid,
      isFormValid: _validateForm(
        nameValid: isNameValid,
        phoneValid: state.isPhoneValid,
        emailValid: state.isEmailValid,
        passwordValid: state.isPasswordValid,
        confirmPasswordValid: state.isConfirmPasswordValid,
        name: event.name,
        phone: state.phone,
        email: state.email,
        password: state.password,
        confirmPassword: state.confirmPassword,
      ),
    ));
  }

  void _onPhoneChanged(RegisterPhoneChanged event, Emitter<RegisterState> emit) {
    // Đơn giản hóa kiểm tra số điện thoại: ít nhất 10 số
    final isPhoneValid = event.phone.length >= 10 && RegExp(r'^\d+$').hasMatch(event.phone);
    emit(state.copyWith(
      phone: event.phone,
      isPhoneValid: isPhoneValid,
      isFormValid: _validateForm(
        nameValid: state.isNameValid,
        phoneValid: isPhoneValid,
        emailValid: state.isEmailValid,
        passwordValid: state.isPasswordValid,
        confirmPasswordValid: state.isConfirmPasswordValid,
        name: state.name,
        phone: event.phone,
        email: state.email,
        password: state.password,
        confirmPassword: state.confirmPassword,
      ),
    ));
  }

  void _onEmailChanged(RegisterEmailChanged event, Emitter<RegisterState> emit) {
    final isEmailValid = EmailValidator.validate(event.email);
    emit(state.copyWith(
      email: event.email,
      isEmailValid: isEmailValid,
      isFormValid: _validateForm(
        nameValid: state.isNameValid,
        phoneValid: state.isPhoneValid,
        emailValid: isEmailValid,
        passwordValid: state.isPasswordValid,
        confirmPasswordValid: state.isConfirmPasswordValid,
        name: state.name,
        phone: state.phone,
        email: event.email,
        password: state.password,
        confirmPassword: state.confirmPassword,
      ),
    ));
  }

  void _onPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    // Mật khẩu phải có ít nhất 6 ký tự
    final isPasswordValid = event.password.length >= 6;
    final isConfirmPasswordValid = event.password == state.confirmPassword;

    emit(state.copyWith(
      password: event.password,
      isPasswordValid: isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid,
      isFormValid: _validateForm(
        nameValid: state.isNameValid,
        phoneValid: state.isPhoneValid,
        emailValid: state.isEmailValid,
        passwordValid: isPasswordValid,
        confirmPasswordValid: isConfirmPasswordValid,
        name: state.name,
        phone: state.phone,
        email: state.email,
        password: event.password,
        confirmPassword: state.confirmPassword,
      ),
    ));
  }

  void _onConfirmPasswordChanged(RegisterConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    final isConfirmPasswordValid = state.password == event.confirmPassword;
    emit(state.copyWith(
      confirmPassword: event.confirmPassword,
      isConfirmPasswordValid: isConfirmPasswordValid,
      isFormValid: _validateForm(
        nameValid: state.isNameValid,
        phoneValid: state.isPhoneValid,
        emailValid: state.isEmailValid,
        passwordValid: state.isPasswordValid,
        confirmPasswordValid: isConfirmPasswordValid,
        name: state.name,
        phone: state.phone,
        email: state.email,
        password: state.password,
        confirmPassword: event.confirmPassword,
      ),
    ));
  }

  bool _validateForm({
    required bool nameValid,
    required bool phoneValid,
    required bool emailValid,
    required bool passwordValid,
    required bool confirmPasswordValid,
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return nameValid &&
        phoneValid &&
        emailValid &&
        passwordValid &&
        confirmPasswordValid &&
        name.isNotEmpty &&
        phone.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty;
  }

  void _onSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    if (state.isFormValid) {
      emit(state.copyWith(status: RegisterStatus.loading));
      try {
        // Gọi API đăng ký ở đây
        // Ví dụ:
        // await authRepository.register(
        //   name: state.name,
        //   phone: state.phone,
        //   email: state.email,
        //   password: state.password,
        // );

        // Giả lập delay để mô phỏng gọi API
        await Future.delayed(const Duration(seconds: 2));

        emit(state.copyWith(status: RegisterStatus.success));
      } catch (e) {
        emit(state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: e.toString(),
        ));
      }
    }
  }
}