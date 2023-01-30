import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trello/components/task.dart';
import 'package:flutter_trello/constants.dart';
import 'package:flutter_trello/main.dart';
import 'package:flutter_trello/screens/home/widgets/task_widget.dart';
import 'package:flutter_trello/size_config.dart';
import 'package:flutter_trello/utils/constanst.dart';
import 'package:flutter_trello/utils/strings.dart';
import 'package:lottie/lottie.dart';

Padding WorkSpace(List<Task> tasks, TextTheme textTheme, BaseWidget base) {
  int checkDoneTask(List<Task> task) {
    int i = 0;
    for (Task doneTasks in task) {
      if (doneTasks.isCompleted) {
        i++;
      }
    }
    return i;
  }

  dynamic valueOfTheIndicator(List<Task> task) {
    if (task.isNotEmpty) {
      return task.length;
    } else {
      return 3;
    }
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
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
                  Text(
                    MyString.mainTitle,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(
                        20,
                      ),
                    ),
                  ),
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
}
