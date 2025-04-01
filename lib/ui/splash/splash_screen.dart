import 'package:flutter/material.dart';
import 'package:waste_managament/generated/assets.gen.dart';

import '../../constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // Future<void> _checkAppState(BuildContext context) async{
  //   // Kiem tra xem co kOnboardingCompleted
  //   final isComplete = await _isOnboardingCompleted();
  //   if(isComplete){
  //     // di chuyen den man hinh welcome
  //     if(!context.mounted){
  //       return;
  //     }
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const WelcomePage(
  //           isFirstTimeInstallApp:false,
  //         ),
  //       ),
  //     );
  //   }else{
  //     if(!context.mounted){
  //       return;
  //     }
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const OnboardingPageView(),
  //       ),
  //     );
  //   }
  // }
  // Future<bool> _isOnboardingCompleted() async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final result = prefs.getBool("kOnboardingComplete");
  //     return result ?? false;
  //   }catch(e){
  //     return false;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    // _checkAppState(context);s
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
          Text("Đoàn kết quyết tâm\nvà các bước tạo nên một trái đất không rác thải",
                    style: TextStyle(color: AppColors.primaryText,),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
