import 'package:flutter/material.dart';

class StyleButton extends StatelessWidget {
  const StyleButton({
    super.key,
    this.text,
    this.width,
    this.height,
    this.radius,
    this.onPressed,
  });

  // 将需要的属性抽取出来
  final String? text;
  final double? width;
  final double? height;
  final double? radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFF7F00),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 32),
          ),
        ),
        child: Text(
          text ?? " ",
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Colors.white,
            height: 26 / 16,
          ),
        ),
      ),
    );
  }
}
