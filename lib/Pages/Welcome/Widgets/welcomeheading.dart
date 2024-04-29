import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Config/string.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsIamge.appIconSVG,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(AppString.appName,
                  style: Theme.of(context).textTheme.headlineLarge)
      ],
    );
  }
}
