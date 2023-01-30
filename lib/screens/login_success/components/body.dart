import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_trello/components/default_button.dart';
import 'package:flutter_trello/screens/home/home_screen.dart';
import 'package:flutter_trello/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        SvgPicture.asset(
          "assets/icons/success1.svg",
          height: SizeConfig.screenHeight * 0.4,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        /* Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ), */
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
