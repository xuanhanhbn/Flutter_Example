import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final String imagePath;
  final String label;

  CustomImageButton({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64, // Điều chỉnh chiều rộng của hình ảnh theo nhu cầu
          height: 64, // Điều chỉnh chiều cao của hình ảnh theo nhu cầu
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
