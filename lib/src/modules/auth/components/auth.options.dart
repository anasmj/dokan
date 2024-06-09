import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AuthOptoins extends StatelessWidget {
  const AuthOptoins({super.key});
  ButtonStyle get buttonStyle => IconButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: IconButton.filled(
            style: buttonStyle,
            onPressed: () {},
            icon: SvgPicture.asset(
              fit: BoxFit.cover,
              'assets/icons/facebook.svg',
              height: 30,
            ),
          ),
        ),
        const Gap(20),
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: IconButton(
            style: buttonStyle,
            onPressed: () {},
            icon: SvgPicture.asset(
              fit: BoxFit.cover,
              'assets/icons/google.svg',
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}
