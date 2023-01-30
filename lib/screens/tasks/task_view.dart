// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_trello/components/task.dart';
import 'package:flutter_trello/constants.dart';
import 'package:flutter_trello/main.dart';
import 'package:flutter_trello/size_config.dart';
import 'package:flutter_trello/utils/constanst.dart';
import 'package:flutter_trello/utils/strings.dart';
import 'package:intl/intl.dart';

class TaskView extends StatefulWidget {
  TaskView({
    Key? key,
    required this.taskControllerForTitle,
    required this.taskControllerForSubtitle,
    required this.task,
  }) : super(key: key);

  TextEditingController? taskControllerForTitle;
  TextEditingController? taskControllerForSubtitle;
  final Task? task;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  var title;
  var subtitle;
  DateTime? time;
  DateTime? date;

  String showTime(DateTime? time) {
    if (widget.task?.createdAtTime == null) {
      if (time == null) {
        return DateFormat('hh:mm a').format(DateTime.now()).toString();
      } else {
        return DateFormat('hh:mm a').format(time).toString();
      }
    } else {
      return DateFormat('hh:mm a')
          .format(widget.task!.createdAtTime)
          .toString();
    }
  }

  DateTime showTimeAsDateTime(DateTime? time) {
    if (widget.task?.createdAtTime == null) {
      if (time == null) {
        return DateTime.now();
      } else {
        return time;
      }
    } else {
      return widget.task!.createdAtTime;
    }
  }

  String showDate(DateTime? date) {
    if (widget.task?.createdAtDate == null) {
      if (date == null) {
        return DateFormat.yMMMEd().format(DateTime.now()).toString();
      } else {
        return DateFormat.yMMMEd().format(date).toString();
      }
    } else {
      return DateFormat.yMMMEd().format(widget.task!.createdAtDate).toString();
    }
  }

  DateTime showDateAsDateTime(DateTime? date) {
    if (widget.task?.createdAtDate == null) {
      if (date == null) {
        return DateTime.now();
      } else {
        return date;
      }
    } else {
      return widget.task!.createdAtDate;
    }
  }

  bool isTaskAlreadyExistBool() {
    if (widget.taskControllerForTitle?.text == null &&
        widget.taskControllerForSubtitle?.text == null) {
      return true;
    } else {
      return false;
    }
  }

  dynamic isTaskAlreadyExistUpdateTask() {
    if (widget.taskControllerForTitle?.text != null &&
        widget.taskControllerForSubtitle?.text != null) {
      try {
        widget.taskControllerForTitle?.text = title;
        widget.taskControllerForSubtitle?.text = subtitle;

        widget.task?.createdAtDate = date!;
        widget.task?.createdAtTime = time!;

        widget.task?.save();
        Navigator.of(context).pop();
      } catch (error) {
        nothingEnterOnUpdateTaskMode(context);
      }
    } else {
      if (title != null && subtitle != null) {
        var task = Task.create(
          title: title,
          createdAtTime: time,
          createdAtDate: date,
          subtitle: subtitle,
        );
        BaseWidget.of(context).dataStore.addTask(task: task);
        Navigator.of(context).pop();
      } else {
        emptyFieldsWarning(context);
      }
    }
  }

  dynamic deleteTask() {
    return widget.task?.delete();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTopText(textTheme),
                  _buildMiddleTextFieldsANDTimeAndDateSelection(
                      context, textTheme),
                  _buildBottomButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Expanded(
        child: Row(
          mainAxisAlignment: isTaskAlreadyExistBool()
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: [
            isTaskAlreadyExistBool()
                ? Container()
                : Container(
                    width: 150,
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minWidth: 150,
                      height: 30,
                      onPressed: () {
                        deleteTask();
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.close,
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            MyString.deleteTask,
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minWidth: 150,
              height: 55,
              onPressed: () {
                isTaskAlreadyExistUpdateTask();
              },
              color: kPrimaryColor,
              child: Text(
                isTaskAlreadyExistBool()
                    ? MyString.addTaskString
                    : MyString.updateTaskString,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildMiddleTextFieldsANDTimeAndDateSelection(
      BuildContext context, TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 485,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              MyString.titleOfTitleTextField,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(
                  28,
                ),
              ),
            ),
          ), */

/*           //title
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller: widget.taskControllerForTitle,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Title Task",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onFieldSubmitted: (value) {
                  title = value;
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
          ), */

          const SizedBox(
            height: 10,
          ),

          // note
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller: widget.taskControllerForSubtitle,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit_note, color: Colors.grey),
                  border: InputBorder.none,
                  counter: Container(),
                  hintText: "Title Task",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onFieldSubmitted: (value) {
                  subtitle = value;
                },
                onChanged: (value) {
                  subtitle = value;
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller: widget.taskControllerForSubtitle,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.bookmark_border, color: Colors.grey),
                  border: InputBorder.none,
                  counter: Container(),
                  hintText: MyString.addNote,
                ),
                onFieldSubmitted: (value) {
                  subtitle = value;
                },
                onChanged: (value) {
                  subtitle = value;
                },
              ),
            ),
          ),

          // Time
          GestureDetector(
            onTap: () {
              DatePicker.showTimePicker(context,
                  showTitleActions: true,
                  showSecondsColumn: false,
                  onChanged: (_) {}, onConfirm: (selectedTime) {
                setState(() {
                  if (widget.task?.createdAtTime == null) {
                    time = selectedTime;
                  } else {
                    widget.task!.createdAtTime = selectedTime;
                  }
                });

                FocusManager.instance.primaryFocus?.unfocus();
              }, currentTime: showTimeAsDateTime(time));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.timeString,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100),
                    child: Center(
                      child: Text(
                        showTime(time),
                        style: textTheme.subtitle2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Date Picker
          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  maxTime: DateTime(2030, 3, 5),
                  onChanged: (_) {}, onConfirm: (selectedDate) {
                setState(() {
                  if (widget.task?.createdAtDate == null) {
                    date = selectedDate;
                  } else {
                    widget.task!.createdAtDate = selectedDate;
                  }
                });
                FocusManager.instance.primaryFocus?.unfocus();
              }, currentTime: showDateAsDateTime(date));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.dateString,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 140,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100),
                    child: Center(
                      child: Text(
                        showDate(date),
                        style: textTheme.subtitle2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildTopText(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 35,
            child: Divider(
              thickness: 2,
            ),
          ),
          RichText(
            text: TextSpan(
              text: isTaskAlreadyExistBool()
                  ? MyString.addNewTask
                  : MyString.updateCurrentTask,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black),
              children: const [
                TextSpan(
                  text: MyString.taskString,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 35,
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
