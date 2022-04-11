import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Icon icon;
  final bool showIcon;
  final parameters;
  const CustomScaffold(
      {Key? key,
      required this.title,
      required this.body,
      this.showIcon = true,
      this.parameters,
      this.icon = const Icon(Icons.search)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: showIcon
                  ? IconButton(
                      onPressed: () {
                        if (parameters == null) {
                          Navigator.of(context).pushNamed('/$title');
                        } else {
                          Navigator.of(context)
                              .pushNamed('/$title', arguments: parameters);
                        }
                      },
                      icon: icon,
                    )
                  : null)
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
