import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waste_managament/generated/assets.gen.dart';
import '../../constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.go('/home');  // chuyển sang trang chính
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(child: _buildBodyPage()),
    );
  }

  Widget _buildBodyPage() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconSplash(),
          _buildTextSplash(),
          _buildTitleSplash(),
        ],
      ),
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      AssetGenImage('assets/images/logo.png').path,
      width: 147,
      height: 147,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        'Phân loại rác',
        style: TextStyle(
          fontSize: 24,
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTitleSplash() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            "Đoàn kết quyết tâm\nvà các bước tạo nên một trái đất không rác thải",
            style: TextStyle(color: AppColors.primaryText),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
