import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trello/components/task.dart';
import 'package:flutter_trello/constants.dart';
import 'package:flutter_trello/data/hive_data_store.dart';
import 'package:flutter_trello/routes.dart';
import 'package:flutter_trello/screens/home/home_screen.dart';
import 'package:flutter_trello/screens/splash/splash_screen.dart';
import 'package:flutter_trello/screens/tasks/task_view.dart';
import 'package:flutter_trello/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

/* void main() {
  runApp(MyApp());
} */
Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Task>(TaskAdapter());

  /// Open box
  var box = await Hive.openBox<Task>("tasksBox");

  box.values.forEach((task) {
    if (task.createdAtTime.day != DateTime.now().day) {
      task.delete();
    } else {}
  });

  runApp(BaseWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      /* theme: theme(), */
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
          headline3: TextStyle(
            color: Color.fromARGB(255, 234, 234, 234),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          headline4: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          headline5: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          subtitle2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          headline6: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);
  final HiveDataStore dataStore = HiveDataStore();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class FAB extends StatelessWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => TaskView(
              taskControllerForSubtitle: null,
              taskControllerForTitle: null,
              task: null,
            ),
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 10,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
