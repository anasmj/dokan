import 'package:flutter/material.dart';

class GradiantIconButton extends StatelessWidget {
  const GradiantIconButton(
      {super.key, this.iconData, this.onPressed, this.size = 30});
  final IconData? iconData;
  final VoidCallback? onPressed;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Colors.red,
            ],
          ),
        ),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
