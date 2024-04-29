import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Config/string.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsIamge.boyPic),
            SvgPicture.asset(AssetsIamge.connectSVG),
            Image.asset(AssetsIamge.girlPic)
          ],
        ),
        SizedBox(height: 30),
        Text(
          WelcomePageString.nowYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomePageString.connected,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 30),
        Text(
          WelcomePageString.discription,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    );
  }
}
