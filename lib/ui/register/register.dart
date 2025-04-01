import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/register_bloc.dart';
import 'blocs/register_event.dart';
import 'blocs/register_state.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onNameChanged);
    _phoneController.addListener(_onPhoneChanged);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _confirmPasswordController.addListener(_onConfirmPasswordChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onNameChanged() {
    context.read<RegisterBloc>().add(RegisterNameChanged(_nameController.text));
  }

  void _onPhoneChanged() {
    context.read<RegisterBloc>().add(RegisterPhoneChanged(_phoneController.text));
  }

  void _onEmailChanged() {
    context.read<RegisterBloc>().add(RegisterEmailChanged(_emailController.text));
  }

  void _onPasswordChanged() {
    context.read<RegisterBloc>().add(RegisterPasswordChanged(_passwordController.text));
  }

  void _onConfirmPasswordChanged() {
    context.read<RegisterBloc>().add(RegisterConfirmPasswordChanged(_confirmPasswordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          // Chuyển đến màn hình tiếp theo sau khi đăng ký thành công
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Đăng ký thành công!')),
            );
          // Navigator.of(context).pushReplacementNamed('/home'); // Chuyển đến màn hình chính
        }

        if (state.status == RegisterStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Đăng ký thất bại!'),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF2ED47A),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Green top section with registration title
              Container(
                padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'để tạo tài khoản!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              // White registration form section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Full Name field
                    _buildNameField(),

                    // Phone Number field
                    _buildPhoneField(),

                    // Email field
                    _buildEmailField(),

                    // Password field
                    _buildPasswordField(),

                    // Confirm Password field
                    _buildConfirmPasswordField(),

                    // Register button
                    _buildRegisterButton(),

                    // Login link
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Đã có tài khoản?',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Điều hướng đến màn hình đăng nhập
                              // Navigator.of(context).pushReplacementNamed('/login');
                            },
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                color: Color(0xFF2ED47A),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
      previous.name != current.name || previous.isNameValid != current.isNameValid,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  'Họ và tên',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Họ và tên đầy đủ',
                  hintStyle: TextStyle(color: Colors.grey),
                  errorText: !state.isNameValid && state.name.isNotEmpty
                      ? 'Tên không hợp lệ'
                      : null,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2ED47A)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPhoneField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
      previous.phone != current.phone || previous.isPhoneValid != current.isPhoneValid,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  'Số điện thoại',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '08xx-xxxx-xxxx',
                  hintStyle: TextStyle(color: Colors.grey),
                  errorText: !state.isPhoneValid && state.phone.isNotEmpty
                      ? 'Số điện thoại không hợp lệ'
                      : null,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2ED47A)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmailField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
      previous.email != current.email || previous.isEmailValid != current.isEmailValid,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'xxxxx@gmail.com',
                  hintStyle: TextStyle(color: Colors.grey),
                  errorText: !state.isEmailValid && state.email.isNotEmpty
                      ? 'Email không hợp lệ'
                      : null,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2ED47A)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
      previous.password != current.password || previous.isPasswordValid != current.isPasswordValid,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  'Mật khẩu',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: '••••••••••••',
                  hintStyle: TextStyle(color: Colors.grey),
                  errorText: !state.isPasswordValid && state.password.isNotEmpty
                      ? 'Mật khẩu phải có ít nhất 6 ký tự'
                      : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2ED47A)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
      previous.confirmPassword != current.confirmPassword ||
          previous.isConfirmPasswordValid != current.isConfirmPasswordValid,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  'Xác nhận mật khẩu',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: '••••••••••••',
                  hintStyle: TextStyle(color: Colors.grey),
                  errorText: !state.isConfirmPasswordValid && state.confirmPassword.isNotEmpty
                      ? 'Mật khẩu không khớp'
                      : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2ED47A)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRegisterButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
      previous.isFormValid != current.isFormValid ||
          previous.status != current.status,
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2ED47A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 0,
            ),
            onPressed: state.isFormValid && state.status != RegisterStatus.loading
                ? () {
              context.read<RegisterBloc>().add(RegisterSubmitted());
            }
                : null,
            child: state.status == RegisterStatus.loading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
              'Đăng ký',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}