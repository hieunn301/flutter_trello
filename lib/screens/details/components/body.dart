import 'package:flutter/material.dart';
import 'package:flutter_trello/components/default_button.dart';
import 'package:flutter_trello/screens/details/components/project_description.dart';
import 'package:flutter_trello/size_config.dart';

import 'color_dots.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  // final Project project;

  const Body({
    Key? key,
    // required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ProjectImages(project: project),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProjectDescription(
                // project: project,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    // ColorDots(project: project),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
