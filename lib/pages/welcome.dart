import 'package:flutter/material.dart';
import 'package:splashpage/common/assets.dart';
import 'package:splashpage/common/stylebutton.dart';
import 'package:splashpage/pages/login.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  // BuildContext? get context => null;

  Widget _buildView(BuildContext context) {
    return Column(
      // 主轴一对齐方式
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 将文字单独抽取出来
        _buildText(),

        // 图片
        _buildImage(),

        // 按钮组
        // 左右布局
        _buildButtons(context)
      ],
    );
  }

  Padding _buildButtons(BuildContext context) {
    return Padding(
      // 水平 20 的对称 padding
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          // Skip
          TextButton(
              onPressed: () {},
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Color(0xff2B2A2A),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              )),

          // 使用弹性布局弹开
          const Spacer(),
          // Login
          // 登录按钮
          // 登录按钮
          // Get Started
          StyleButton(
            text: "Get Started",
            width: 139,
            height: 42,
            radius: 32,
            onPressed: () {
              // 跳转
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Image _buildImage() {
    return Image.asset(
      AssetImages.welcomePng,
      height: 409,
      // 宽度自适应
      width: double.infinity,
      fit: BoxFit.none,
    );
  }

  Padding _buildText() {
    return const Padding(
      // 设置水平左右两边的边距
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Text(
        "This is Sakura WelcomePage, Have a nice day!",
        style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            height: 22 / 19),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(context),
    );
  }
}
