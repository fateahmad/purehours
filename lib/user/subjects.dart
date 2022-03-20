import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  State<Subjects> createState() => _Subjects();
}

class _Subjects extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'SRE',
      'SDA',
      'DSA',
      'Dynamic Subjects',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pure Hours"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () => Navigator.of(context).pushNamed('/details'),
              horizontalTitleGap: 20,
              minVerticalPadding: 16,
              leading: CircleAvatar(
                radius: 30,
                child: Text(
                  items[index][0],
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              title: Text(
                items[index],
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
