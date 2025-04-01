import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final RegisterStatus status;
  final String? errorMessage;
  final bool isNameValid;
  final bool isPhoneValid;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isFormValid;

  const RegisterState({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.status = RegisterStatus.initial,
    this.errorMessage,
    this.isNameValid = true,
    this.isPhoneValid = true,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isConfirmPasswordValid = true,
    this.isFormValid = false,
  });

  RegisterState copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
    RegisterStatus? status,
    String? errorMessage,
    bool? isNameValid,
    bool? isPhoneValid,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isFormValid,
  }) {
    return RegisterState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isNameValid: isNameValid ?? this.isNameValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
    password,
    confirmPassword,
    status,
    errorMessage,
    isNameValid,
    isPhoneValid,
    isEmailValid,
    isPasswordValid,
    isConfirmPasswordValid,
    isFormValid,
  ];
}