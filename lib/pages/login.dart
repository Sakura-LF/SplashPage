import 'package:flutter/material.dart';
import 'package:splashpage/common/app_colors.dart';
import 'package:splashpage/common/assets.dart';
import 'package:splashpage/common/stylebutton.dart';
import 'package:splashpage/pages/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 验证用户名是否有效
  bool isValidAUserName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 背景色
      backgroundColor: AppColors.backgroundSplash,
      body: _buildView(context),
    );
  }

  Widget _buildView(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          _buildLogo(),
          const SizedBox(
            height: 21,
          ),
          // 文本1
          _buildText(),
          // 文本2
          _buildText2(),
          const SizedBox(
            height: 56,
          ),
          _buildLoginForm(),
        ],
      ),
    );
  }

  _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 57),
      child: Image.asset(
        AssetImages.logoPng,
        height: 57,
        width: 60,
      ),
    );
  }

  _buildText() {
    return const Text(
      "Let's Sign You In",
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Colors.white,
          height: 30 / 20),
    );
  }

  _buildText2() {
    return const Text(
      "Welcom back, you've been missed!",
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 13,
        color: Colors.white,
        height: 20 / 13,
      ),
    );
  }

  _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 35),
      width: 346,
      height: 418,
      decoration: BoxDecoration(
        color: Colors.white,
        // 圆角
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        children: [
          // Text
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Username or Em-Mail",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Color(0xff838383),
                height: 23 / 15,
              ),
            ),
          ),

          // 用户名和密码
          TextField(
            // 监听用户名输入, 判断用户名是否有效
            onChanged: (value) {
              if (value.length >= 6) {
                setState(() {
                  isValidAUserName = true;
                });
              } else {
                setState(() {
                  isValidAUserName = false;
                });
              }
            },
            decoration: InputDecoration(
              labelText: "Username or Em-Mail",
              hintText: "请输入用户名或邮箱",
              prefixIcon: Image.asset(
                AssetImages.userPng,
                height: 22,
                width: 22,
              ),
              // 如果 isValidAUserName 是否判断用户名是否有效
              suffixIcon: isValidAUserName == true
                  ? Image.asset(
                      AssetImages.checkPng,
                      height: 16,
                      width: 24,
                    )
                  : null,
            ),
          ),

          const SizedBox(
            height: 36,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Color(0xff838383),
                height: 23 / 15,
              ),
            ),
          ),
          // 密码框
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "请输入密码",
              prefixIcon: Image.asset(
                AssetImages.lockPng,
                height: 26,
                width: 19,
              ),
              suffixIcon: Image.asset(
                AssetImages.forgetPng,
                height: 23,
                width: 57,
              ),
            ),
          ),

          const SizedBox(
            height: 29,
          ),
          // 登录按钮
          StyleButton(
            text: "Sign in",
            height: 57,
            width: 309,
            radius: 18,
            onPressed: () {},
          ),

          const SizedBox(
            height: 16,
          ),
          // 注册按钮
          Row(
            // 水平居中
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an accout?",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  height: 1 / 15,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    height: 1 / 15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


