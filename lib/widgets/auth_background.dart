import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const AuthBackground({
    super.key,
    required this.imagePath,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),

          // Dark overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.60),
                ],
              ),
            ),
          ),

          // Pink glow
          Positioned(
            top: -80,
            right: -70,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFF5FA2)
                    .withOpacity(0.18),
              ),
            ),
          ),

          child,
        ],
      ),
    );
  }
}
