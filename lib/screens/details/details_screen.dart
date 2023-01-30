import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProjectDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProjectDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      /* appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          rating: agrs.project.rating,
          ),
      ), */
      // body: Body(project: agrs.project),
    );
  }
}

class ProjectDetailsArguments {
  // final Project project;

  /* ProjectDetailsArguments({
    required this.project,
  }); */
}
