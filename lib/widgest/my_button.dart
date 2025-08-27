import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback? ontap;
  final Color? color;
  final double? width;
  final double? height;
  final double? fontsize;
  const MyButton({
    super.key,
    required this.color,
    required this.height,
    required this.ontap,
    required this.title,
    required this.width,
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: GestureDetector(
          onTap: ontap,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
