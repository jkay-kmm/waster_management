import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';

class SplashTrashScreen extends StatelessWidget {
  const SplashTrashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Rác của tôi'),
      body: Column(
        children: [


        ],

      )
    );
  }
}
