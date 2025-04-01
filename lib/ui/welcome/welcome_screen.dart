import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [_buildTitleScreen(), _buildButtonScreen()]),
    );
  }

  Widget _buildTitleScreen() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.welcome.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.green.withOpacity(0.8), // Lớp phủ màu xanh
      ),
    );
  }

  Widget _buildButtonScreen() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chào mừng',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8),
                Text(
                  'Bắt đầu trở thành vị cứu tinh của trái đất!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.5, // Tăng khoảng cách dòng
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Đăng nhập', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Đăng kí', style: TextStyle(fontSize: 16),),
                ),
                SizedBox(height: 60),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
