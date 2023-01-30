import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/trello_bg_bl.svg',
              height: SizeConfig.screenHeight * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Trello",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(36),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
