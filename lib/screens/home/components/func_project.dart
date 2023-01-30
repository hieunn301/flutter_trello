import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_trello/constants.dart';
import 'package:flutter_trello/screens/home/components/section_title.dart';
import 'package:flutter_trello/size_config.dart';

class Func extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
        vertical: getProportionateScreenWidth(10),
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Creat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* class Creat extends StatelessWidget {
  const Creat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.add,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Creat",
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
        ),
      ],
    );
  }
}

class Read extends StatelessWidget {
  const Read({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.book,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Read",
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
        ),
      ],
    );
  }
}

class Update extends StatelessWidget {
  const Update({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.update,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Update",
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
        ),
      ],
    );
  }
}

class Remove extends StatelessWidget {
  const Remove({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.delete,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Remove",
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
        ),
      ],
    );
  }
}
 */