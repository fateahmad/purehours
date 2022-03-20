import 'package:flutter/material.dart';

class DaySelection extends StatefulWidget {
  const DaySelection({Key? key}) : super(key: key);

  @override
  State<DaySelection> createState() => _DaySelection();
}

class _DaySelection extends State<DaySelection> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
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

  void pushTo(int index) {
    switch (index) {
      case 1:
        Navigator.of(context).pushNamed('/details');
        break;
      default:
    }
  }
}
