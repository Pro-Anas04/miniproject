import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String initials;
  final double radius;
  final VoidCallback? onCameraPressed;

  const ProfileAvatar({
    super.key,
    required this.initials,
    this.radius = 50,
    this.onCameraPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            borderRadius: BorderRadius.circular(radius + 10),
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.blue.shade100,
            child: Text(
              initials,
              style: TextStyle(
                fontSize: radius * 0.56, // Scaled based on radius
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onCameraPressed,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
