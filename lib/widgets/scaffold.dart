import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool icon;
  const CustomScaffold(
      {Key? key, required this.title, required this.body, this.icon = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/editSkills');
              },
              icon: Icon(icon ? Icons.edit : null),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/back.jpg'),
          fit: BoxFit.cover,
        )),
        child: body,
      ),
    );
  }
}
