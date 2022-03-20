import 'package:flutter/material.dart';
import 'package:purehours/widgets/listviewBuilder.dart';
import 'package:purehours/widgets/scaffold.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    List<String> items = ['Sleeping', 'Coding', 'Sleeping Again'];
    return CustomScaffold(
        title: "Skills",
        icon: true,
        body: CustomListviewBuilder(
          items: items,
          push: false,
        ));
  }
}
