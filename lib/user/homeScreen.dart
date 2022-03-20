import 'package:flutter/material.dart';
import 'package:purehours/widgets/scaffold.dart';
import 'package:purehours/widgets/listviewBuilder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'PureHours Timetable',
      'Subjects',
      'Faculty',
      'Resources',
      'Entertainment',
      'Zoom Meetings',
      'Skills'
    ];
    return CustomScaffold(
      title: "Pure Hours",
      body: CustomListviewBuilder(items: items),
    );
  }
}
