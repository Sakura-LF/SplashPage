import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splashpage/common/app_colors.dart';
import 'package:splashpage/common/assets.dart';
import 'package:splashpage/pages/welcome.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // 计数变量
  final duration = 3;
  int number = 0;

  // 倒计时函数
  Future<void> _countDown() async {
    number = duration;
    // 倒计时
    for (var i = 0; i < duration; i++) {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          if (mounted == true) {
            setState(() {
              number--;
            });
          }
        },
      );
      // 倒计时结束后跳转welcomePage
      if (number == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomePage(),
          ),
        );
      }
    }
  }

  initState() {
    super.initState();
    // 倒计时
    _countDown();
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // log
          // 将 logo 单独抽取出来
          _buildLogo(),

          const SizedBox(
            height: 27,
          ),
          // 文字
          // 将文字也单独抽取出来
          const Text(
            "Online Market",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "LXGW",
                height: 22 / 19),
          ),
          const SizedBox(
            height: 27,
          ),

          // 计数器
          Text(
            number > 0 ? "$number" : "done",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 22 / 19),
          )
        ],
      ),
    );
  }

  // Logo组件
  Widget _buildLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        // 图片
        Image.asset(AssetImages.logoPng)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 背景色
      backgroundColor: AppColors.backgroundSplash,
      body: _buildView(context),
    );
  }
}
