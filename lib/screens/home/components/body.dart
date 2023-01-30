import 'package:flutter/material.dart';
import 'package:flutter_trello/components/task.dart';
import 'package:flutter_trello/constants.dart';
import 'package:flutter_trello/main.dart';
import 'package:flutter_trello/screens/home/widgets/task_widget.dart';
import 'package:flutter_trello/utils/constanst.dart';
import 'package:flutter_trello/utils/strings.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'work_space.dart';
import 'home_header.dart';
import 'func_project.dart';
import 'list_project.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<SliderDrawerState> dKey = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final base = BaseWidget.of(context);
    var textTheme = Theme.of(context).textTheme;
    return ValueListenableBuilder(
        valueListenable: base.dataStore.listenToTask(),
        builder: (ctx, Box<Task> box, Widget? child) {
          var tasks = box.values.toList();
          tasks.sort(((a, b) => a.createdAtDate.compareTo(b.createdAtDate)));
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),
                  HomeHeader(),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  ListProjects(),
                  SizedBox(height: getProportionateScreenWidth(30)),
                  WorkSpace(tasks, textTheme, base),
                ],
              ),
            ),
          );
        });
  }

  /* SizedBox WorkSpace(
    List<Task> tasks,
    BaseWidget base,
    TextTheme textTheme,
  ) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(55, 0, 0, 0),
            width: double.infinity,
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation(kPrimaryColor),
                    backgroundColor: Colors.grey,
                    value: checkDoneTask(tasks) / valueOfTheIndicator(tasks),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyString.mainTitle, style: textTheme.headline1),
                    const SizedBox(
                      height: 3,
                    ),
                    Text("${checkDoneTask(tasks)} of ${tasks.length} task",
                        style: textTheme.subtitle1),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 585,
            child: tasks.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      var task = tasks[index];

                      return Dismissible(
                        direction: DismissDirection.horizontal,
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.delete_outline,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(MyString.deletedTask,
                                style: TextStyle(
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                        onDismissed: (direction) {
                          base.dataStore.dalateTask(task: task);
                        },
                        key: Key(task.id),
                        child: TaskWidget(
                          task: tasks[index],
                        ),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Lottie.asset(
                            lottieURL,
                            animate: tasks.isNotEmpty ? false : true,
                          ),
                        ),
                      ),
                      FadeInUp(
                        from: 30,
                        child: const Text(MyString.doneAllTask),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  } */
}
