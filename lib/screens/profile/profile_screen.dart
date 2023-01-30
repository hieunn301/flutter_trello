import 'package:flutter/material.dart';
import 'package:flutter_trello/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_trello/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
