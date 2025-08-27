import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback? ontap;
  final int? id;
  final double? width;
  final double? height;
  final double? icon_size;
  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
    required this.ontap,
    this.id,
    this.height,
    this.width,
    this.icon_size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            width: width,
            height: height,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(icon, color: Colors.white, size: icon_size)],
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
