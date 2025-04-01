import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetBottomSignUp extends StatelessWidget {
  const WidgetBottomSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bạn chưa có tài khoản?',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Đăng kí',
              style: TextStyle(
                color: Color(0xFF2ED47A),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
